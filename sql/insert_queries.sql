-- Insert into Hospital Table
INSERT INTO Hospital (HospitalID, Name, ContactInfo, Location) VALUES
('H001', 'General Hospital', '555-1234', '123 Main St'),
('H002', 'City Hospital', '555-5678', '456 Elm St'),
('H003', 'County Hospital', '555-8765', '789 Oak St'),
('H004', 'State Hospital', '555-4321', '321 Maple St'),
('H005', 'Metro Hospital', '555-6789', '654 Pine St'),
('H006', 'Regional Hospital', '555-9876', '987 Birch St'),
('H007', 'Community Hospital', '555-5432', '213 Cedar St'),
('H008', 'Memorial Hospital', '555-3456', '345 Spruce St'),
('H009', 'Central Hospital', '555-6543', '567 Aspen St'),
('H010', 'University Hospital', '555-7654', '789 Willow St');

-- Insert into Vendor Table
INSERT INTO Vendor (VendorID, Name, ContactInfo, Location) VALUES
('V001', 'Blood Services Inc.', '555-1122', '100 River Rd'),
('V002', 'Life Blood', '555-3344', '200 Lake Rd'),
('V003', 'Blood Bank Co.', '555-5566', '300 Hill Rd'),
('V004', 'Donor Network', '555-7788', '400 Mountain Rd'),
('V005', 'Vital Blood Supply', '555-9900', '500 Valley Rd'),
('V006', 'LifeStream', '555-2233', '600 Ridge Rd'),
('V007', 'BloodWorks', '555-4455', '700 Plateau Rd'),
('V008', 'RedCell Inc.', '555-6677', '800 Cliff Rd'),
('V009', 'BioLife', '555-8899', '900 Meadow Rd'),
('V010', 'BloodConnect', '555-1010', '100 Memory Lane');

-- Insert 100 Nurses
INSERT INTO Nurse (NurseID, Name, ContactInfo) VALUES
    ('NurJ0001John', 'John Doe', 'DoeJohn0001'),
    ('NurA0002Amy', 'Amy Smith', 'SmithAmy0002'),
    ('NurM0003Mike', 'Mike Johnson', 'JohnsonMike0003'),
    ('NurS0004Sue', 'Sue Brown', 'BrownSue0004'),
    ('NurK0005Kate', 'Kate Davis', 'DavisKate0005'),
    ('NurT0006Tom', 'Tom Clark', 'ClarkTom0006'),
    ('NurB0007Beth', 'Beth Miller', 'MillerBeth0007'),
    ('NurC0008Chris', 'Chris Wilson', 'WilsonChris0008'),
    ('NurL0009Lily', 'Lily Moore', 'MooreLily0009'),
    ('NurD0010Dan', 'Dan Taylor', 'TaylorDan0010'),
    ('NurJ0011Jill', 'Jill Anderson', 'AndersonJill0011'),
    ('NurM0012Mark', 'Mark Thomas', 'ThomasMark0012'),
    ('NurE0013Eve', 'Eve Jackson', 'JacksonEve0013'),
    ('NurH0014Harry', 'Harry White', 'WhiteHarry0014'),
    ('NurN0015Nina', 'Nina Harris', 'HarrisNina0015'),
    ('NurA0016Adam', 'Adam Martin', 'MartinAdam0016'),
    ('NurO0017Olivia', 'Olivia Lee', 'LeeOlivia0017'),
    ('NurE0018Ethan', 'Ethan Young', 'YoungEthan0018'),
    ('NurH0019Hannah', 'Hannah Allen', 'AllenHannah0019'),
    ('NurD0020David', 'David King', 'KingDavid0020'),
    ('NurS0021Sara', 'Sara Scott', 'ScottSara0021'),
    ('NurB0022Ben', 'Ben Green', 'GreenBen0022'),
    ('NurL0023Laura', 'Laura Baker', 'BakerLaura0023'),
    ('NurJ0024James', 'James Gonzalez', 'GonzalezJames0024'),
    ('NurK0025Kelly', 'Kelly Nelson', 'NelsonKelly0025'),
    ('NurW0026Will', 'Will Carter', 'CarterWill0026'),
    ('NurA0027Anna', 'Anna Mitchell', 'MitchellAnna0027'),
    ('NurM0028Matt', 'Matt Perez', 'PerezMatt0028'),
    ('NurK0029Kim', 'Kim Roberts', 'RobertsKim0029'),
    ('NurD0030Derek', 'Derek Turner', 'TurnerDerek0030'),
    ('NurN0031Nora', 'Nora Phillips', 'PhillipsNora0031'),
    ('NurC0032Cody', 'Cody Campbell', 'CampbellCody0032'),
    ('NurJ0033Jan', 'Jan Evans', 'EvansJan0033'),
    ('NurR0034Ray', 'Ray Edwards', 'EdwardsRay0034'),
    ('NurL0035Lea', 'Lea Collins', 'CollinsLea0035'),
    ('NurB0036Brett', 'Brett Stewart', 'StewartBrett0036'),
    ('NurS0037Sam', 'Sam Sanchez', 'SanchezSam0037'),
    ('NurE0038Elle', 'Elle Morris', 'MorrisElle0038'),
    ('NurG0039Gary', 'Gary Rogers', 'RogersGary0039'),
    ('NurA0040Amy', 'Amy Reed', 'ReedAmy0040'),
    ('NurM0041Mia', 'Mia Cook', 'CookMia0041'),
    ('NurT0042Tony', 'Tony Morgan', 'MorganTony0042'),
    ('NurV0043Vera', 'Vera Bell', 'BellVera0043'),
    ('NurJ0044Jake', 'Jake Murphy', 'MurphyJake0044'),
    ('NurP0045Pam', 'Pam Bailey', 'BaileyPam0045'),
    ('NurC0046Cora', 'Cora Rivera', 'RiveraCora0046'),
    ('NurE0047Eric', 'Eric Cooper', 'CooperEric0047'),
    ('NurR0048Rita', 'Rita Richardson', 'RichardsonRita0048'),
    ('NurN0049Neil', 'Neil Cox', 'CoxNeil0049'),
    ('NurA0050Ava', 'Ava Howard', 'HowardAva0050'),
    ('NurS0051Sean', 'Sean Ward', 'WardSean0051'),
    ('NurM0052Meg', 'Meg Torres', 'TorresMeg0052'),
    ('NurJ0053Joe', 'Joe Peterson', 'PetersonJoe0053'),
    ('NurH0054Helen', 'Helen Gray', 'GrayHelen0054'),
    ('NurL0055Liam', 'Liam Ramirez', 'RamirezLiam0055'),
    ('NurB0056Blake', 'Blake James', 'JamesBlake0056'),
    ('NurS0057Stacy', 'Stacy Watson', 'WatsonStacy0057'),
    ('NurE0058Ella', 'Ella Brooks', 'BrooksElla0058'),
    ('NurA0059Alex', 'Alex Kelly', 'KellyAlex0059'),
    ('NurG0060Gwen', 'Gwen Sanders', 'SandersGwen0060'),
    ('NurM0061Mona', 'Mona Price', 'PriceMona0061'),
    ('NurJ0062Jane', 'Jane Bennett', 'BennettJane0062'),
    ('NurR0063Rick', 'Rick Wood', 'WoodRick0063'),
    ('NurC0064Cathy', 'Cathy Barnes', 'BarnesCathy0064'),
    ('NurP0065Paul', 'Paul Ross', 'RossPaul0065'),
    ('NurH0066Hope', 'Hope Henderson', 'HendersonHope0066'),
    ('NurN0067Nate', 'Nate Coleman', 'ColemanNate0067'),
    ('NurA0068Amy', 'Amy Jenkins', 'JenkinsAmy0068'),
    ('NurE0069Eli', 'Eli Perry', 'PerryEli0069'),
    ('NurS0070Sue', 'Sue Powell', 'PowellSue0070'),
    ('NurL0071Leo', 'Leo Long', 'LongLeo0071'),
    ('NurJ0072Jade', 'Jade Patterson', 'PattersonJade0072'),
    ('NurB0073Bill', 'Bill Hughes', 'HughesBill0073'),
    ('NurC0074Claire', 'Claire Flores', 'FloresClaire0074'),
    ('NurM0075Max', 'Max Washington', 'WashingtonMax0075'),
    ('NurN0076Nina', 'Nina Butler', 'ButlerNina0076'),
    ('NurR0077Roy', 'Roy Simmons', 'SimmonsRoy0077'),
    ('NurA0078Alma', 'Alma Foster', 'FosterAlma0078'),
    ('NurE0079Eva', 'Eva Gonzales', 'GonzalesEva0079'),
    ('NurH0080Harry', 'Harry Bryant', 'BryantHarry0080'),
    ('NurK0081Ken', 'Ken Alexander', 'AlexanderKen0081'),
    ('NurL0082Liz', 'Liz Russell', 'RussellLiz0082'),
    ('NurM0083Mia', 'Mia Griffin', 'GriffinMia0083'),
    ('NurT0084Tina', 'Tina Diaz', 'DiazTina0084'),
    ('NurJ0085John', 'John Hayes', 'HayesJohn0085'),
    ('NurP0086Pat', 'Pat Myers', 'MyersPat0086'),
    ('NurA0087Ana', 'Ana Ford', 'FordAna0087'),
    ('NurS0088Sam', 'Sam Hamilton', 'HamiltonSam0088'),
    ('NurC0089Cleo', 'Cleo Graham', 'GrahamCleo0089'),
    ('NurB0090Beth', 'Beth Sullivan', 'SullivanBeth0090'),
    ('NurR0091Ruth', 'Ruth Wallace', 'WallaceRuth0091'),
    ('NurD0092Dan', 'Dan West', 'WestDan0092'),
    ('NurN0093Nick', 'Nick Cole', 'ColeNick0093'),
    ('NurL0094Lena', 'Lena Bell', 'BellLena0094'),
    ('NurA0095Al', 'Al Fisher', 'FisherAl0095'),
    ('NurG0096Gina', 'Gina Ellis', 'EllisGina0096'),
    ('NurS0097Sara', 'Sara Grant', 'GrantSara0097'),
    ('NurJ0098Jack', 'Jack Rose', 'RoseJack0098'),
    ('NurK0099Kara', 'Kara Morales', 'MoralesKara0099'),
    ('NurE0100Elle', 'Elle Chapman', 'ChapmanElle0100');

-- Inserting 10 Nurses for each Vendor
-- Vendor V001 - Blood Services Inc.
INSERT INTO Vendor_Nurse (NurseID, VendorID) VALUES
    ('NurJ0001John', 'V001'),
    ('NurA0002Amy', 'V001'),
    ('NurM0003Mike', 'V001'),
    ('NurS0004Sue', 'V001'),
    ('NurK0005Kate', 'V001'),
    ('NurT0006Tom', 'V001'),
    ('NurB0007Beth', 'V001'),
    ('NurC0008Chris', 'V001'),
    ('NurL0009Lily', 'V001'),
    ('NurD0010Dan', 'V001');

-- Vendor V002 - Life Blood
INSERT INTO Vendor_Nurse (NurseID, VendorID) VALUES
    ('NurJ0011Jill', 'V002'),
    ('NurM0012Mark', 'V002'),
    ('NurE0013Eve', 'V002'),
    ('NurH0014Harry', 'V002'),
    ('NurN0015Nina', 'V002'),
    ('NurA0016Adam', 'V002'),
    ('NurO0017Olivia', 'V002'),
    ('NurE0018Ethan', 'V002'),
    ('NurH0019Hannah', 'V002'),
    ('NurD0020David', 'V002');

-- Vendor V003 - Blood Bank Co.
INSERT INTO Vendor_Nurse (NurseID, VendorID) VALUES
    ('NurS0021Sara', 'V003'),
    ('NurB0022Ben', 'V003'),
    ('NurL0023Laura', 'V003'),
    ('NurJ0024James', 'V003'),
    ('NurK0025Kelly', 'V003'),
    ('NurW0026Will', 'V003'),
    ('NurA0027Anna', 'V003'),
    ('NurM0028Matt', 'V003'),
    ('NurK0029Kim', 'V003'),
    ('NurD0030Derek', 'V003');

-- Vendor V004 - Donor Network
INSERT INTO Vendor_Nurse (NurseID, VendorID) VALUES
    ('NurN0031Nora', 'V004'),
    ('NurC0032Cody', 'V004'),
    ('NurJ0033Jan', 'V004'),
    ('NurR0034Ray', 'V004'),
    ('NurL0035Lea', 'V004'),
    ('NurB0036Brett', 'V004'),
    ('NurS0037Sam', 'V004'),
    ('NurE0038Elle', 'V004'),
    ('NurG0039Gary', 'V004'),
    ('NurA0040Amy', 'V004');

-- Vendor V005 - Vital Blood Supply
INSERT INTO Vendor_Nurse (NurseID, VendorID) VALUES
    ('NurM0041Mia', 'V005'),
    ('NurT0042Tony', 'V005'),
    ('NurV0043Vera', 'V005'),
    ('NurJ0044Jake', 'V005'),
    ('NurP0045Pam', 'V005'),
    ('NurC0046Cora', 'V005'),
    ('NurE0047Eric', 'V005'),
    ('NurR0048Rita', 'V005'),
    ('NurN0049Neil', 'V005'),
    ('NurA0050Ava', 'V005');

-- Vendor V006 - LifeStream
INSERT INTO Vendor_Nurse (NurseID, VendorID) VALUES
    ('NurS0051Sean', 'V006'),
    ('NurM0052Meg', 'V006'),
    ('NurJ0053Joe', 'V006'),
    ('NurH0054Helen', 'V006'),
    ('NurL0055Liam', 'V006'),
    ('NurB0056Blake', 'V006'),
    ('NurS0057Stacy', 'V006'),
    ('NurE0058Ella', 'V006'),
    ('NurA0059Alex', 'V006'),
    ('NurG0060Gwen', 'V006');

-- Vendor V007 - BloodWorks
INSERT INTO Vendor_Nurse (NurseID, VendorID) VALUES
    ('NurM0061Mona', 'V007'),
    ('NurJ0062Jane', 'V007'),
    ('NurR0063Rick', 'V007'),
    ('NurC0064Cathy', 'V007'),
    ('NurP0065Paul', 'V007'),
    ('NurH0066Hope', 'V007'),
    ('NurN0067Nate', 'V007'),
    ('NurA0068Amy', 'V007'),
    ('NurE0069Eli', 'V007'),
    ('NurS0070Sue', 'V007');

-- Vendor V008 - RedCell Inc.
INSERT INTO Vendor_Nurse (NurseID, VendorID) VALUES
    ('NurL0071Leo', 'V008'),
    ('NurJ0072Jade', 'V008'),
    ('NurB0073Bill', 'V008'),
    ('NurC0074Claire', 'V008'),
    ('NurM0075Max', 'V008'),
    ('NurN0076Nina', 'V008'),
    ('NurR0077Roy', 'V008'),
    ('NurA0078Alma', 'V008'),
    ('NurE0079Eva', 'V008'),
    ('NurH0080Harry', 'V008');

-- Vendor V009 - BioLife
INSERT INTO Vendor_Nurse (NurseID, VendorID) VALUES
    ('NurK0081Ken', 'V009'),
    ('NurL0082Liz', 'V009'),
    ('NurM0083Mia', 'V009'),
    ('NurT0084Tina', 'V009'),
    ('NurJ0085John', 'V009'),
    ('NurP0086Pat', 'V009'),
    ('NurA0087Ana', 'V009'),
    ('NurS0088Sam', 'V009'),
    ('NurC0089Cleo', 'V009'),
    ('NurB0090Beth', 'V009');

-- Vendor V010 - BloodConnect
INSERT INTO Vendor_Nurse (NurseID, VendorID) VALUES
    ('NurR0091Ruth', 'V010'),
    ('NurD0092Dan', 'V010'),
    ('NurN0093Nick', 'V010'),
    ('NurL0094Lena', 'V010'),
    ('NurA0095Al', 'V010'),
    ('NurG0096Gina', 'V010'),
    ('NurS0097Sara', 'V010'),
    ('NurJ0098Jack', 'V010'),
    ('NurK0099Kara', 'V010'),
    ('NurE0100Elle', 'V010');
