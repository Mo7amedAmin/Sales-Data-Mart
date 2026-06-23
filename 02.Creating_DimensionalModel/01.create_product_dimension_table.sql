USE AdventureworksDWH2022
GO

-- Drop product dimension if exists
IF OBJECT_ID('DimProduct', 'U') IS NOT NULL
BEGIN
	DROP TABLE DimProduct;
END
GO

-- Create Product dimension
CREATE TABLE DimProduct(
	ProductKey INT IDENTITY(1,1) PRIMARY KEY, 
	ProductID INT NOT NULL,
	ProductName NVARCHAR(50) NOT NULL,
	ProductNumber NVARCHAR(25) NOT NULL,
	ProductColor NVARCHAR(15),
	ProductSize NVARCHAR(10),
	StandardCost MONEY NOT NULL,
    ListPrice MONEY NOT NULL,
	SafetyStockLevel SMALLINT NOT NULL,
	ReorderPoint SMALLINT NOT NULL,

	ProductSubcategoryName NVARCHAR(50) NOT NULL,
	ProductCategoryName NVARCHAR(50) NOT NULL,

	StartDate DATETIME NOT NULL DEFAULT GETDATE(),
	EndDate DATETIME,
	IsCurrent BIT NOT NULL DEFAULT 1
	);
GO


-- Create indexes
DROP INDEX IF EXISTS ProductID_IX
ON DimProduct;

CREATE INDEX ProductID_IX 
ON DimProduct(ProductID);


DROP INDEX IF EXISTS ProductSubCategoryName_IX
ON DimProduct;

CREATE INDEX ProductSubCategoryName_IX 
ON DimProduct(ProductSubCategoryName);
GO

-- Insert a default row
SET IDENTITY_INSERT DimProduct ON;


INSERT INTO DimProduct(ProductKey, ProductID, ProductName, ProductNumber, ProductColor, ProductSize, StandardCost, ListPrice, SafetyStockLevel, ReorderPoint, ProductSubcategoryName, ProductCategoryName, StartDate, EndDate, IsCurrent) 
VALUES (0, 0, 'Unknown', 'Unknown', 'Unknown', 'Unknown', 0, 0, 0, 0, 'Unknown', 'Unknown', '1900-01-01', NULL, 1);


SET IDENTITY_INSERT DimProduct off;
GO