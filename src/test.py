import tkinter as tk
from tkinter import ttk
from tkinter import messagebox
import psycopg2
from tabulate import tabulate

# Database connection
conn = None
cursor = None

def login_to_db(username, password):
    global conn, cursor
    try:
        conn = psycopg2.connect(dbname='blood_donation_system',
                                user=username,
                                password=password,
                                host='localhost',
                                port=5432)
        conn.autocommit = True
        cursor = conn.cursor()
    except psycopg2.Error as e:
        messagebox.showerror("Error", f"Error: {e}")
        return False
    else:
        return True

def main_menu():
    root = tk.Tk()
    root.title("Blood Management System")

    main_frame = tk.Frame(root)
    main_frame.pack(fill="both", expand=True)

    tk.Label(main_frame, text="WELCOME TO YOUR BLOOD MANAGEMENT SYSTEM", font=("Arial", 16)).pack(pady=20)

    tk.Button(main_frame, text="Admin Options", command=lambda: admin_options(root)).pack(pady=10)
    tk.Button(main_frame, text="Hospital Options", command=lambda: hospital_options(root)).pack(pady=10)
    tk.Button(main_frame, text="Vendor Options", command=lambda: vendor_options(root)).pack(pady=10)
    tk.Button(main_frame, text="Patient Options", command=lambda: patient_options(root)).pack(pady=10)

    root.mainloop()

def admin_options(root):
    admin_frame = tk.Frame(root)
    admin_frame.pack(fill="both", expand=True)

    tk.Label(admin_frame, text="Admin Options", font=("Arial", 14)).pack(pady=10)

    tk.Button(admin_frame, text="Add a Hospital", command=lambda: add_hospital(root)).pack(pady=10)
    tk.Button(admin_frame, text="Add a Vendor", command=lambda: add_vendor(root)).pack(pady=10)
    tk.Button(admin_frame, text="Remove Hospital", command=lambda: remove_hospital(root)).pack(pady=10)
    tk.Button(admin_frame, text="Remove a vendor", command=lambda: remove_vendor(root)).pack(pady=10)

def hospital_options(root):
    hospital_frame = tk.Frame(root)
    hospital_frame.pack(fill="both", expand=True)

    tk.Label(hospital_frame, text="Hospital Options", font=("Arial", 14)).pack(pady=10)

    tk.Button(hospital_frame, text="Manage Staff", command=lambda: manage_staff(root, 'hospital')).pack(pady=10)
    tk.Button(hospital_frame, text="Manage Patients", command=lambda: manage_patients(root, 'hospital')).pack(pady=10)
    tk.Button(hospital_frame, text="Request Blood from Vendor", command=lambda: request_blood_from_vendor(root, 'hospital')).pack(pady=10)

def vendor_options(root):
    vendor_frame = tk.Frame(root)
    vendor_frame.pack(fill="both", expand=True)

    tk.Label(vendor_frame, text="Vendor Options", font=("Arial", 14)).pack(pady=10)

    tk.Button(vendor_frame, text="Manage Staff", command=lambda: manage_staff(root, 'vendor')).pack(pady=10)
    tk.Button(vendor_frame, text="Manage Patients", command=lambda: manage_patients(root, 'vendor')).pack(pady=10)
    tk.Button(vendor_frame, text="Send Blood to Hospital", command=lambda: send_blood_to_hospital(root, 'vendor')).pack(pady=10)

def patient_options(root):
    patient_frame = tk.Frame(root)
    patient_frame.pack(fill="both", expand=True)

    tk.Label(patient_frame, text="Patient Options", font=("Arial", 14)).pack(pady=10)

    tk.Button(patient_frame, text="Book an Appointment", command=lambda: book_appointment(root)).pack(pady=10)
    tk.Button(patient_frame, text="View previous appointments", command=lambda: view_past_appointments(root)).pack(pady=10)

def add_hospital(root):
    # Add hospital implementation
    pass

def add_vendor(root):
    # Add vendor implementation
    pass

def remove_hospital(root):
    # Remove hospital implementation
    pass

def remove_vendor(root):
    # Remove vendor implementation
    pass

def manage_staff(root, place):
    # Manage staff implementation
    pass

def manage_patients(root, place):
    # Manage patients implementation
    pass

def request_blood_from_vendor(root, place):
    # Request blood from vendor implementation
    pass

def send_blood_to_hospital(root, place):
    # Send blood to hospital implementation
    pass

def book_appointment(root):
    # Book appointment implementation
    pass

def view_past_appointments(root):
    # View past appointments implementation
    pass

if __name__ == "__main__":
    if login_to_db('muddassirkhalidi', 'Mjkt260421pgadmin'):
        main_menu()
    else:
        messagebox.showerror("Error", "Invalid username or password")