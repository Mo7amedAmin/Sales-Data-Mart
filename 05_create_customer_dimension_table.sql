USE AdventureworksDWH2022
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
	AccountNumber VARCHAR(10) NOT NULL,

	-- Store information
	StoreName NVARCHAR(50),

	-- Person information
	PersonType NCHAR(10),
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),

	-- Address information
	AddressLine1 NVARCHAR(60) NOT NULL,
	AddressLine2 NVARCHAR(60),
	City NVARCHAR(30) NOT NULL,

	StateProvinceName NVARCHAR(50) NOT NULL,
	CountryRegionName NVARCHAR(50) NOT NULL,

	-- SCD Columns
	StartDate DATETIME NOT NULL DEFAULT GETDATE(),
	EndDate DATETIME,
	IsCurrent BIT NOT NULL DEFAULT 1
	);
GO



-- Create indexes
DROP INDEX IF EXISTS CustomerID_IX
ON DimCustomer;

CREATE INDEX CustomerID_IX 
ON DimCustomer(CustomerID);
GO

-- Insert a default row
SET IDENTITY_INSERT DimCustomer ON;


INSERT INTO DimCustomer(CustomerKey, CustomerID, AccountNumber, StoreName, PersonType, FirstName, LastName, AddressLine1, AddressLine2, City, StateProvinceName, CountryRegionName, StartDate, EndDate, IsCurrent) 
VALUES (0, 0, 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', '1900-01-01', NULL, 1);


SET IDENTITY_INSERT DimCustomer off;
GO