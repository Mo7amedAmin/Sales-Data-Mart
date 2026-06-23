USE AdventureworksDWH2022
GO

-- Drop FactSalesOrderHeader if exists
IF OBJECT_ID('FactSalesOrderHeader', 'U') IS NOT NULL
BEGIN
	DROP TABLE FactSalesOrderHeader;
END
GO


-- Create FactSalesOrderHeader dimension
CREATE TABLE FactSalesOrderHeader(
	OrderID INT PRIMARY KEY,
	
	OrderDateKey INT NOT NULL,
	DueDateKey INT NOT NULL,
	ShipDateKey INT NOT NULL,

	CustomerKey INT NOT NULL,
	TerritoryKey INT NOT NULL,
	ShipMethodKey INT NOT NULL,
	Channel NVARCHAR(25) NOT NULL,

	SubTotal MONEY NOT NULL,
	TaxAmt MONEY NOT NULL,
	Freight MONEY NOT NULL,
	TotalDue MONEY NOT NULL,

	CONSTRAINT FK_FactSalesOrderHeader_OrderDateKey
	FOREIGN KEY (OrderDateKey) REFERENCES DimDate(DateKey),

	CONSTRAINT FK_FactSalesOrderHeader_DueDateKey
	FOREIGN KEY (DueDateKey) REFERENCES DimDate(DateKey),

	CONSTRAINT FK_FactSalesOrderHeader_ShipDateKey
	FOREIGN KEY (ShipDateKey) REFERENCES DimDate(DateKey),

	CONSTRAINT FK_FactSalesOrderHeader_CustomerDim
	FOREIGN KEY (CustomerKey) REFERENCES DimCustomer(CustomerKey),

	CONSTRAINT FK_FactSalesOrderHeader_TerritoryDim
	FOREIGN KEY (TerritoryKey) REFERENCES DimTerritory(TerritoryKey),

	CONSTRAINT FK_FactSalesOrderHeader_ShipMethodDim
	FOREIGN KEY (ShipMethodKey) REFERENCES DimShipMethod(ShipMethodKey),
	);
GO


-- Create indexes
DROP INDEX IF EXISTS OrderDateKey_IX
ON FactSalesOrderHeader;

CREATE INDEX OrderDateKey_IX
ON FactSalesOrderHeader(OrderDateKey);

DROP INDEX IF EXISTS CustomerKey_OrderFact_IX
ON FactSalesOrderHeader;

CREATE INDEX CustomerKey_OrderFact_IX
ON FactSalesOrderHeader(CustomerKey);
