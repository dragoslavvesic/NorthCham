-- 1) unit
INSERT INTO unit (UnitID, UnitDescription) VALUES ('U001', '1 gallon');
INSERT INTO unit (UnitID, UnitDescription) VALUES ('U002', '2 gallonS');
INSERT INTO unit (UnitID, UnitDescription) VALUES ('U003', '3 gallon');
INSERT INTO unit (UnitID, UnitDescription) VALUES ('U004', '1 litre');
INSERT INTO unit (UnitID, UnitDescription) VALUES ('U005', '2 litres');


-- 2) color
INSERT INTO color (ColorID, ColorName, ColorStyle) VALUES ('COL001', 'White', NULL);
INSERT INTO color (ColorID, ColorName, ColorStyle) VALUES ('COL002', 'Black', 'Mat');
INSERT INTO color (ColorID, ColorName, ColorStyle) VALUES ('COL003', 'Red', 'Pale');
INSERT INTO color (ColorID, ColorName, ColorStyle) VALUES ('COL004', 'Orange', 'Bright');
INSERT INTO color (ColorID, ColorName, ColorStyle) VALUES ('COL005', 'Blue', 'Gloss');

-- 3) regulation
INSERT INTO regulation (RegulationID, RegulationDescription) VALUES ('REG001', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit');
INSERT INTO regulation (RegulationID, RegulationDescription) VALUES ('REG002', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit');
INSERT INTO regulation (RegulationID, RegulationDescription) VALUES ('REG003', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit');
INSERT INTO regulation (RegulationID, RegulationDescription) VALUES ('REG004', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit');
INSERT INTO regulation (RegulationID, RegulationDescription) VALUES ('REG005', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit');
INSERT INTO regulation (RegulationID, RegulationDescription) VALUES ('REG006', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit');

-- 4) EmployeeGrade
INSERT INTO EmployeeGrade (GradeID, GradeName, Salary) VALUES (1, 'Junior Salesman', 10000);
INSERT INTO EmployeeGrade (GradeID, GradeName, Salary) VALUES (2, 'Salesman', 15000);
INSERT INTO EmployeeGrade (GradeID, GradeName, Salary) VALUES (3, 'Area Manager', 20000);
INSERT INTO EmployeeGrade (GradeID, GradeName, Salary) VALUES (4, 'Senior Area Manager', 25000);
INSERT INTO EmployeeGrade (GradeID, GradeName, Salary) VALUES (5, 'Team Supervisor', 32000);
INSERT INTO EmployeeGrade (GradeID, GradeName, Salary) VALUES (6, 'General Manager', 40000);

-- 5) HazardLevel
INSERT INTO HazardLevel (HazardLevelID, HazardLevelNo, HazardLevelDescription, RegulationLink) VALUES ('HAZ001', 1, 'Very low, bening hazard', 'REG001');
INSERT INTO HazardLevel (HazardLevelID, HazardLevelNo, HazardLevelDescription, RegulationLink) VALUES ('HAZ002', 2, 'Medium, moderate toxicity', 'REG001');
INSERT INTO HazardLevel (HazardLevelID, HazardLevelNo, HazardLevelDescription, RegulationLink) VALUES ('HAZ003', 2, 'Medium, average toxicity', 'REG002');
INSERT INTO HazardLevel (HazardLevelID, HazardLevelNo, HazardLevelDescription, RegulationLink) VALUES ('HAZ004', 3, 'High, bening skin toxicity', 'REG004');
INSERT INTO HazardLevel (HazardLevelID, HazardLevelNo, HazardLevelDescription, RegulationLink) VALUES ('HAZ005', 4, 'Very high, moderate skin toxicity', 'REG005');
INSERT INTO HazardLevel (HazardLevelID, HazardLevelNo, HazardLevelDescription, RegulationLink) VALUES ('HAZ006', 5, 'Critical, immediate toxicity', 'REG006');

-- 6) ToxicityLevel
INSERT INTO ToxicityLevel (ToxicityLevelID, ToxicityLevelNo, ToxicityLevelDescription, RegulationLink) VALUES ('TOX001', 1, 'Very low, bening toxicity', 'REG001');
INSERT INTO ToxicityLevel (ToxicityLevelID, ToxicityLevelNo, ToxicityLevelDescription, RegulationLink) VALUES ('TOX002', 2, 'Medium, moderate toxicity', 'REG001');
INSERT INTO ToxicityLevel (ToxicityLevelID, ToxicityLevelNo, ToxicityLevelDescription, RegulationLink) VALUES ('TOX003', 2, 'Medium, average toxicity', 'REG002');
INSERT INTO ToxicityLevel (ToxicityLevelID, ToxicityLevelNo, ToxicityLevelDescription, RegulationLink) VALUES ('TOX004', 3, 'High, bening skin toxicity', 'REG004');
INSERT INTO ToxicityLevel (ToxicityLevelID, ToxicityLevelNo, ToxicityLevelDescription, RegulationLink) VALUES ('TOX005', 4, 'Very high, moderate skin toxicity', 'REG005');
INSERT INTO ToxicityLevel (ToxicityLevelID, ToxicityLevelNo, ToxicityLevelDescription, RegulationLink) VALUES ('TOX006', 5, 'Critical, immediate toxicity', 'REG006');

-- 7) ShelfLife
INSERT INTO ShelfLife (ShelfLifeID, ShelfLifeNo, ShelfLifeDescription, RegulationLink) VALUES ('SHL001', 1, 'No expiration', 'REG002');
INSERT INTO ShelfLife (ShelfLifeID, ShelfLifeNo, ShelfLifeDescription, RegulationLink) VALUES ('SHL002', 2, 'Extended shelflife', 'REG001');
INSERT INTO ShelfLife (ShelfLifeID, ShelfLifeNo, ShelfLifeDescription, RegulationLink) VALUES ('SHL003', 2, 'Extended shelflife, temperature resistant', 'REG002');
INSERT INTO ShelfLife (ShelfLifeID, ShelfLifeNo, ShelfLifeDescription, RegulationLink) VALUES ('SHL004', 3, 'Moderate shelflife', 'REG003');
INSERT INTO ShelfLife (ShelfLifeID, ShelfLifeNo, ShelfLifeDescription, RegulationLink) VALUES ('SHL005', 4, 'Low shelflife', 'REG003');
INSERT INTO ShelfLife (ShelfLifeID, ShelfLifeNo, ShelfLifeDescription, RegulationLink) VALUES ('SHL006', 5, 'Immediate usage only', 'REG006');

-- 8) Employee
INSERT INTO Employee (EmployeeID, EmployeeFName, EmployeeLName, EmployeeGrade, Supervisor) VALUES ('R01','Mary', 'Breen', 5, 'R06');
INSERT INTO Employee (EmployeeID, EmployeeFName, EmployeeLName, EmployeeGrade, Supervisor) VALUES ('R02','Eden', 'Hazard', 3, 'R01');
INSERT INTO Employee (EmployeeID, EmployeeFName, EmployeeLName, EmployeeGrade, Supervisor) VALUES ('R03','Bill', 'Jones', 2, 'R01');
INSERT INTO Employee (EmployeeID, EmployeeFName, EmployeeLName, EmployeeGrade, Supervisor) VALUES ('R04','Jane', 'Chilton', 3, 'R05');
INSERT INTO Employee (EmployeeID, EmployeeFName, EmployeeLName, EmployeeGrade, Supervisor) VALUES ('R05','Mick', 'Jagger', 5, 'R06');
INSERT INTO Employee (EmployeeID, EmployeeFName, EmployeeLName, EmployeeGrade, Supervisor) VALUES ('R06','Lionel', 'Messi', 6, 'R06');
INSERT INTO Employee (EmployeeID, EmployeeFName, EmployeeLName, EmployeeGrade, Supervisor) VALUES ('R07','Dragan', 'Mance', 2, 'R01');
INSERT INTO Employee (EmployeeID, EmployeeFName, EmployeeLName, EmployeeGrade, Supervisor) VALUES ('R08','Milko', 'Djurovski', 3, 'R05');
INSERT INTO Employee (EmployeeID, EmployeeFName, EmployeeLName, EmployeeGrade, Supervisor) VALUES ('R09','Stef', 'Curry', 1, 'R01');
INSERT INTO Employee (EmployeeID, EmployeeFName, EmployeeLName, EmployeeGrade, Supervisor) VALUES ('R10','Jim', 'Gow', 3, 'R05');

-- 9) Area
INSERT INTO Area (AreaID, AreaName, AreaDepot, AreaManager) VALUES (1, 'Northumberland', 'Corbridge', 'R04');
INSERT INTO Area (AreaID, AreaName, AreaDepot, AreaManager) VALUES (2, 'Chelsea', 'Stamford Bridge', 'R02');
INSERT INTO Area (AreaID, AreaName, AreaDepot, AreaManager) VALUES (3, 'NE Central', 'Blaydon', 'R04');
INSERT INTO Area (AreaID, AreaName, AreaDepot, AreaManager) VALUES (4, 'Partizan', 'Humska 1', 'R08');
INSERT INTO Area (AreaID, AreaName, AreaDepot, AreaManager) VALUES (5, 'Central London', 'Picadilly', 'R02');
INSERT INTO Area (AreaID, AreaName, AreaDepot, AreaManager) VALUES (6, 'Belgrade', 'Central Station', 'R10');
INSERT INTO Area (AreaID, AreaName, AreaDepot, AreaManager) VALUES (7, 'Cumbria', 'Penrith', 'R10');

-- 10) Customer
INSERT INTO Customer (CustomerID, CustomerFName, CustomerLName, CustomerAddress, CustomerArea, CustomerRepresentative) VALUES ('C001','John Wayne', 'Limited', 'Hollywood Street', 1, 'R08');
INSERT INTO Customer (CustomerID, CustomerFName, CustomerLName, CustomerAddress, CustomerArea, CustomerRepresentative) VALUES ('C002','Erik Clapton', 'Limited', 'Music Street', 3, 'R09');
INSERT INTO Customer (CustomerID, CustomerFName, CustomerLName, CustomerAddress, CustomerArea, CustomerRepresentative) VALUES ('C003','Smiths Heavy Crisps', 'Co.', 'Unit 34 Armley Industrial Estate', 1, 'R05');
INSERT INTO Customer (CustomerID, CustomerFName, CustomerLName, CustomerAddress, CustomerArea, CustomerRepresentative) VALUES ('C004','John Coltraine', 'Limited', 'Legend Street No1', 6, 'R03');
INSERT INTO Customer (CustomerID, CustomerFName, CustomerLName, CustomerAddress, CustomerArea, CustomerRepresentative) VALUES ('C005','Miles Davis', 'Limited', 'Music Square No23', 5, 'R07');
INSERT INTO Customer (CustomerID, CustomerFName, CustomerLName, CustomerAddress, CustomerArea, CustomerRepresentative) VALUES ('C006','Star Wars Franchise', 'Co.', 'Universe Space No314', 7, 'R10');
INSERT INTO Customer (CustomerID, CustomerFName, CustomerLName, CustomerAddress, CustomerArea, CustomerRepresentative) VALUES ('C007','Smurfit Industries', 'HQ', '18 Skirl Street, Hexham', 7, 'R09');
INSERT INTO Customer (CustomerID, CustomerFName, CustomerLName, CustomerAddress, CustomerArea, CustomerRepresentative) VALUES ('C800','J. Parfitt (Mrs)', 'Limited', '84 Road Avenue, Carlisle', 3, 'R02');

-- 11) CustomerAccount
INSERT INTO CustomerAccount (AccountNumber, Customer) VALUES ('A30066', 'C002');
INSERT INTO CustomerAccount (AccountNumber, Customer) VALUES ('A30045', 'C003');
INSERT INTO CustomerAccount (AccountNumber, Customer) VALUES ('A40023', 'C007');
INSERT INTO CustomerAccount (AccountNumber, Customer) VALUES ('A00478', 'C800');
INSERT INTO CustomerAccount (AccountNumber, Customer) VALUES ('A12001', 'C005');
INSERT INTO CustomerAccount (AccountNumber, Customer) VALUES ('A01023', 'C006');

-- 12) GeneralChemical
INSERT INTO GeneralChemical (ProductNo, ProductName, ProductDescription, ProductPrice, HazardType, Unit, ProductRepresentative) VALUES ('P004','Hydrocaust', 'Caustic Acid', 32, 'HAZ006', 'U001', 'R05');
INSERT INTO GeneralChemical (ProductNo, ProductName, ProductDescription, ProductPrice, HazardType, Unit, ProductRepresentative) VALUES ('P005','Hydrogen', 'Hydrogen Peroxide', 22, 'HAZ003', 'U004', 'R07');
INSERT INTO GeneralChemical (ProductNo, ProductName, ProductDescription, ProductPrice, HazardType, Unit, ProductRepresentative) VALUES ('P006','Selenium', 'Motor Oil', 44, 'HAZ002', 'U002', 'R04');
INSERT INTO GeneralChemical (ProductNo, ProductName, ProductDescription, ProductPrice, HazardType, Unit, ProductRepresentative) VALUES ('P011','Cortizon Air', 'Robot Varnish', 100, 'HAZ001', 'U003', 'R08');

-- 13) Paint
INSERT INTO Paint (ProductNo, ProductName, ProductDescription, ProductPrice, ColorType, Unit, ProductRepresentative) VALUES ('P002','Blue Farlex Gloss', 'Blue exterior Gloss Paint', 13, 'COL005', 'U004', 'R09');
INSERT INTO Paint (ProductNo, ProductName, ProductDescription, ProductPrice, ColorType, Unit, ProductRepresentative) VALUES ('P003','Red Fox', 'Car color, superior', 22, 'COL003', 'U005', 'R01');
INSERT INTO Paint (ProductNo, ProductName, ProductDescription, ProductPrice, ColorType, Unit, ProductRepresentative) VALUES ('P007','Green Hornets', 'General servicing color', 10, 'COL006', 'U005', 'R05');
INSERT INTO Paint (ProductNo, ProductName, ProductDescription, ProductPrice, ColorType, Unit, ProductRepresentative) VALUES ('P001','Orange Firebrand', 'High quality cover', 15, 'COL004', 'U001', 'R03');

-- 14) FeedstuffAdditive
INSERT INTO FeedstuffAdditive (ProductNo, ProductName, ProductDescription, ProductPrice, Toxicity, ShelfingLife, Unit, ProductRepresentative) VALUES ('P008','SuperReach', 'Additive supreme', 16, 'TOX001', 'SHL001', 'U004', 'R01');
INSERT INTO FeedstuffAdditive (ProductNo, ProductName, ProductDescription, ProductPrice, Toxicity, ShelfingLife, Unit, ProductRepresentative) VALUES ('P009','Variaty Blue', 'Energizer tick', 28, 'TOX004', 'SHL001', 'U002', 'R03');
INSERT INTO FeedstuffAdditive (ProductNo, ProductName, ProductDescription, ProductPrice, Toxicity, ShelfingLife, Unit, ProductRepresentative) VALUES ('P010','Mixer carbonate', 'Provision fuel creater', 44, 'TOX004', 'SHL005', 'U003', 'R04');
INSERT INTO FeedstuffAdditive (ProductNo, ProductName, ProductDescription, ProductPrice, Toxicity, ShelfingLife, Unit, ProductRepresentative) VALUES ('P012','Driver protex', 'Additive gravy ultra', 35, 'TOX002', 'SHL002', 'U001', 'R09');
