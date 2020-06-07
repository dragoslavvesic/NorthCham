-- 1
CREATE TABLE Unit (
    UnitID                  CHAR(4)                 NOT NULL,
    UnitDescription         VARCHAR(30),
    CONSTRAINT PK_Unit PRIMARY KEY (UnitID)
);

-- 2
CREATE TABLE Color (
    ColorID                 CHAR(6)                 NOT NULL,
    ColorName               CHAR(30)                NOT NULL,
    ColorStyle              CHAR(30),
    CONSTRAINT PK_Color PRIMARY KEY (ColorID),
    CONSTRAINT AK_Color UNIQUE (ColorName, ColorStyle)
);

-- 3
CREATE TABLE Regulation (
    RegulationID                CHAR(6)                 NOT NULL,
    RegulationDescription       CHAR(255),
    CONSTRAINT FK_Regulation PRIMARY KEY (RegulationID)
);

-- 4
CREATE TABLE EmployeeGrade (
    GradeID                     NUMBER(2)              NOT NULL,
    GradeName                   VARCHAR(30), 
    Salary                      DECIMAL(7,2),
    CONSTRAINT PK_EmployeeGrade PRIMARY KEY (GradeID),
    CONSTRAINT AK_EmployeeGrade UNIQUE (GradeName, Salary),
    CONSTRAINT Correct_GradeID CHECK (GradeID > 0),
    CONSTRAINT Correct_Salary CHECK (Salary >= 0)
);

-- 5
CREATE TABLE HazardLevel (
    HazardLevelID           CHAR(6)                 NOT NULL,
    HazardLevelNo           INTEGER,
    HazardLevelDescription  VARCHAR(255),
    RegulationLink          CHAR(6),
    CONSTRAINT PK_HazardLevel PRIMARY KEY (HazardLevelID),
    CONSTRAINT AK_HazardLevel UNIQUE (HazardLevelNo, HazardLevelDescription),
    CONSTRAINT FK_RegulationLink FOREIGN KEY (RegulationLink) REFERENCES Regulation(RegulationID) 
        ON DELETE SET NULL,
    CONSTRAINT Correct_HazardNo CHECK (HazardLevelNo > 0)
);

-- 6
CREATE TABLE ToxicityLevel (
    ToxicityLevelID             CHAR(6)                 NOT NULL, 
    ToxicityLevelNo             INTEGER                 NOT NULL, 
    ToxicityLevelDescription    CHAR(255), 
    RegulationLink              CHAR(6),
    CONSTRAINT PK_ToxicityLevel PRIMARY KEY (ToxicityLevelID),
    CONSTRAINT AK_ToxicityLevel UNIQUE (ToxicityLevelNo, ToxicityLevelDescription),
    CONSTRAINT Correct_Toxicity CHECK (ToxicityLevelNo >=1 AND ToxicityLevelNo <= 5),
    CONSTRAINT FK_RegulationLink_1 FOREIGN KEY (RegulationLink) REFERENCES Regulation(RegulationID)
        ON DELETE SET NULL    
);

-- 7
CREATE TABLE ShelfLife (
    ShelfLifeID                 CHAR(6)                 NOT NULL,
    ShelfLifeNo                 VARCHAR(15)             NOT NULL,
    ShelfLifeDescription        VARCHAR(255), 
    RegulationLink              CHAR(6),
    CONSTRAINT PK_ShelfLife PRIMARY KEY (ShelfLifeID),
    CONSTRAINT AK_ShelfLife UNIQUE (ShelfLifeNo, ShelfLifeDescription),
    CONSTRAINT FK_RegulationLink_2 FOREIGN KEY (RegulationLink) REFERENCES Regulation(RegulationID)
        ON DELETE SET NULL
);

-- 8
CREATE TABLE Employee (
    EmployeeID                  CHAR(3)                 NOT NULL,
    EmployeeFName               VARCHAR(30)             NOT NULL,
    EmployeeLName               VARCHAR(30)             NOT NULL, 
    EmployeeGrade               INTEGER,
    Supervisor                  CHAR(3),
    CONSTRAINT PK_Employee PRIMARY KEY (EmployeeID),
    CONSTRAINT AK_Employee UNIQUE (EmployeeLName, EmployeeGrade),
    CONSTRAINT FK_EmployeeGrade FOREIGN KEY (EmployeeGrade) REFERENCES EmployeeGrade(GradeID)
        ON DELETE SET NULL,
    CONSTRAINT FK_Supervisor FOREIGN KEY (Supervisor) REFERENCES Employee(EmployeeID)
        ON DELETE SET NULL,
    CONSTRAINT Correct_Grade CHECK (EmployeeGrade >= 1 AND EmployeeGrade <= 5)    
);

CONSTRAINT Correct_Supervisor CHECK (NOT EXISTS (SELECT EmployeeID
                                                     FROM Employee
                                                     WHERE Employee.EmployeeGrade != 5))

-- 9
CREATE TABLE Area (
    AreaID                      INTEGER                 NOT NULL,
    AreaName                    VARCHAR(30)             NOT NULL,
    AreaDepot                   VARCHAR(30), 
    AreaManager                 CHAR(3),
    CONSTRAINT PK_Area PRIMARY KEY (AreaID),
    CONSTRAINT AK_Area UNIQUE (AreaName, AreaDepot),
    CONSTRAINT FK_AreaManager FOREIGN KEY (AreaManager) REFERENCES Employee(EmployeeID)
        ON DELETE SET NULL,
    CONSTRAINT Correct_Area_No CHECK (AreaID >= 1 AND AreaID <= 99)    
);

CONSTRAINT Correct_Manager CHECK (NOT EXISTS (SELECT EmployeeID
                                                  FROM Employee
                                                  WHERE Employee.EmployeeGrade != '3'))

-- 10
CREATE TABLE Customer (
    CustomerID                  CHAR(4)                 NOT NULL,
    CustomerFName               VARCHAR(30)             NOT NULL,
    CustomerLName               VARCHAR(30)             NOT NULL,
    CustomerAddress             VARCHAR(255), 
    CustomerArea                INTEGER, 
    CustomerRepresentative      CHAR(3),
    CONSTRAINT PK_Customer PRIMARY KEY (CustomerID),
    CONSTRAINT AK_Customer UNIQUE (CustomerLName, CustomerAddress),
    CONSTRAINT FK_CustomerArea FOREIGN KEY (CustomerArea) REFERENCES Area(AreaID)
        ON DELETE SET NULL,
    CONSTRAINT FK_CustomerRepresentative FOREIGN KEY (CustomerRepresentative) REFERENCES Employee(EmployeeID)
        ON DELETE SET NULL,
    CONSTRAINT Correct_Customer_Area CHECK (CustomerArea >= 1 AND CustomerArea <= 99)
);

-- 11
CREATE TABLE CustomerAccount (
    AccountNumber               CHAR(6)                 NOT NULL,
    Customer                    CHAR(4),
    CONSTRAINT PK_CustomerAccount PRIMARY KEY (AccountNumber),
    CONSTRAINT FK_Customer FOREIGN KEY (Customer) REFERENCES Customer(CustomerID)
        ON DELETE SET NULL
);

-- 12
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
        ON DELETE SET NULL,
    CONSTRAINT FK_Unit_1 FOREIGN KEY (Unit) REFERENCES Unit (UnitID)
        ON DELETE SET NULL,
    CONSTRAINT FK_ProductRepresentative_1 FOREIGN KEY (ProductRepresentative) REFERENCES Employee (EmployeeID)
        ON DELETE SET NULL   
);

-- 13
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
    CONSTRAINT FK_ProductRepresentative_2 FOREIGN KEY (ProductRepresentative) REFERENCES Employee (EmployeeID)
        ON DELETE SET NULL,
    CONSTRAINT FK_Unit_2 FOREIGN KEY (Unit) REFERENCES Unit (UnitID)
        ON DELETE SET NULL,
    CONSTRAINT FK_ColorType FOREIGN KEY (ColorType) REFERENCES Color (ColorID)
        ON DELETE SET NULL    
);

-- 14
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
    CONSTRAINT FK_ProductRepresentative_3 FOREIGN KEY (ProductRepresentative) REFERENCES Employee (EmployeeID)
        ON DELETE SET NULL,
    CONSTRAINT FK_Unit_3 FOREIGN KEY (Unit) REFERENCES Unit (UnitID)
        ON DELETE SET NULL,
    CONSTRAINT FK_ShelfingLife FOREIGN KEY (ShelfingLife) REFERENCES ShelfLife (ShelfLifeID)
        ON DELETE SET NULL,
    CONSTRAINT FK_Toxicity FOREIGN KEY (Toxicity) REFERENCES ToxicityLevel (ToxicityLevelID)
        ON DELETE SET NULL        
);

