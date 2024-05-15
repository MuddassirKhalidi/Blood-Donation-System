import re
import psycopg2
from tabulate import tabulate 

def addPatient():
    '''
    1. Asks if the patient is donor or a recipient
    2. If the patient is a donor call addDonor()
    3. If the patient is a recipient call addRecipient()
    '''
    query = 'INSERT INTO patient VALUES(%s, %s, %s, %s)'
    name = input("Enter the patient's name: ").strip()
    contactInfo = input("Enter the patient's contact info: ").strip()
    bloodType_pattern = r'[ABO]{1,2}[+-]'
    while True:
        bloodType = input('Enter the blood type: ').strip()
        if re.match(bloodType_pattern, bloodType):
            break
        print('Invalid blood type')
    patientID = ''.join([x for x in name if x.isupper()]) + contactInfo[-1:-5:-1]

    cursor.execute(query, (patientID, name, contactInfo, bloodType))
    patientType = input('Enter D if you are a donor or R if you are a recipient: ').upper().strip()
    while patientType not in ['D','R']:
        patientType = input('Enter a valid input [D, R]: ').strip()

    if patientType == 'D':
        addDonor(patientID, bloodType)
    else:
        addRecipient(patientID, bloodType)

    pass

def addDonor(patientID, bloodType):
    '''
    1. Insert data into the donatesblood table to record donor-vendor relationship
    2. Insert data into the attends table donor-nurse relationship
    '''
    #   Queries the DB to return vendor IDs for vendors who have a shortage (less than or equal to 200 units) of the donor's blood type
    show_vendors_query = '''SELECT * FROM vendor WHERE vendorid IN
                            (SELECT vendorid FROM vendorbloodinventory 
                            WHERE bloodtype = %s AND volume <= 500)'''
    cursor.execute(show_vendors_query, (bloodType,))
    vendors = cursor.fetchall()
    if vendors:
        print(tabulate(vendors, headers = ['Vendor ID', 'Name', 'Contact', 'Location'], tablefmt = 'heavy_grid'))

        #Validates the vendor ID
        while True:
            vendorID = input('Enter Vendor ID from the table above: ').strip()
            if vendorID in [vendor[0] for vendor in vendors]:
                break
            print('Enter a valid vendor ID')
    

        # Queries the database to return nurse IDs who work in the chosen vendor
        nurses_query = '''SELECT * FROM nurse WHERE nurseid IN 
                        (SELECT nurseid from vendor_nurse WHERE vendorid = %s)'''
        cursor.execute(nurses_query, (vendorID,))
        nurses = cursor.fetchall()
        print(tabulate(nurses, headers = ['Nurse ID','Name', 'Contact'], tablefmt = 'heavy_grid'))

        #Validates the vendor ID
        while True:
            nurseID = input('Enter Nurse ID from the table above: ').strip()
            if nurseID in [nurse[0] for nurse in nurses]:
                break
            print('Enter a valid Nurse ID')
        
        donor_insert_query = 'INSERT INTO donor VALUES(%s, %s, %s)'
        cursor.execute(donor_insert_query, (vendorID, patientID, nurseID))

        inventory_update_query = '''UPDATE VendorBloodInventory
                                    SET Volume = Volume + 10
                                    WHERE VendorID = %s AND BloodType = %s'''
        cursor.execute(inventory_update_query, (vendorID, bloodType))
        return 1
    else:
        print('No vendors available')
        delete_patient_file = 'DELETE FROM patient WHERE fileno = %s'
        cursor.execute(delete_patient_file, (patientID,))
        return 0

def addRecipient(patientID, bloodType):
    '''
    1. Insert data into the donatesblood table to record receiver-vendor relationship
    2. Insert data into the attends table receiver-nurse relationship
    '''

    # Queries DB to show hospitals where the recipient's blood type is available (more than 500 units)
    show_hospitals_query = '''SELECT * FROM hospital WHERE hospitalid IN
                            (SELECT hospitalid FROM hospitalbloodinventory 
                            WHERE bloodtype = %s AND volume >= 500)'''
    cursor.execute(show_hospitals_query, (bloodType,))
    hospitals = cursor.fetchall()
    print(tabulate(hospitals, headers = ['Hospital ID', 'Name', 'Contact', 'Location'], tablefmt = 'heavy_grid'))

    #Validates the hospital ID
    while True:
        hospitalID = input('Enter Hospital ID from the table above: ').strip()
        if hospitalID in [hospital[0] for hospital in hospitals]:
            break
        print('Enter a valid Hospital ID')

    # Queries the database to return nurse IDs who work in the chosen vendor
    nurses_query = '''SELECT * FROM nurse WHERE nurseid IN 
                      (SELECT nurseid from hospital_nurse WHERE hospitalid = %s)'''
    cursor.execute(nurses_query, (hospitalID,))
    nurses = cursor.fetchall()
    print(tabulate(nurses, headers = ['Nurse ID','Name', 'Contact'], tablefmt = 'heavy_grid'))

    #Validates the vendor ID
    while True:
        nurseID = input('Enter Nurse ID from the table above: ').strip()
        if nurseID in [nurse[0] for nurse in nurses]:
            break
        print('Enter a valid Nurse ID')
    while True:
        try: 
            amount = int(input('Enter amount of blood received: '))
        except:
            print('Enter a valid amount')
        else:
            break
    
    recipient_insert_query = 'INSERT INTO recipient VALUES(%s, %s, %s)'
    cursor.execute(recipient_insert_query, (hospitalID, patientID, nurseID))

    inventory_update_query = '''UPDATE HospitalBloodInventory
                                SET Volume = Volume - %s
                                WHERE HospitalID = %s AND BloodType = %s'''
    cursor.execute(inventory_update_query, (amount, hospitalID, bloodType))


def addHospital():
    '''
    Add a hospital
    '''
    pass

def addNurse():
    '''
    1. Add a nurse
    2. If the nurse works at a hospital add hospitalID
    3. If the nurse works at a vendor add vendorID
    '''
    pass

def addVendor():
    '''
    Add a vendor
    '''
    pass


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
addPatient()
