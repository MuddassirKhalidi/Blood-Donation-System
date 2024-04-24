CREATE TABLE Hospital (
    HospitalID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    ContactInfo VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE Vendor (
    VendorID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    ContactInfo VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE BloodInventory (
    BloodType VARCHAR(10) PRIMARY KEY,
    Volume DECIMAL(10,2),
    VendorID INTEGER REFERENCES Vendor(VendorID)
);

CREATE TABLE Nurse (
    NurseID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    ContactInfo VARCHAR(100)
);

CREATE TABLE Patient (
    FileNo SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    ContactInfo VARCHAR(100),
    BloodType VARCHAR(10)
);

CREATE TABLE Donor (
    FileNo INTEGER PRIMARY KEY REFERENCES Patient(FileNo),
    NurseID INTEGER REFERENCES Nurse(NurseID)
);

CREATE TABLE Recipient (
    FileNo INTEGER PRIMARY KEY REFERENCES Patient(FileNo),
    NurseID INTEGER REFERENCES Nurse(NurseID)
);

CREATE TABLE SendsBlood (
    HospitalID INTEGER REFERENCES Hospital(HospitalID),
    VendorID INTEGER REFERENCES Vendor(VendorID),
    PRIMARY KEY (HospitalID, VendorID)
);

CREATE TABLE Manages (
    NurseID INTEGER REFERENCES Nurse(NurseID),
    VendorID INTEGER REFERENCES Vendor(VendorID),
    PRIMARY KEY (NurseID, VendorID)
);

CREATE TABLE Attends (
    NurseID INTEGER REFERENCES Nurse(NurseID),
    PatientID INTEGER REFERENCES Patient(FileNo),
    PRIMARY KEY (NurseID, PatientID)
);

CREATE TABLE DonateBlood (
    VendorID INTEGER REFERENCES Vendor(VendorID),
    DonorID INTEGER REFERENCES Donor(FileNo),
    PRIMARY KEY (VendorID, DonorID)
);

CREATE TABLE ReceivesBlood (
    HospitalID INTEGER REFERENCES Hospital(HospitalID),
    RecipientID INTEGER REFERENCES Recipient(FileNo),
    PRIMARY KEY (HospitalID, RecipientID)
);

CREATE TABLE Stores (
    VendorID INTEGER PRIMARY KEY REFERENCES Vendor(VendorID),
    BloodType VARCHAR(10) REFERENCES BloodInventory(BloodType)
);
