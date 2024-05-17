-- Hospital Table
CREATE TABLE Hospital (
    HospitalID VARCHAR(100) PRIMARY KEY,
    Name VARCHAR(100),
    ContactInfo VARCHAR(100),
    Location VARCHAR(100)
);

-- Vendor Table
CREATE TABLE Vendor (
    VendorID VARCHAR(100) PRIMARY KEY,
    Name VARCHAR(100),
    ContactInfo VARCHAR(100),
    Location VARCHAR(100)
);

-- Nurse Table
CREATE TABLE Nurse (
    NurseID VARCHAR(100) PRIMARY KEY,
    Name VARCHAR(100),
    ContactInfo VARCHAR(100)
);

-- Vendor_Nurse Table (for nurses working with vendors)
CREATE TABLE Vendor_Nurse (
    NurseID VARCHAR(100) PRIMARY KEY REFERENCES Nurse(NurseID) ON DELETE CASCADE,
    VendorID VARCHAR(100) REFERENCES Vendor(VendorID) ON DELETE CASCADE
);

-- Hospital_Nurse Table (for nurses working with hospitals)
CREATE TABLE Hospital_Nurse (
    NurseID VARCHAR(100) PRIMARY KEY REFERENCES Nurse(NurseID) ON DELETE CASCADE,
    HospitalID VARCHAR(100) REFERENCES Hospital(HospitalID) ON DELETE CASCADE
);

-- Patient Table
CREATE TABLE Patient (
    FileNo VARCHAR(100) PRIMARY KEY,
    Name VARCHAR(100),
    ContactInfo VARCHAR(100),
    BloodType VARCHAR(10)
);

-- SendsBlood Table
CREATE TABLE SendsBlood (
    HospitalID VARCHAR(100) REFERENCES Hospital(HospitalID) ON DELETE CASCADE,
    VendorID VARCHAR(100) REFERENCES Vendor(VendorID) ON DELETE CASCADE,
    Amount NUMERIC, 
    BloodType VARCHAR(10),
    Date_Requested TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Date_Sent TIMESTAMP,
    Sent BOOLEAN DEFAULT False,
    PRIMARY KEY (HospitalID, VendorID)
);

-- Manages Table
CREATE TABLE Manages (
    NurseID VARCHAR(100) REFERENCES Nurse(NurseID) ON DELETE CASCADE,
    VendorID VARCHAR(100) REFERENCES Vendor(VendorID) ON DELETE CASCADE,
    PRIMARY KEY (NurseID, VendorID)
);

-- Donor Table (with ON DELETE SET NULL for VendorID and NurseID)
CREATE TABLE Donor (
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    VendorID VARCHAR(100) REFERENCES Vendor(VendorID) ON DELETE SET NULL,
    DonorID VARCHAR(100) REFERENCES Patient(FileNo) ON DELETE CASCADE,
    NurseID VARCHAR(100) REFERENCES Nurse(NurseID) ON DELETE SET NULL,
    Amount_Donated NUMERIC,
    PRIMARY KEY (Created_At, DonorID)
);

-- Recipient Table (with ON DELETE SET NULL for HospitalID and NurseID)
CREATE TABLE Recipient (
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    HospitalID VARCHAR(100) REFERENCES Hospital(HospitalID) ON DELETE SET NULL,
    RecipientID VARCHAR(100) REFERENCES Patient(FileNo) ON DELETE CASCADE,
    NurseID VARCHAR(100) REFERENCES Nurse(NurseID) ON DELETE SET NULL,
    Amount_Received NUMERIC,
    PRIMARY KEY (Created_At, RecipientID)
);

-- VendorBloodInventory Table
CREATE TABLE VendorBloodInventory (
    VendorID VARCHAR(100) REFERENCES Vendor(VendorID) ON DELETE CASCADE,
    BloodType VARCHAR(10),
    Volume DECIMAL(10,2),
    PRIMARY KEY (VendorID, BloodType)
);

-- HospitalBloodInventory Table
CREATE TABLE HospitalBloodInventory (
    HospitalID VARCHAR(100) REFERENCES Hospital(HospitalID) ON DELETE CASCADE,
    BloodType VARCHAR(10),
    Volume DECIMAL(10,2),
    PRIMARY KEY (HospitalID, BloodType)
);
