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
    NurseID VARCHAR(100) PRIMARY KEY REFERENCES Nurse(NurseID),
    VendorID VARCHAR(100) REFERENCES Vendor(VendorID)
);

-- Hospital_Nurse Table (for nurses working with hospitals)
CREATE TABLE Hospital_Nurse (
    NurseID VARCHAR(100) PRIMARY KEY REFERENCES Nurse(NurseID),
    HospitalID VARCHAR(100) REFERENCES Hospital(HospitalID)
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
    HospitalID VARCHAR(100) REFERENCES Hospital(HospitalID),
    VendorID VARCHAR(100) REFERENCES Vendor(VendorID),
    PRIMARY KEY (HospitalID, VendorID)
);

-- Manages Table
CREATE TABLE Manages (
    NurseID VARCHAR(100) REFERENCES Nurse(NurseID),
    VendorID VARCHAR(100) REFERENCES Vendor(VendorID),
    PRIMARY KEY (NurseID, VendorID)
);

-- TakesBlood Table (instead of DonateBlood)
CREATE TABLE Donor (
    VendorID VARCHAR(100) REFERENCES Vendor(VendorID),
    DonorID VARCHAR(100) REFERENCES Patient(FileNo),
    NurseID VARCHAR(100) REFERENCES Vendor_Nurse(NurseID),
    PRIMARY KEY (VendorID, DonorID)
);

-- AdministersTo Table (instead of ReceivesBlood)
CREATE TABLE Recipient (
    HospitalID VARCHAR(100) REFERENCES Hospital(HospitalID),
    RecipientID VARCHAR(100) REFERENCES Patient(FileNo),
    NurseID VARCHAR(100) REFERENCES Hospital_Nurse(NurseID),
    PRIMARY KEY (HospitalID, RecipientID)
);

-- VendorBloodInventory Table
CREATE TABLE VendorBloodInventory (
    VendorID VARCHAR(100) REFERENCES Vendor(VendorID),
    BloodType VARCHAR(10),
    Volume DECIMAL(10,2),
    PRIMARY KEY (VendorID, BloodType)
);

-- HospitalBloodInventory Table
CREATE TABLE HospitalBloodInventory (
    HospitalID VARCHAR(100) REFERENCES Hospital(HospitalID),
    BloodType VARCHAR(10),
    Volume DECIMAL(10,2),
    PRIMARY KEY (HospitalID, BloodType)
);
