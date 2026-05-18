USE AdventureworksDWH2022
GO

-- Drop FactProductInventory if exists
IF OBJECT_ID('FactProductInventory', 'U') IS NOT NULL
BEGIN
	DROP TABLE FactProductInventory;
END
GO


-- Create InventoryLocation dimension
CREATE TABLE FactProductInventory(
	ProductKey INT NOT NULL,
	DateKey INT NOT NULL,
	UnitsIn INT NOT NULL,
	UnitsOut INT NOT NULL,

	CONSTRAINT PK_FactInventory
	PRIMARY KEY CLUSTERED (ProductKey, DateKey),

	CONSTRAINT FK_FactInventory_ProductDim
	FOREIGN KEY (ProductKey) REFERENCES DimProduct(ProductKey),

	CONSTRAINT FK_FactInventory_DateDim
	FOREIGN KEY (DateKey) REFERENCES DimDate(DateKey)

	);
GO


