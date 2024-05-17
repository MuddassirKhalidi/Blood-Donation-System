import re
import psycopg2
from tabulate import tabulate 

def getPatientDetails():
    '''
    1. Asks if the patient is donor or a recipient
    2. If the patient is a donor call addDonor()
    3. If the patient is a recipient call addRecipient()
    '''
    name = input("Enter the patient's name: ").strip()
    contactInfo = input("Enter the patient's contact info: ").strip()
    bloodType_pattern = r'[ABO]{1,2}[+-]'
    while True:
        bloodType = input('Enter the blood type: ').strip()
        if re.match(bloodType_pattern, bloodType):
            break
        print('Invalid blood type')
    patientID = ''.join([x for x in name if x.isupper()]) + contactInfo[-1:-5:-1]
    return patientID, name, contactInfo, bloodType

def addDonor(vendorID):
    '''
    1. Insert data into the donatesblood table to record donor-vendor relationship
    2. Insert data into the attends table donor-nurse relationship
    '''
    patientID, name, contactInfo, bloodType = getPatientDetails()

    
    # Queries the database to return nurse IDs who work in the chosen vendor
    nurses_query = '''SELECT * FROM nurse WHERE nurseid IN 
                    (SELECT nurseid from vendor_nurse WHERE vendorid = %s)'''
    cursor.execute(nurses_query, (vendorID,))
    nurses = cursor.fetchall()
    print(tabulate(nurses, headers = ['Nurse ID','Name', 'Contact'], tablefmt = 'heavy_grid'))

    #Validates the nurse ID
    while True:
        nurseID = input('Enter Nurse ID from the table above: ').strip()
        if nurseID in [nurse[0] for nurse in nurses]:
            break
        print('Enter a valid Nurse ID')

    insert_patient_query = 'INSERT INTO patient VALUES(%s, %s, %s, %s)'
    try:
        cursor.execute(insert_patient_query, (patientID, name, contactInfo, bloodType))
    except psycopg2.errors.UniqueViolation:
        print('Patient details exist')
        print('Donating blood...')

    donateBlood(vendorID, patientID, nurseID, bloodType)   

def donateBlood(vendorID, donorID, nurseID, bloodType):
        get_current_inventory = 'SELECT vendorid, bloodtype FROM vendorbloodinventory WHERE vendorid = %s AND bloodtype = %s'
        cursor.execute(get_current_inventory, (vendorID, bloodType))
        if cursor.fetchall():
            inventory_update_query = '''UPDATE VendorBloodInventory
                                        SET Volume = Volume + 20
                                        WHERE VendorID = %s AND BloodType = %s'''
            cursor.execute(inventory_update_query, (vendorID, bloodType))
        else:
            insert_query = 'INSERT INTO vendorbloodinventory VALUES (%s, %s, %s)'
            cursor.execute(insert_query, (vendorID, bloodType, 20))
        
        donor_insert_query = 'INSERT INTO donor (vendorid, donorid, nurseid, amount_donated) VALUES(%s, %s, %s, %s)'
        cursor.execute(donor_insert_query, (vendorID, donorID, nurseID, 20))
        print('Thank you for your donation!')

     
def addRecipient(hospitalID):
    '''
    1. Insert data into the donatesblood table to record receiver-vendor relationship
    2. Insert data into the attends table receiver-nurse relationship
    '''
    patientID, name, contactInfo, bloodType = getPatientDetails()
    insert_patient_query = 'INSERT INTO patient VALUES(%s, %s, %s, %s)'
    try:
        cursor.execute(insert_patient_query, (patientID, name, contactInfo, bloodType))
    except psycopg2.errors.UniqueViolation:
        print('Patient details exist')
        print('Administering blood...')

    # Queries DB to show hospitals where the recipient's blood type is available (more than 50 units)
    show_hospitals_query = '''SELECT hospitalid FROM hospitalbloodinventory 
                            WHERE bloodtype = %s AND volume >= 50'''
    cursor.execute(show_hospitals_query, (bloodType,))
    hospitals = cursor.fetchall()
    if hospitals:
        hospitalIDs = [x[0] for x in hospitals]
        if hospitalID in hospitalIDs:
            get_available_blood = 'SELECT volume FROM hospitalbloodinventory WHERE hospitalid = %s AND bloodtype = %s'
            cursor.execute(get_available_blood, (hospitalID, bloodType))
            available_blood = cursor.fetchall()[0][0]
            print(available_blood)
            # Queries the database to return nurse IDs who work in the chosen vendor
            nurses_query = '''SELECT * FROM nurse WHERE nurseid IN 
                            (SELECT nurseid from hospital_nurse WHERE hospitalid = %s)'''
            cursor.execute(nurses_query, (hospitalID,))
            nurses = cursor.fetchall()
            print(tabulate(nurses, headers = ['Nurse ID','Name', 'Contact'], tablefmt = 'heavy_grid'))

            #Validates the nurse ID
            while True:
                nurseID = input('Enter Nurse ID from the table above: ').strip()
                if nurseID in [nurse[0] for nurse in nurses]:
                    break
                print('Enter a valid Nurse ID')

            administerBlood(hospitalID, patientID, nurseID, bloodType, available_blood)
        else:
            print(f'This hospital does not have enough {bloodType} blood')
    else:
        print(f'No hospitals have enough {bloodType} blood')
        
def administerBlood(hospitalID, recipientID, nurseID, bloodType, available_blood):
    while True:
        try: 
            amount = int(input('Enter amount of blood received: '))
            if amount > available_blood:
                print('Not enough blood. Try again.')
                continue
        except:
            print('Enter a valid amount')
        else:
            break
    
    recipient_insert_query = 'INSERT INTO recipient (hospitalid, recipientid, nurseid, amount_received) VALUES(%s, %s, %s, %s)'
    cursor.execute(recipient_insert_query, (hospitalID, recipientID, nurseID, amount))

    inventory_update_query = '''UPDATE HospitalBloodInventory
                                SET Volume = Volume - %s
                                WHERE HospitalID = %s AND BloodType = %s'''
    cursor.execute(inventory_update_query, (amount, hospitalID, bloodType))
    print('Blood administered')

def addHospital():
    '''
    Add a hospital
    '''
    name = input("Enter the Hospital's name: ").strip()
    contact = input('Enter the contact info: ').strip()
    location = input('Enter the location: ').strip()
    hospitalID = ''.join([x[0] for x in name.split()]) + contact[-1:-5:-1] + ''.join([x[0] for x in location.split()])
    add_query = 'INSERT INTO hospital VALUES (%s, %s, %s, %s)'
    values = (hospitalID, name, contact, location)
    try:
        cursor.execute(add_query, values)
    except psycopg2.errors.UniqueViolation:
            print('Hospital details already exist')
    else:
        print('Hospital details added')

def removeHospital():
    '''
    Remove a hospital
    ''' 
    get_hospitals_query = 'SELECT * FROM hospital'
    cursor.execute(get_hospitals_query)
    hospitals = cursor.fetchall()
    print(tabulate(hospitals, headers = ['Hospital ID', 'Name', 'Contact Info', 'Location'], tablefmt = 'heavy_grid'))
    hospitalID = input('Enter the hospital ID: ').strip()
    while hospitalID not in [hospital[0] for hospital in hospitals]:
        hospitalID = input('Enter a valid ID: ')
    
    delete_query = 'DELETE FROM hospital WHERE hospitalid = %s'
    cursor.execute(delete_query, (hospitalID,))
    print('Hospital deleted')

def addNurse(place, place_id):
    '''
    1. Add a nurse
    2. If the nurse works at a hospital add hospitalID
    3. If the nurse works at a vendor add vendorID
    '''
    
    name = input("Enter the nurse's name: ")
    contact = input("Enter the contact info: ")
    nurseID = ''.join([x[0] for x in name.split()]) + contact[-1:-5:-1]
    verify_works_at = f'SELECT nurseid FROM {place}_nurse WHERE nurseid = %s'
    cursor.execute(verify_works_at, (place,))
    if nurseID in cursor.fetchall():
            print('Nurse already employed')
            return 0
    else:
        add_nurse_query = 'INSERT INTO nurse VALUES(%s, %s, %s)'
        add_nurse_works_at = 'INSERT INTO hospital_nurse VALUES(%s, %s)'

        nurse_details = (nurseID, name, contact)
            
        add_nurse_query = 'INSERT INTO nurse VALUES(%s, %s, %s)'
        add_nurse_works_at = f'INSERT INTO {place}_nurse VALUES(%s, %s)'
        try:
            cursor.execute(add_nurse_query, nurse_details)
        except psycopg2.errors.UniqueViolation:
            print('Nurse Details already exist')
            return 0
        cursor.execute(add_nurse_works_at, (nurseID, place_id))
        print('Nurse details added!')
        
def removeNurse(place, place_id):
    '''
    Removes a nurse
    '''
    get_nurses = f'''SELECT * FROM nurse WHERE nurseid IN 
                    (SELECT nurseid FROM {place}_nurse WHERE {place}id = %s)'''
    cursor.execute(get_nurses, (place_id,))
    nurses = cursor.fetchall()
    print(tabulate(nurses, headers = ['Nurse ID', 'Name', 'Contact Info'], tablefmt = 'heavy_grid'))
    nurseID = input('Enter the nurse ID from the table above: ')
    while nurseID not in [nurse[0] for nurse in nurses]:
        nurseID = input('Enter a valid ID: ')
    remove_nurse = 'DELETE FROM nurse WHERE nurseid = %s'
    cursor.execute(remove_nurse, (nurseID,))
    print('Nurse removed')

def addVendor():
    '''
    Add a vendor
    '''
    name = input("Enter the Vendor's name: ").strip()
    contact = input('Enter the contact info: ').strip()
    location = input('Enter the location: ').strip()
    vendorID = ''.join([x[0] for x in name.split()]) + contact[-1:-4:-1] + ''.join([x[0] for x in location.split()])
    add_query = 'INSERT INTO vendor VALUES (%s, %s, %s, %s)'
    values = (vendorID, name, contact, location)
    try:
        cursor.execute(add_query, values)
    except psycopg2.errors.UniqueViolation:
            print('Vendor details already exist')
    else:
        print('Vendor details added')

def removeVendor():
    '''
    Remove a vendor
    ''' 
    get_vendor_query = 'SELECT * FROM vendor'
    cursor.execute(get_vendor_query)
    vendors = cursor.fetchall()
    print(tabulate(vendors, headers = ['Vendor ID', 'Name', 'Contact Info', 'Location'], tablefmt = 'heavy_grid'))
    vendorID = input('Enter the vendor ID: ').strip()
    while vendorID not in [vendor[0] for vendor in vendors]:
        vendorID = input('Enter a valid ID: ')
    
    delete_query = 'DELETE FROM vendor WHERE vendorid = %s'
    cursor.execute(delete_query, (vendorID,))
    print('Vendor deleted')

def requestBloodFromVendor(hospitalID):
    while True:
        try:
            amount = int(input('Enter the amount required: '))
        except:
            print('Enter a valid amount')
        else:
            break
    bloodType_pattern = r'[ABO]{1,2}[+-]'
    while True:
        bloodType = input('Enter the blood type required: ').strip()
        if re.match(bloodType_pattern, bloodType):
            break
        print('Invalid blood type')

    get_vendors = '''SELECT * FROM vendor WHERE vendorid IN
                    (SELECT vendorid FROM vendorbloodinventory WHERE bloodtype = %s AND volume >= %s)'''
    cursor.execute(get_vendors, (bloodType, amount))
    vendors = cursor.fetchall()
    if vendors:
        print(tabulate(vendors, headers = ['Vendor ID', 'Name', 'Contact', 'Location'], tablefmt = 'heavy_grid'))
        vendorID = input('Enter a vendor ID from above: ')
        if vendorID not in [vendor[0] for vendor in vendors]:
            vendorID = input('Enter a valid vendor ID: ')
        insert_request = 'INSERT INTO sendsblood (hospitalid, vendorid, amount) VALUES (%s, %s, %s)'
        cursor.execute(insert_request, (hospitalID, vendorID, amount))
        print('Request sent!')

def sendBloodtoHospital(vendorID):
    get_inventory = 'SELECT bloodtype, volume FROM vendorbloodinventory WHERE vendorid = %s'
    cursor.execute(get_inventory, (vendorID, ))
    inventory = {x[0]: x[1] for x in cursor.fetchall()}
    get_requests = '''SELECT hospitalid, bloodtype, amount FROM sendsblood 
                      WHERE vendorid = %s AND sent = False'''
    cursor.execute(get_requests, (vendorID, ))
    requests = cursor.fetchall() 
    update_hospital_inventory = 'UPDATE hospitalbloodinventory SET volume = volume + %s WHERE hospitalid = %s AND bloodtype = %s'
    insert_hospital_inventory = 'INSERT INTO hospitalbloodinventory VALUES(%s, %s, %s)'
    get_hospital_inventory = 'SELECT * FROM hospitalbloodinventory WHERE hospitalid = %s AND bloodtype = %s'
    update_sendsblood = 'UPDATE sendsblood SET sent = True, date_sent = CURRENT_TIMESTAMP WHERE vendorid = %s'
    if requests:
        for hospitalID, bloodtype, amount in requests:
            if inventory[bloodtype] >= amount:
                cursor.execute(get_hospital_inventory, (hospitalID, bloodtype))
                if cursor.fetchall():
                    print(f'Executing update for hospitalID: {hospitalID}, bloodtype: {bloodtype}, amount: {amount}')
                    cursor.execute(update_hospital_inventory, (amount, hospitalID, bloodtype))
                    cursor.execute(update_sendsblood, (vendorID,))
                else:
                    cursor.execute(insert_hospital_inventory, (hospitalID, bloodtype, amount))
            else:
                print(f'Not enough blood to fulfil request for: {hospitalID}')

    

def main_menu():
    while True:
        print('WELCOME TO YOUR BLOOD MANAGEMENT SYSTEM'.center(100))
        print('1. Admin Options')
        print('2. Hospital Options')
        print('3. Vendor Options')
        print('4. Exit')

        choice = input('Enter a choice from above [1,2,3,4]: ').strip()
        while choice not in ['1', '2', '3', '4']:
            choice = input('Enter a valid option [1,2,3,4]: ').strip()

        if choice == '1':
            while True:
                print('1. Add a Hospital')
                print('2. Add a Vendor')
                print('3. Remove Hospital')
                print('4. Remove a Vendor')
                print('5. Go Back')
                admin_choice = input('Enter an option from above [1,2,3,4,5]: ').strip()
                while admin_choice not in ['1', '2', '3', '4', '5']:
                    admin_choice = input('Enter a valid choice [1,2,3,4,5]: ').strip()
                if admin_choice == '5':
                    break
                if admin_choice == '1':
                    addHospital()
                elif admin_choice == '2':
                    addVendor()
                elif admin_choice == '3':
                    removeHospital()
                elif admin_choice == '4':
                    removeVendor()

        elif choice == '2':
            while True:
                place = 'hospital'
                get_hospitals = 'SELECT * FROM hospital'
                cursor.execute(get_hospitals)
                hospitals = cursor.fetchall()
                print(tabulate(hospitals, headers=['Hospital ID', 'Name', 'Contact', 'Location'], tablefmt='heavy_grid'))
                hospitalID = input('Enter hospital ID from the table above or type "back" to go back: ')
                if hospitalID.lower() == 'back':
                    break
                while hospitalID not in [str(hospital[0]) for hospital in hospitals]:
                    hospitalID = input('Enter a valid hospital ID or type "back" to go back: ')
                    if hospitalID.lower() == 'back':
                        break
                if hospitalID.lower() == 'back':
                    continue

                while True:
                    print('1. Manage Staff')
                    print('2. Manage Patients')
                    print('3. Request Blood from Vendor')
                    print('4. Go Back')
                    hospital_choice = input('Enter a choice from above [1,2,3,4]: ').strip()
                    while hospital_choice not in ['1', '2', '3', '4']:
                        hospital_choice = input('Enter a valid choice [1,2,3,4]: ').strip()
                    if hospital_choice == '4':
                        break
                    if hospital_choice == '1':
                        while True:
                            print('1. Add a Nurse')
                            print('2. Remove a Nurse')
                            print('3. Go Back')
                            hospital_choice1 = input('Enter a choice from above [1,2,3]: ').strip()
                            while hospital_choice1 not in ['1', '2', '3']:
                                hospital_choice1 = input('Enter a valid choice [1,2,3]: ').strip()
                            if hospital_choice1 == '3':
                                break
                            if hospital_choice1 == '1':
                                addNurse(place, hospitalID)
                            elif hospital_choice1 == '2':
                                removeNurse(place, hospitalID)
                    elif hospital_choice == '2':
                        while True:
                            print('1. Add new Patient')
                            print('2. Administer to existing patient')
                            print('3. Go Back')
                            hospital_choice2 = input('Enter a choice from above [1,2,3]: ').strip()
                            while hospital_choice2 not in ['1', '2', '3']:
                                hospital_choice2 = input('Enter a valid choice [1,2,3]: ').strip()
                            if hospital_choice2 == '3':
                                break
                            if hospital_choice2 == '1':
                                addRecipient(hospitalID)
                            elif hospital_choice2 == '2':
                                get_patients = '''SELECT * FROM patient WHERE fileno IN
                                                (SELECT DISTINCT recipientid FROM recipient WHERE hospitalid = %s )'''
                                cursor.execute(get_patients, (hospitalID,))
                                patients = cursor.fetchall()
                                print(tabulate(patients, headers=['Patient ID', 'Name', 'Contact', 'Blood Type'], tablefmt='heavy_grid'))
                                recipientID = input('Enter recipientID from the table above or type "back" to go back: ')
                                id_bloodtype = {recipient[0]:recipient[3] for recipient in patients}
                                while recipientID not in id_bloodtype:
                                    recipientID = input('Enter a valid ID or type "back" to go back: ')
                                    if recipientID.lower() == 'back':
                                        break
                                if recipientID.lower() == 'back':
                                    continue
                                bloodType = id_bloodtype[recipientID]

                                get_nurses = '''SELECT * FROM nurse WHERE nurseid in
                                                (SELECT nurseid FROM hospital_nurse WHERE hospitalid = %s)'''
                                cursor.execute(get_nurses, (hospitalID,))
                                nurses = cursor.fetchall()
                                if nurses:
                                    print(tabulate(nurses, headers=['Nurse ID', 'Name', 'Contact'], tablefmt='heavy_grid'))
                                    nurseID = input('Enter the nurse ID from the table above or type "back" to go back: ')
                                    while nurseID not in [nurse[0] for nurse in nurses]:
                                        nurseID = input('Enter a valid nurse ID or type "back" to go back: ')
                                        if nurseID.lower() == 'back':
                                            break
                                    if nurseID.lower() == 'back':
                                        continue
                                    administerBlood(hospitalID, recipientID, nurseID, bloodType)
                    elif hospital_choice == '3':
                        requestBloodFromVendor(hospitalID)

        elif choice == '3':
            while True:
                place = 'vendor'
                get_vendors = 'SELECT * FROM vendor'
                cursor.execute(get_vendors)
                vendors = cursor.fetchall()
                print(tabulate(vendors, headers=['Vendor ID', 'Name', 'Contact', 'Location'], tablefmt='heavy_grid'))
                vendorID = input('Enter vendor ID from the table above or type "back" to go back: ')
                if vendorID.lower() == 'back':
                    break
                while vendorID not in [str(vendor[0]) for vendor in vendors]:
                    vendorID = input('Enter a valid vendor ID or type "back" to go back: ')
                    if vendorID.lower() == 'back':
                        break
                if vendorID.lower() == 'back':
                    continue

                while True:
                    print('1. Manage Staff')
                    print('2. Manage Patients')
                    print('3. Send Blood to Hospital')
                    print('4. Go Back')
                    vendor_choice = input('Enter a choice from above [1,2,3,4]: ').strip()
                    while vendor_choice not in ['1', '2', '3', '4']:
                        vendor_choice = input('Enter a valid choice [1,2,3,4]: ').strip()
                    if vendor_choice == '4':
                        break
                    if vendor_choice == '1':
                        while True:
                            print('1. Add a Nurse')
                            print('2. Remove a Nurse')
                            print('3. Go Back')
                            vendor_choice1 = input('Enter a choice from above [1,2,3]: ').strip()
                            while vendor_choice1 not in ['1', '2', '3']:
                                vendor_choice1 = input('Enter a valid choice [1,2,3]: ').strip()
                            if vendor_choice1 == '3':
                                break
                            if vendor_choice1 == '1':
                                addNurse(place, vendorID)
                            elif vendor_choice1 == '2':
                                removeNurse(place, vendorID)
                    elif vendor_choice == '2':
                        while True:
                            print('1. Add new Patient')
                            print('2. Take Donation from Existing Patient')
                            print('3. Go Back')
                            vendor_choice2 = input('Enter a choice from above [1,2,3]: ').strip()
                            while vendor_choice2 not in ['1', '2', '3']:
                                vendor_choice2 = input('Enter a valid choice [1,2,3]: ').strip()
                            if vendor_choice2 == '3':
                                break
                            if vendor_choice2 == '1':
                                addDonor(vendorID)
                            elif vendor_choice2 == '2':
                                get_patients = '''SELECT * FROM patient WHERE fileno IN
                                                (SELECT DISTINCT donorid FROM donor WHERE vendorid = %s )'''
                                cursor.execute(get_patients, (vendorID,))
                                patients = cursor.fetchall()
                                print(tabulate(patients, headers=['Patient ID', 'Name', 'Contact', 'Blood Type'], tablefmt='heavy_grid'))
                                donorID = input('Enter donor ID from the table above or type "back" to go back: ')
                                id_bloodtype = {donor[0]:donor[3] for donor in patients}
                                while donorID not in id_bloodtype:
                                    donorID = input('Enter a valid ID or type "back" to go back: ')
                                    if donorID.lower() == 'back':
                                        break
                                if donorID.lower() == 'back':
                                    continue
                                bloodType = id_bloodtype[donorID]

                                get_nurses = '''SELECT * FROM nurse WHERE nurseid in
                                                (SELECT nurseid FROM vendor_nurse WHERE vendorid = %s)'''
                                cursor.execute(get_nurses, (vendorID,))
                                nurses = cursor.fetchall()
                                if nurses:
                                    print(tabulate(nurses, headers=['Nurse ID', 'Name', 'Contact'], tablefmt='heavy_grid'))
                                    nurseID = input('Enter the nurse ID from the table above or type "back" to go back: ')
                                    while nurseID not in [nurse[0] for nurse in nurses]:
                                        nurseID = input('Enter a valid nurse ID or type "back" to go back: ')
                                        if nurseID.lower() == 'back':
                                            break
                                    if nurseID.lower() == 'back':
                                        continue
                                    donateBlood(vendorID, donorID, nurseID, bloodType)
                    elif vendor_choice == '3':
                        sendBloodtoHospital(vendorID)

        elif choice == '4':
            print('Exiting the program.')
            break

# Note: Ensure that all the functions called within this code (addHospital, addVendor, removeHospital, removeVendor, 
# addNurse, removeNurse, addRecipient, administerBlood, requestBloodFromVendor, addDonor, donateBlood, sendBloodtoHospital)
# are defined in your script and properly handle the database interactions and other functionalities.

def login_to_db(username, password):
    try:
        conn = psycopg2.connect(dbname = 'blood_donation_system',
                            user = username,
                            password = password,
                            host = 'localhost',
                            port = 5432)
        conn.autocommit = True
        cursor = conn.cursor()
    except psycopg2.Error as e:
        print(f'Error: {e}')
    else:
        return (conn, cursor)

conn, cursor = login_to_db('muddassirkhalidi', 'Mjkt260421pgadmin')

main_menu()
