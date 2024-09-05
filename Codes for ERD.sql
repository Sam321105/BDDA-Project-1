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

-- Insert data into Client
INSERT INTO portfolio_db.Client (Client_ID, Name, Contact_Information, Investment_Goals)
VALUES
(1, 'Alice Smith', 'alice@example.com', 'Retirement Savings'),
(2, 'Bob Johnson', 'bob@example.com', 'Wealth Growth'),
(3, 'Charlie Brown', 'charlie@example.com', 'Risk Minimization'),
(4, 'Diana Prince', 'diana@example.com', 'Diversification');
  SELECT * FROM portfolio_db.Client;

-- Insert data into Portfolio
INSERT INTO portfolio_db.Portfolio (Portfolio_ID, Client_ID, Risk_Level, Total_Value)
VALUES
(101, 1, 'Moderate', 500000.00),
(102, 2, 'High', 1000000.00),
(103, 3, 'Low', 300000.00),
(104, 4, 'Balanced', 750000.00);
SELECT * FROM portfolio_db.Portfolio;
-- Insert data into Market_Data
INSERT INTO portfolio_db.Market_Data (MarketData_ID, Asset_Type, Price, Date)
VALUES
(1, 'Stock', 150.75, '2023-09-01'),
(2, 'Bond', 102.50, '2023-09-01'),
(3, 'ETF', 250.00, '2023-09-01'),
(4, 'Commodity', 75.30, '2023-09-01');
SELECT * FROM portfolio_db.Market_Data;
-- Insert data into Asset
INSERT INTO portfolio_db.Asset (Asset_ID, Portfolio_ID, MarketData_ID, Quantity, Purchase_Price)
VALUES
(1, 101, 1, 100, 145.50),
(2, 102, 2, 200, 100.00),
(3, 103, 3, 50, 240.00),
(4, 104, 4, 150, 70.00);
SELECT * FROM portfolio_db.Asset;
-- Insert data into Transaction
INSERT INTO portfolio_db.Transaction (Transaction_ID, Asset_ID, Date, Type, Quantity)
VALUES
(1, 1, '2023-08-15', 'Buy', 100),
(2, 2, '2023-08-20', 'Buy', 200),
(3, 3, '2023-08-25', 'Buy', 50),
(4, 4, '2023-08-30', 'Buy', 150);
SELECT * FROM portfolio_db.Transaction;
-- Insert data into Report
INSERT INTO portfolio_db.Report (Report_ID, Client_ID, Portfolio_ID, Date, Content)
VALUES
(1, 1, 101, '2023-09-01', 'Quarterly performance report'),
(2, 2, 102, '2023-09-01', 'Monthly performance report'),
(3, 3, 103, '2023-09-01', 'Yearly performance report'),
(4, 4, 104, '2023-09-01', 'Half-yearly performance report');
SELECT * FROM portfolio_db.Report;
-- Insert data into Risk_Assessment
INSERT INTO portfolio_db.Risk_Assessment (Assessment_ID, Portfolio_ID, Risk_Type, Risk_Level)
VALUES
(1, 101, 'Market Risk', 3.50),
(2, 102, 'Credit Risk', 4.75),
(3, 103, 'Liquidity Risk', 2.00),
(4, 104, 'Inflation Risk', 3.00);
SELECT * FROM portfolio_db.Risk_Assessment;
-- Insert data into Performance_Tracking
INSERT INTO portfolio_db.Performance_Tracking (Tracking_ID, Portfolio_ID, Return_Rate, Performance_Metrics)
VALUES
(1, 101, 7.25, 'Q3 2023 - 7.25% return'),
(2, 102, 12.50, 'Q3 2023 - 12.50% return'),
(3, 103, 4.00, 'Q3 2023 - 4.00% return'),
(4, 104, 8.00, 'Q3 2023 - 8.00% return');
SELECT * FROM portfolio_db.Performance_Tracking;
-- Insert data into Compliance_Audit
INSERT INTO portfolio_db.Compliance_Audit (Audit_ID, Portfolio_ID, Audit_Date, Compliance_Status)
VALUES
(1, 101, '2023-08-31', 'Compliant'),
(2, 102, '2023-08-31', 'Compliant'),
(3, 103, '2023-08-31', 'Compliant'),
(4, 104, '2023-08-31', 'Non-Compliant');
SELECT * FROM portfolio_db.Compliance_Audit;

SELECT * FROM portfolio_db.Portfolio WHERE Risk_Level = 'Moderate';

SELECT * FROM portfolio_db.Client WHERE Investment_Goals = 'Wealth Growth';

UPDATE portfolio_db.Client
SET Contact_Information = 'newemail@example.com', 
    Investment_Goals = 'Capital Preservation'
WHERE Client_ID = 1;
SELECT * FROM portfolio_db.Client;

DELETE FROM portfolio_db.Report
WHERE Client_ID = 4;
SELECT * FROM portfolio_db.Report;