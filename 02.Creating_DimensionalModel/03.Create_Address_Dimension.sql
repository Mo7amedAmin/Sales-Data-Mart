USE AdventureworksDWH2022
GO

-- Drop Address dimension if exists
IF OBJECT_ID('DimAddress', 'U') IS NOT NULL
BEGIN
	DROP TABLE DimAddress;
END
GO

-- Create Address dimension
CREATE TABLE DimAddress(
	AddressKey INT IDENTITY(1,1) PRIMARY KEY,
	AddressID INT NOT NULL,	
	CustomerKey INT,
	AddressType NVARCHAR(50),
	AddressLine1 NVARCHAR(60) NOT NULL,
	AddressLine2 NVARCHAR(60),
	City NVARCHAR(30) NOT NULL,

	StateProvinceName NVARCHAR(50) NOT NULL,
	CountryRegionName NVARCHAR(50) NOT NULL,

	-- SCD Columns
	StartDate DATETIME NOT NULL DEFAULT GETDATE(),
	EndDate DATETIME,
	IsCurrent BIT NOT NULL DEFAULT 1,

	CONSTRAINT FK_DimAddress_DimCustomer
		FOREIGN KEY (CustomerKey)
		REFERENCES DimCustomer(CustomerKey)
	);
GO

-- Create indexes
DROP INDEX IF EXISTS Address_CustomerKey_IX
ON DimAddress;

CREATE INDEX CustomerID_IX 
ON DimAddress(CustomerKey);
GO


