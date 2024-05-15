-- Hospital Table
INSERT INTO Hospital (HospitalID, Name, ContactInfo, Location) VALUES
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

-- Vendor Table
INSERT INTO Vendor (VendorID, Name, ContactInfo, Location) VALUES
('BC1235', 'BloodCare Inc.', '555-1235', '1001 Market St'),
('LB5679', 'LifeBlood Ltd.', '555-5679', '1002 Market St'),
('RC8766', 'RedCross Corp.', '555-8766', '1003 Market St'),
('VB4322', 'VitalBlood LLC', '555-4322', '1004 Market St'),
('BS6790', 'BloodServices Inc.', '555-6790', '1005 Market St'),
('PB8767', 'PureBlood Co.', '555-8767', '1006 Market St'),
('DL1358', 'DonorLife Ltd.', '555-1358', '1007 Market St'),
('HB2469', 'HealthBlood Corp.', '555-2469', '1008 Market St'),
('SB9754', 'SafeBlood LLC', '555-9754', '1009 Market St'),
('QB8643', 'QuickBlood Inc.', '555-8643', '1010 Market St');

-- Nurse Table
INSERT INTO Nurse (NurseID, Name, ContactInfo) VALUES
('NJ1111', 'Nurse Jane', '555-1111'),
('NJ2222', 'Nurse John', '555-2222'),
('NM3333', 'Nurse Mary', '555-3333'),
('NP4444', 'Nurse Peter', '555-4444'),
('NL5555', 'Nurse Lucy', '555-5555'),
('NM6666', 'Nurse Mark', '555-6666'),
('NA7777', 'Nurse Ann', '555-7777'),
('NP8888', 'Nurse Paul', '555-8888'),
('NK9999', 'Nurse Karen', '555-9999'),
('NS0000', 'Nurse Steve', '555-0000');

-- Vendor_Nurse Table
INSERT INTO Vendor_Nurse (NurseID, VendorID) VALUES
('NM6666', 'BC1235'),
('NA7777', 'LB5679'),
('NP8888', 'RC8766'),
('NK9999', 'VB4322'),
('NS0000', 'BS6790'),
('NJ1111', 'PB8767'),
('NJ2222', 'DL1358'),
('NM3333', 'HB2469'),
('NP4444', 'SB9754'),
('NL5555', 'QB8643');

-- Hospital_Nurse Table
INSERT INTO Hospital_Nurse (NurseID, HospitalID) VALUES
('NJ1111', 'GH1234'),
('NJ2222', 'CH5678'),
('NM3333', 'CH8765'),
('NP4444', 'SM4321'),
('NL5555', 'MH6789'),
('NM6666', 'CH8764'),
('NA7777', 'RMC1357'),
('NP8888', 'CH2468'),
('NK9999', 'UH9753'),
('NS0000', 'CH8642');

-- Patient Table
INSERT INTO Patient (FileNo, Name, ContactInfo, BloodType) VALUES
('AM4321', 'Alice Mary', '555-4321', 'A+'),
('BB2020', 'Bob Brown', '555-2020', 'B+'),
('CM3030', 'Charlie Mike', '555-3030', 'O+'),
('DD4040', 'David Davis', '555-4040', 'AB+'),
('EE5050', 'Eve Evans', '555-5050', 'A-'),
('FF6060', 'Frank Ford', '555-6060', 'B-'),
('GG7070', 'Grace Green', '555-7070', 'O-'),
('HH8080', 'Helen Harris', '555-8080', 'AB-'),
('II9090', 'Ivan Ivanov', '555-9090', 'A+'),
('JJ0001', 'Judy Jones', '555-0001', 'B+');

-- SendsBlood Table
INSERT INTO SendsBlood (HospitalID, VendorID) VALUES
('GH1234', 'BC1235'),
('CH5678', 'LB5679'),
('CH8765', 'RC8766'),
('SM4321', 'VB4322'),
('MH6789', 'BS6790'),
('CH8764', 'PB8767'),
('RMC1357', 'DL1358'),
('CH2468', 'HB2469'),
('UH9753', 'SB9754'),
('CH8642', 'QB8643');

-- Manages Table
INSERT INTO Manages (NurseID, VendorID) VALUES
('NJ1111', 'BC1235'),
('NJ2222', 'LB5679'),
('NM3333', 'RC8766'),
('NP4444', 'VB4322'),
('NL5555', 'BS6790'),
('NM6666', 'PB8767'),
('NA7777', 'DL1358'),
('NP8888', 'HB2469'),
('NK9999', 'SB9754'),
('NS0000', 'QB8643');

-- Donor Table
INSERT INTO Donor (VendorID, DonorID, NurseID) VALUES
('BC1235', 'AM4321', 'NM6666'),
('LB5679', 'BB2020', 'NA7777'),
('RC8766', 'CM3030', 'NP8888'),
('VB4322', 'DD4040', 'NK9999'),
('BS6790', 'EE5050', 'NS0000'),
('PB8767', 'FF6060', 'NJ1111'),
('DL1358', 'GG7070', 'NJ2222'),
('HB2469', 'HH8080', 'NM3333'),
('SB9754', 'II9090', 'NP4444'),
('QB8643', 'JJ0001', 'NL5555');

-- Recipient Table
INSERT INTO Recipient (HospitalID, RecipientID, NurseID) VALUES
('GH1234', 'AM4321', 'NJ1111'),
('CH5678', 'BB2020', 'NJ2222'),
('CH8765', 'CM3030', 'NM3333'),
('SM4321', 'DD4040', 'NP4444'),
('MH6789', 'EE5050', 'NL5555'),
('CH8764', 'FF6060', 'NM6666'),
('RMC1357', 'GG7070', 'NA7777'),
('CH2468', 'HH8080', 'NP8888'),
('UH9753', 'II9090', 'NK9999'),
('CH8642', 'JJ0001', 'NS0000');

-- Insert data into VendorBloodInventory
INSERT INTO VendorBloodInventory (VendorID, BloodType, Volume) VALUES
('BC1235', 'A+', 100.50),
('BC1235', 'B+', 200.75),
('LB5679', 'O+', 300.25),
('RC8766', 'AB+', 150.50),
('VB4322', 'A-', 100.00),
('BS6790', 'B-', 200.00),
('BS6790', 'O-', 300.00),
('BS6790', 'AB-', 150.00),
('LB5679', 'A+', 120.00),
('RC8766', 'B+', 210.00);

-- Insert data into HospitalBloodInventory with valid hospital IDs
INSERT INTO HospitalBloodInventory (HospitalID, BloodType, Volume) VALUES
('GH1234', 'A+', 50.75),
('CH5678', 'B+', 60.50),
('CH8765', 'O+', 70.25),
('SM4321', 'AB+', 30.00),
('MH6789', 'A-', 20.00),
('CH8764', 'B-', 40.50),
('RMC1357', 'O-', 45.75),
('CH2468', 'AB-', 25.00),
('UH9753', 'A+', 55.50),
('CH8642', 'B+', 65.25);
