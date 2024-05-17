INSERT INTO Hospital (HospitalID, Name, ContactInfo, Location)
VALUES
    ('GH1234', 'General Hospital', '555-1234', '123 Main St'),
    ('CH5678', 'City Hospital', '555-5678', '456 Elm St'),
    ('CH8765', 'County Hospital', '555-8765', '789 Oak St'),
    ('SM4321', 'St. Mary''s Hospital', '555-4321', '321 Maple St'),
    ('MH6789', 'Memorial Hospital', '555-6789', '654 Pine St'),
    ('CH8764', 'Community Hospital', '555-8764', '987 Birch St'),
    ('RMC1357', 'Regional Medical Center', '555-1357', '741 Cedar St'),
    ('CH2468', 'Children''s Hospital', '555-2468', '852 Spruce St'),
    ('UH9753', 'University Hospital', '555-9753', '963 Willow St'),
    ('CH8642', 'Central Hospital', '555-8642', '258 Ash St');

INSERT INTO Vendor (VendorID, Name, ContactInfo, Location)
VALUES
    ('VH9876', 'ABC Medical Supplies', '555-9876', '123 Oak Ave'),
    ('VH5432', 'XYZ Healthcare', '555-5432', '456 Pine Ave'),
    ('VH6789', 'Global Pharma', '555-6789', '789 Cedar Ave'),
    ('VH2468', 'MediCorp', '555-2468', '852 Elm Ave'),
    ('VH3579', 'HealthFirst', '555-3579', '963 Maple Ave');

INSERT INTO Nurse (NurseID, Name, ContactInfo)
VALUES
    ('N1234', 'Alice Johnson', '555-1234'),
    ('N5678', 'Bob Smith', '555-5678'),
    ('N8765', 'Emily Davis', '555-8765'),
    ('N4321', 'John Brown', '555-4321'),
    ('N6789', 'Mary White', '555-6789');

INSERT INTO Vendor_Nurse (NurseID, VendorID)
VALUES
    ('N1234', 'VH9876'),
    ('N5678', 'VH5432'),
    ('N8765', 'VH6789'),
    ('N4321', 'VH2468'),
    ('N6789', 'VH3579');


INSERT INTO Hospital_Nurse (NurseID, HospitalID)
VALUES
    ('N1234', 'GH1234'),
    ('N5678', 'CH5678'),
    ('N8765', 'CH8765'),
    ('N4321', 'SM4321'),
    ('N6789', 'MH6789');

INSERT INTO Patient (FileNo, Name, ContactInfo, BloodType)
VALUES
    ('P9876', 'Michael Brown', '555-9876', 'A+'),
    ('P5432', 'Sophia Johnson', '555-5432', 'O-'),
    ('P6789', 'William Davis', '555-6789', 'B+'),
    ('P2468', 'Emma Wilson', '555-2468', 'AB-'),
    ('P3579', 'James Miller', '555-3579', 'O+');


INSERT INTO SendsBlood (HospitalID, VendorID)
VALUES
    ('GH1234', 'VH9876'),
    ('CH5678', 'VH5432'),
    ('CH8765', 'VH6789'),
    ('SM4321', 'VH2468'),
    ('MH6789', 'VH3579');


INSERT INTO Manages (NurseID, VendorID)
VALUES
    ('N1234', 'VH9876'),
    ('N5678', 'VH5432'),
    ('N8765', 'VH6789'),
    ('N4321', 'VH2468'),
    ('N6789', 'VH3579');


INSERT INTO Donor (VendorID, DonorID, NurseID, Blood_Amount)
VALUES
    ('VH9876', 'P9876', 'N1234', 250),
    ('VH5432', 'P5432', 'N5678', 200),
    ('VH6789', 'P6789', 'N8765', 150),
    ('VH2468', 'P2468', 'N4321', 300),
    ('VH3579', 'P3579', 'N6789', 180);


INSERT INTO Recipient (HospitalID, RecipientID, NurseID)
VALUES
    ('GH1234', 'P9876', 'N1234'),
    ('CH5678', 'P5432', 'N5678'),
    ('CH8765', 'P6789', 'N8765'),
    ('SM4321', 'P2468', 'N4321'),
    ('MH6789', 'P3579', 'N6789');


INSERT INTO VendorBloodInventory (VendorID, BloodType, Volume)
VALUES
    ('VH9876', 'A+', 500),
    ('VH5432', 'O-', 300),
    ('VH6789', 'B+', 400),
    ('VH2468', 'AB-', 200),
    ('VH3579', 'O+', 350);

INSERT INTO HospitalBloodInventory (HospitalID, BloodType, Volume)
VALUES
    ('GH1234', 'A+', 100),
    ('CH5678', 'O-', 150),
    ('CH8765', 'B+', 200),
    ('SM4321', 'AB-', 80),
    ('MH6789', 'O+', 120);

