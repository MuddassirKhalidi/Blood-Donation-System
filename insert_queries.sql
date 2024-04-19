INSERT INTO Hospital (Name, ContactInfo, Location) 
VALUES 
    ('Hospital A', 'Contact A', 'Location A'),
    ('Hospital B', 'Contact B', 'Location B'),
    ('Hospital C', 'Contact C', 'Location C'),
    ('Hospital D', 'Contact D', 'Location D'),
    ('Hospital E', 'Contact E', 'Location E'),
    ('Hospital F', 'Contact F', 'Location F'),
    ('Hospital G', 'Contact G', 'Location G'),
    ('Hospital H', 'Contact H', 'Location H'),
    ('Hospital I', 'Contact I', 'Location I'),
    ('Hospital J', 'Contact J', 'Location J');

INSERT INTO Vendor (Name, ContactInfo, Location) 
VALUES 
    ('Vendor A', 'Contact A', 'Location A'),
    ('Vendor B', 'Contact B', 'Location B'),
    ('Vendor C', 'Contact C', 'Location C'),
    ('Vendor D', 'Contact D', 'Location D'),
    ('Vendor E', 'Contact E', 'Location E'),
    ('Vendor F', 'Contact F', 'Location F'),
    ('Vendor G', 'Contact G', 'Location G'),
    ('Vendor H', 'Contact H', 'Location H'),
    ('Vendor I', 'Contact I', 'Location I'),
    ('Vendor J', 'Contact J', 'Location J');

INSERT INTO Nurse (Name, ContactInfo) 
VALUES 
    ('Nurse A', 'Contact A'),
    ('Nurse B', 'Contact B'),
    ('Nurse C', 'Contact C'),
    ('Nurse D', 'Contact D'),
    ('Nurse E', 'Contact E'),
    ('Nurse F', 'Contact F'),
    ('Nurse G', 'Contact G'),
    ('Nurse H', 'Contact H'),
    ('Nurse I', 'Contact I'),
    ('Nurse J', 'Contact J');

INSERT INTO BloodInventory (BloodType, Volume, VendorID) 
VALUES 
    ('A+', 100.00, 1), 
    ('B+', 150.00, 2),
    ('O+', 200.00, 3),
    ('AB+', 120.00, 4),
    ('A-', 80.00, 5),
    ('B-', 90.00, 6),
    ('O-', 110.00, 7),
    ('AB-', 70.00, 8);

INSERT INTO Patient (Name, ContactInfo, BloodType) 
VALUES 
    ('Patient A', 'Contact A', 'A+'),
    ('Patient B', 'Contact B', 'B+'),
    ('Patient C', 'Contact C', 'O+'),
    ('Patient D', 'Contact D', 'AB+'),
    ('Patient E', 'Contact E', 'A-'),
    ('Patient F', 'Contact F', 'B-'),
    ('Patient G', 'Contact G', 'O-'),
    ('Patient H', 'Contact H', 'AB-'),
    ('Patient I', 'Contact I', 'A+'),
    ('Patient J', 'Contact J', 'B+');

INSERT INTO Donor (FileNo, NurseID) 
VALUES 
    (1, 1), 
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

INSERT INTO Recipient (FileNo, NurseID) 
VALUES 
    (1, 1), 
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

INSERT INTO SendsBlood (HospitalID, VendorID) 
VALUES 
    (1, 1), 
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

INSERT INTO Manages (NurseID, VendorID) 
VALUES 
    (1, 1), 
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

INSERT INTO Attends (NurseID, PatientID) 
VALUES 
    (1, 1),  
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

INSERT INTO DonateBlood (VendorID, DonorID) 
VALUES 
    (1, 1),  
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

INSERT INTO ReceivesBlood (HospitalID, RecipientID) 
VALUES 
    (1, 1),  
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

INSERT INTO Stores (VendorID, BloodType) 
VALUES 
    (1, 'A+'),  
    (2, 'B+'),
    (3, 'O+'),
    (4, 'AB+'),
    (5, 'A-'),
    (6, 'B-'),
    (7, 'O-'),
    (8, 'AB-'),
    (9, 'A+'),
    (10, 'B+');
