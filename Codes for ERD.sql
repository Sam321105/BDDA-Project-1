CREATE DATABASE portfolio_db;
-- Table: Client
CREATE TABLE portfolio_db.Client (
    Client_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Contact_Information VARCHAR(255),
    Investment_Goals TEXT
);

-- Table: Portfolio
CREATE TABLE portfolio_db.Portfolio (
    Portfolio_ID INT PRIMARY KEY,
    Client_ID INT,
    Risk_Level VARCHAR(50),
    Total_Value DECIMAL(15, 2),
    FOREIGN KEY (Client_ID) REFERENCES Client(Client_ID)
);

-- Table: Market_Data
CREATE TABLE portfolio_db.Market_Data (
    MarketData_ID INT PRIMARY KEY,
    Asset_Type VARCHAR(50),
    Price DECIMAL(15, 2),
    Date DATE
);

-- Table: Asset
CREATE TABLE portfolio_db.Asset (
    Asset_ID INT PRIMARY KEY,
    Portfolio_ID INT,
    MarketData_ID INT,
    Quantity INT,
    Purchase_Price DECIMAL(15, 2),
    FOREIGN KEY (Portfolio_ID) REFERENCES Portfolio(Portfolio_ID),
    FOREIGN KEY (MarketData_ID) REFERENCES Market_Data(MarketData_ID)
);

-- Table: Transaction
CREATE TABLE portfolio_db.Transaction (
    Transaction_ID INT PRIMARY KEY,
    Asset_ID INT,
    Date DATE,
    Type VARCHAR(10),  -- Type can be 'Buy' or 'Sell'
    Quantity INT,
    FOREIGN KEY (Asset_ID) REFERENCES Asset(Asset_ID)
);

-- Table: Report
CREATE TABLE portfolio_db.Report (
    Report_ID INT PRIMARY KEY,
    Client_ID INT,
    Portfolio_ID INT,
    Date DATE,
    Content TEXT,
    FOREIGN KEY (Client_ID) REFERENCES Client(Client_ID),
    FOREIGN KEY (Portfolio_ID) REFERENCES Portfolio(Portfolio_ID)
);

-- Table: Risk_Assessment
CREATE TABLE portfolio_db.Risk_Assessment (
    Assessment_ID INT PRIMARY KEY,
    Portfolio_ID INT,
    Risk_Type VARCHAR(50),
    Risk_Level DECIMAL(5, 2),
    FOREIGN KEY (Portfolio_ID) REFERENCES Portfolio(Portfolio_ID)
);

-- Table: Performance_Tracking
CREATE TABLE portfolio_db.Performance_Tracking (
    Tracking_ID INT PRIMARY KEY,
    Portfolio_ID INT,
    Return_Rate DECIMAL(5, 2),
    Performance_Metrics TEXT,
    FOREIGN KEY (Portfolio_ID) REFERENCES Portfolio(Portfolio_ID)
);

-- Table: Compliance_Audit
CREATE TABLE portfolio_db.Compliance_Audit (
    Audit_ID INT PRIMARY KEY,
    Portfolio_ID INT,
    Audit_Date DATE,
    Compliance_Status VARCHAR(50),
    FOREIGN KEY (Portfolio_ID) REFERENCES Portfolio(Portfolio_ID)
);
