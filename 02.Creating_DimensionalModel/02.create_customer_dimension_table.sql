USE AdventureworksDWH2022
GO


-- Drop FK constrains from Fact Tables
IF EXISTS (
    SELECT 1
    FROM sys.objects
    WHERE name = 'FK_FactSalesOrdreDetail_CustomerDim'
    AND type = 'F'
)
BEGIN
	ALTER TABLE FactSalesOrdreDetail
	DROP CONSTRAINT FK_FactSalesOrdreDetail_CustomerDim;
END
GO

IF EXISTS (
    SELECT 1
    FROM sys.objects
    WHERE name = 'FK_FactSalesOrderHeader_CustomerDim'
    AND type = 'F'
)
BEGIN
	ALTER TABLE FactSalesOrderHeader
	DROP CONSTRAINT FK_FactSalesOrderHeader_CustomerDim;
END
GO

IF EXISTS (
    SELECT 1
    FROM sys.objects
    WHERE name = 'FK_DimAddress_DimCustomer'
    AND type = 'F'
)
BEGIN
	ALTER TABLE DimAddress 
	DROP CONSTRAINT FK_DimAddress_DimCustomer;
END
GO

-- Drop Customer dimension if exists
IF OBJECT_ID('DimCustomer', 'U') IS NOT NULL
BEGIN
	DROP TABLE DimCustomer;
END
GO

-- Create Customer dimension
CREATE TABLE DimCustomer(
	CustomerKey INT IDENTITY(1,1) PRIMARY KEY, 
	CustomerID INT NOT NULL,
	AccountNumber NVARCHAR(10) NOT NULL,
	TerritoryKey INT,

	-- Store information
	StoreName NVARCHAR(50),

	-- Person information
	PersonType NVARCHAR(50),
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),

	-- SCD Columns
	StartDate DATETIME NOT NULL DEFAULT GETDATE(),
	EndDate DATETIME,
	IsCurrent BIT NOT NULL DEFAULT 1,

	CONSTRAINT FK_DimCustomer_DimTerritory
		FOREIGN KEY (TerritoryKey)
		REFERENCES DimTerritory(TerritoryKey)
	);
GO

-- Recreate FKs in Fact Tables
IF OBJECT_ID('FactSalesOrderHeader', 'U') IS NOT NULL
BEGIN
	ALTER TABLE FactSalesOrderHeader 
	ADD CONSTRAINT FK_FactSalesOrderHeader_CustomerDim
	FOREIGN KEY (CustomerKey)
	REFERENCES DimCustomer(CustomerKey);
END
GO

IF OBJECT_ID('FactSalesOrdreDetail', 'U') IS NOT NULL
BEGIN
	ALTER TABLE FactSalesOrdreDetail 
	ADD CONSTRAINT FK_FactSalesOrdreDetail_CustomerDim
	FOREIGN KEY (CustomerKey)
	REFERENCES DimCustomer(CustomerKey);
END
GO

IF OBJECT_ID('DimAddress', 'U') IS NOT NULL
BEGIN
	ALTER TABLE DimAddress 
	ADD CONSTRAINT FK_DimAddress_DimCustomer
	FOREIGN KEY (CustomerKey)
	REFERENCES DimCustomer(CustomerKey);
END
GO



-- Create indexes
DROP INDEX IF EXISTS CustomerID_IX
ON DimCustomer;

CREATE INDEX CustomerID_IX 
ON DimCustomer(CustomerID);
GO

-- Insert a default row
SET IDENTITY_INSERT DimCustomer ON;


INSERT INTO DimCustomer(CustomerKey, CustomerID, AccountNumber, StoreName, PersonType, FirstName, LastName, StartDate, EndDate, IsCurrent) 
VALUES (0, 0, 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', '1900-01-01', NULL, 1);


SET IDENTITY_INSERT DimCustomer off;
GO