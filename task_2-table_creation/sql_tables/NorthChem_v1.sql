/*
1
GeneralChemical (ProductNo CHAR(4), ProductName VARCHAR(30), ProductDescription VARCHAR(255), ProductPrice DECIMAL(6,2) POSITIVE, 
HazardType CHAR(6) ON UPDATE CASCADE/ON DELETE SET NULL, Unit CHAR(4) ON UPDATE CASCADE/ON DELETE SET NULL, 
ProductRepresentative CHAR(3)) ON UPDATE CASCADE/ON DELETE SET NULL
						
Primary Key	    ProductNo					
Foreign Key 	    ProductRepresentative REFERENCES Employee(EmployeeID)
Foreign Key 	    Unit REFERENCES Unit(UnitID)					
Foreign Key	    HazardType REFERENCES HazardLevel(HazardLevelID)	
Alternate Key	    ProductName, ProductPrice
*/

CREATE TABLE GeneralChemical (
    ProductNo                   CHAR(4)                 NOT NULL,
    ProductName                 VARCHAR(30)             NOT NULL,
    ProductDescription          VARCHAR(255),
    ProductPrice                DECIMAL(6,2),
    HazardType                  CHAR(6),
    Unit                        CHAR(4),
    ProductRepresentative       CHAR(3),
    CONSTRAINT PK_GeneralChemical PRIMARY KEY (ProductNo),
    CONSTRAINT Correct_Price_GC CHECK (ProductPrice >= 0),
    CONSTRAINT AK_GeneralChemical UNIQUE (ProductName, ProductPrice),
    CONSTRAINT FK_HazardType FOREIGN KEY (HazardType) REFERENCES HazardLevel (HazardLevelID)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT FK_Unit FOREIGN KEY (Unit) REFERENCES Unit (UnitID)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT FK_ProductRepresentative FOREIGN KEY (ProductRepresentative) REFERENCES Employee (EmployeeID)
        ON DELETE SET NULL ON UPDATE CASCADE   
);

/*
2
Paint (ProductNo CHAR(4), ProductName VARCHAR(30), ProductDescription VARCHAR(255), ProductPrice DECIMAL(6,2) POSITIVE, 
ColorType CHAR(6) ON UPDATE CASCADE/ON DELETE SET NULL, Unit CHAR(4) ON UPDATE CASCADE/ON DELETE SET NULL, 
ProductRepresentative CHAR(3)) ON UPDATE CASCADE/ON DELETE SET NULL
							
Primary Key		ProductNo					
Foreign Key 		ProductRepresentative REFERENCES Employee(EmployeeID)
Foreign Key 		Unit REFERENCES Unit(UnitID)			
Foreign Key 		ColorType REFERENCES Color(ColorID)	
Alternate Key	    ProductName, ProductPrice
*/

CREATE TABLE Paint (
    ProductNo               CHAR(4)                 NOT NULL,
    ProductName             VARCHAR(30)             NOT NULL,
    ProductDescription      VARCHAR(255),
    ProductPrice            DECIMAL(6,2),
    ColorType               CHAR(6),
    Unit                    CHAR(4),
    ProductRepresentative   CHAR(3),
    CONSTRAINT PK_Paint PRIMARY KEY (ProductNo),
    CONSTRAINT AK_Paint UNIQUE (ProductName, ProductPrice),
    CONSTRAINT Correct_Price_P CHECK (ProductPrice >= 0),
    CONSTRAINT FK_ProductRepresentative FOREIGN KEY (ProductRepresentative) REFERENCES Employee (EmployeeID)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT FK_Unit FOREIGN KEY (Unit) REFERENCES Unit (UnitID)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT FK_ColorType FOREIGN KEY (ColorType) REFERENCES Color (ColorID)
        ON DELETE SET NULL ON UPDATE CASCADE    
);

/*
3
FeedstuffAdditive (ProductNo CHAR(4), ProductName VARCHAR(30), ProductDescription VARCHAR(255), ProductPrice DECIMAL(6,2) POSITIVE, 
Toxicity CHAR(6) ON UPDATE CASCADE/ON DELETE SET NULL, ShelfingLife CHAR(6) ON UPDATE CASCADE/ON DELETE SET NULL, 
Unit CHAR(4 ON UPDATE CASCADE/ON DELETE SET NULL), ProductRepresentative CHAR(3)) ON UPDATE CASCADE/ON DELETE SET NULL
								
Primary Key		ProductNo						
Foreign Key 	     ProductRepresentative REFERENCES Employee(EmployeeID)
Foreign Key   	Unit REFERENCES Unit(UnitID)					
Foreign Key  	    ShelfingLife REFERENCES ShelfLife(ShelfLifeID)		
Foreign Key     	Toxicity REFERENCES ToxicityLevel (ToxicityLevelID)			
Alternate Key	    ProductName, ProductPrice
*/

CREATE TABLE FeedstuffAdditive (
    ProductNo               CHAR(4)                 NOT NULL,
    ProductName             VARCHAR(30)             NOT NULL,
    ProductDescription      VARCHAR(255),
    ProductPrice            DECIMAL(6,2),
    Toxicity                CHAR(6),
    ShelfingLife            CHAR(6),
    Unit                    CHAR(4),
    ProductRepresentative   CHAR(3),
    CONSTRAINT PK_FeedstuffAdditive PRIMARY KEY (ProductNo),
    CONSTRAINT AK_FeedstuffAdditive UNIQUE (ProductName, ProductPrice),
    CONSTRAINT Correct_Price_FA CHECK (ProductPrice >= 0),
    CONSTRAINT FK_ProductRepresentative FOREIGN KEY (ProductRepresentative) REFERENCES Employee (EmployeeID)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT FK_Unit FOREIGN KEY (Unit) REFERENCES Unit (UnitID)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT FK_ShelfingLife FOREIGN KEY (ShelfingLife) REFERENCES ShelfLife (ShelfLifeID)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT FK_Toxicity FOREIGN KEY (Toxicity) REFERENCES ToxicityLevel (ToxicityLevelID)
        ON DELETE SET NULL ON UPDATE CASCADE        
);

/*
4
Unit (UnitID CHAR(4), UnitDescription VARCHAR(30))
					
Primary Key		UnitID		
*/

CREATE TABLE Unit (
    UnitID                  CHAR(4)                 NOT NULL,
    UnitDescription         VARCHAR(30),
    CONSTRAINT PK_Unit PRIMARY KEY (UnitID)
);

/*
5
HazardLevel (HazardLevelID CHAR(6), HazardLevelNo INT(1 TO 5), HazardLevelDescription VARCHAR(255), 
RegulationLink CHAR(6)) ON UPDATE CASCADE/ON DELETE SET NULL			
							
Primary Key	        HazardLevelID					
Foreign Key           RegulationLink REFERENCES Regulation(RegulationID)	
Alternate Key	        HazardLevelID, HazardLevelDescription
*/

CREATE TABLE HazardLevel (
    HazardLevelID           CHAR(6)                 NOT NULL,
    HazardLevelNo           NUMBER(2)               NOT NULL,
    HazardLevelDescription  VARCHAR(255),
    RegulationLink          CHAR(6),
    CONSTRAINT PK_HazardLevel PRIMARY KEY (HazardLevelID),
    CONSTRAINT AK_HazardLevel UNIQUE (HazardLevelNo, HazardLevelDescription),
    CONSTRAINT FK_RegulationLink FOREIGN KEY (RegulationLink) REFERENCES Regulation(RegulationID)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT Hazard_Number CHECK (HazardLevelNo > 0)
);

/*
6
Color (ColorID CHAR(6), ColorName CHAR(30), ColorStyle CHAR(30))			
							
Primary Key	    ColorID					
Alternate Key	    ColorName, ColorStyle
*/

CREATE TABLE Color (
    ColorID                 CHAR(6)                 NOT NULL,
    ColorName               CHAR(30)                NOT NULL,
    ColorStyle              CHAR(30),
    CONSTRAINT PK_Color PRIMARY KEY (ColorID),
    CONSTRAINT AK_Color UNIQUE (ColorName, ColorStyle)
);

/*
7
ToxicityLevel (ToxicityLevelID CHAR(6), ToxicityLevelNo INT(1 TO 5), ToxicityLevelDescription CHAR(255), 
RegulationLink CHAR(6)) ON UPDATE CASCADE/ON DELETE SET NULL			
							
Primary Key	            ToxicityLevelID					
Foreign Key 	            RegulationLink REFERENCES Regulation(RegulationID)	
Alternate Key	            ToxicityLevelNo, ToxicityLevelID
*/

CREATE TABLE ToxicityLevel (
    ToxicityLevelID             CHAR(6)                 NOT NULL, 
    ToxicityLevelNo             INTEGER(1)              NOT NULL, 
    ToxicityLevelDescription    CHAR(255), 
    RegulationLink              CHAR(6),
    CONSTRAINT PK_ToxicityLevel PRIMARY KEY (ToxicityLevelID),
    CONSTRAINT AK_ToxicityLevel UNIQUE (ToxicityLevelNo, ToxicityLevelDescription),
    CONSTRAINT Correct_Toxicity CHECK (ToxicityLevelNo >=1 AND ToxicityLevelNo <= 5)
    CONSTRAINT FK_RegulationLink FOREIGN KEY (RegulationLink) REFERENCES Regulation(RegulationID)
        ON DELETE SET NULL ON UPDATE CASCADE  
);

/*
8
ShelfLife (ShelfLifeID CHAR(6), ShelfLifeNo VARCHAR(15), ShelfLifeDescription VARCHAR(255), 
RegulationLink CHAR(6)) ON UPDATE CASCADE/ON DELETE SET NULL		
							
Primary Key	            ShelfLifeID					
Foreign Key 	            RegulationLink REFERENCES Regulation(RegulationID)	
Alternate Key	            ShelfLifeNo, ShelfLifeDescription
*/

CREATE TABLE ShelfLife (
    ShelfLifeID                 CHAR(6)                 NOT NULL,
    ShelfLifeNo                 VARCHAR(15)             NOT NULL,
    ShelfLifeDescription        VARCHAR(255), 
    RegulationLink              CHAR(6),
    CONSTRAINT PK_ShelfLife PRIMARY KEY (ShelfLifeID),
    CONSTRAINT AK_ShelfLife UNIQUE (ShelfLifeNo, ShelfLifeDescription),
    CONSTRAINT FK_RegulationLink FOREIGN KEY (RegulationLink) REFERENCES Regulation(RegulationID)
        ON DELETE SET NULL ON UPDATE CASCADE
);


/*
9
Regulation (RegulationID CHAR(6), RegulationDescription CHAR(255)			
							
Primary Key	RegulationID		
*/

CREATE TABLE Regulation (
    RegulationID                CHAR(6)                 NOT NULL,
    RegulationDescription       CHAR(255),
    CONSTRAINT FK_Regulation PRIMARY KEY (RegulationID)
);

/*
10
Employee (EmployeeID CHAR(3), EmployeeFName VARCHAR(30), EmployeeLName VARCHAR(30), 
EmployeeGrade INT(1 TO 5) ON UPDATE CASCADE/ON DELETE SET NULL, 
Supervisor CHAR(3) MUST BE LEVEL 5 EMPLOYEE... ON UPDATE CASCADE/ON DELETE SET NULL)
								
Primary Key	EmployeeID						
Foreign Key 	EmployeeGrade REFERENCES Grade(GradeID)	
Foreign Key 	Supervisor REFERENCES Employee(EmployeeID)	
Alternate Key	EmployeeName, EmployeeGrade
*/

CREATE TABLE Employee (
    EmployeeID                  CHAR(3)                 NOT NULL,
    EmployeeFName               VARCHAR(30)             NOT NULL,
    EmployeeLName               VARCHAR(30)             NOT NULL, 
    EmployeeGrade               INTEGER(1),
    Supervisor                  CHAR(3),
    CONSTRAINT PK_Employee PRIMARY KEY (EmployeeID),
    CONSTRAINT AK_Employee UNIQUE (EmployeeName, EmployeeGrade),
    CONSTRAINT FK_EmployeeGrade FOREIGN KEY (EmployeeGrade) REFERENCES Grade(GradeID)
        ON DELETE SET NULL,
    CONSTRAINT FK_Supervisor FOREIGN KEY (Supervisor) REFERENCES Employee(EmployeeID)
        ON DELETE SET NULL,
    CONSTRAINT Correct_Grade CHECK (EmployeeGrade >= 1 AND EmployeeGrade <= 5),
    CONSTRAINT Correct_Supervisor CHECK (NOT EXISTS (SELECT EmployeeID
                                                     FROM Employee
                                                     WHERE Employee.EmployeeGrade != 5))
);

/*
11
EmployeeGrade (GradeID INT(1 TO 5), GradeName VARCHAR(30), Salary DECIMAL(7,2) POSITIVE)					
								
Primary Key	GradeID						
Alternate Key	GradeName, Salary
*/

CREATE TABLE EmployeeGrade (
    GradeID                     NUMBER(2)              NOT NULL,
    GradeName                   VARCHAR(30), 
    Salary                      DECIMAL(7,2),
    CONSTRAINT PK_EmployeeGrade PRIMARY KEY (GradeID),
    CONSTRAINT AK_EmployeeGrade UNIQUE (GradeName, Salary),
    CONSTRAINT Correct_GradeID CHECK (GradeID > 0),
    CONSTRAINT Correct_Salary CHECK (Salary >= 0)
);

/*
12
Area	(AreaID INT(1 TO 100) POSITIVE, AreaName VARCHAR(30), AreaDepot VARCHAR(30), 
AreaManager CHAR(3) MUST BE LEVEL 3 EMPLOYEE... ON UPDATE CASCADE/ON DELETE SET NULL)				
								
Primary Key	AreaID						
Foreign Key 	AreaManager REFERENCES Employee(EmployeeID)
Alternate Key	AreaName, AreaDepot
*/

CREATE TABLE Area (
    AreaID                      INTEGER(2)              NOT NULL,
    AreaName                    VARCHAR(30)             NOT NULL,
    AreaDepot                   VARCHAR(30), 
    AreaManager                 CHAR(3),
    CONSTRAINT PK_Area PRIMARY KEY (AreaID),
    CONSTRAINT AK_Area UNIQUE (AreaName, AreaDepot),
    CONSTRAINT FK_AreaManager FOREIGN KEY (AreaManager) REFERENCES Employee(EmployeeID)
        ON DELETE SET NULL,
    CONSTRAINT Correct_Area_No CHECK (AreaID >= 1 AND AreaID <= 99),
    CONSTRAINT Correct_Manager CHECK (NOT EXISTS (SELECT EmployeeID
                                                  FROM Employee
                                                  WHERE Employee.EmployeeGrade != '3'))
);

/*
13
Customer (CustomerID CHAR(4), CustomerFName VARCHAR(30), CustomerLName VARCHAR(30), CustomerAddress VARCHAR(255), 
CustomerArea INT(1 TO 100) ON UPDATE CASCADE/ON DELETE SET NULL POSITIVE, 
CustomerRepresentative CHAR(3)) ON UPDATE CASCADE/ON DELETE SET NULL		
								
Primary Key	    CustomerID						
Foreign Key 	    CustomerArea REFERENCES Area(AreaID)		
Foreign Key       CustomerRepresentative REFERENCES Employee(EmployeeID)
Alternate Key	    CustomerLName, CustomerAddress
*/

CREATE TABLE Customer (
    CustomerID                  CHAR(4)                 NOT NULL,
    CustomerFName               VARCHAR(30)             NOT NULL,
    CustomerLName               VARCHAR(30)             NOT NULL,
    CustomerAddress             VARCHAR(255), 
    CustomerArea                INTEGER(2), 
    CustomerRepresentative      CHAR(3),
    CONSTRAINT PK_Customer PRIMARY KEY (CustomerID),
    CONSTRAINT AK_Customer UNIQUE (CustomerLName, CustomerAddress),
    CONSTRAINT FK_CustomerArea FOREIGN KEY (CustomerArea) REFERENCES Area(AreaID)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT FK_CustomerRepresentative FOREIGN KEY (CustomerRepresentative) REFERENCES Employee(EmployeeID)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT Correct_Customer_Area CHECK (CustomerArea >= 1 AND CustomerArea <= 99)
);

/*
14
CustomerAccount  (AccountNumber CHAR(6), Customer CHAR(4)) ON UPDATE CASCADE/ON DELETE SET NULL					
								
Primary Key           AccountNumber						
Foreign Key 	        Customer REFERENCES Customer(CustomerID)	
*/

CREATE TABLE CustomerAccount (
    AccountNumber               CHAR(6)                 NOT NULL,
    Customer                    CHAR(4),
    CONSTRAINT PK_CustomerAccount PRIMARY KEY (AccountNumber),
    CONSTRAINT FK_Customer FOREIGN KEY (Customer) REFERENCES Customer(CustomerID)    
);










