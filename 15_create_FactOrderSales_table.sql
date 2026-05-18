USE AdventureworksDWH2022
GO

-- Drop FactOrderSales if exists
IF OBJECT_ID('FactOrderSales', 'U') IS NOT NULL
BEGIN
	DROP TABLE FactOrderSales;
END
GO


-- Create FactOrderSales dimension
CREATE TABLE FactOrderSales(
	OrderID INT PRIMARY KEY,
	
	OrderDateKey INT NOT NULL,
	DueDateKey INT NOT NULL,
	ShipDateKey INT NOT NULL,

	CustomerKey INT NOT NULL,
	TerritoryKey INT NOT NULL,
	ShipMethodKey INT NOT NULL,
	ChannelKey INT NOT NULL,

	SubTotal MONEY NOT NULL,
	TaxAmt MONEY NOT NULL,
	Freight MONEY NOT NULL,
	TotalDue MONEY NOT NULL,

	CONSTRAINT FK_FactOrderSales_OrderDateKey
	FOREIGN KEY (OrderDateKey) REFERENCES DimDate(DateKey),

	CONSTRAINT FK_FactOrderSales_DueDateKey
	FOREIGN KEY (DueDateKey) REFERENCES DimDate(DateKey),

	CONSTRAINT FK_FactOrderSales_ShipDateKey
	FOREIGN KEY (ShipDateKey) REFERENCES DimDate(DateKey),

	CONSTRAINT FK_FactOrderSales_CustomerDim
	FOREIGN KEY (CustomerKey) REFERENCES DimCustomer(CustomerKey),

	CONSTRAINT FK_FactOrderSales_TerritoryDim
	FOREIGN KEY (TerritoryKey) REFERENCES DimTerritory(TerritoryKey),

	CONSTRAINT FK_FactOrderSales_ShipMethodDim
	FOREIGN KEY (ShipMethodKey) REFERENCES DimShipMethod(ShipMethodKey),

	CONSTRAINT FK_FactOrderSales_ChannelDim
	FOREIGN KEY (ChannelKey) REFERENCES DimChannel(ChannelKey)
	);
GO


-- Create indexes
DROP INDEX IF EXISTS OrderDateKey_IX
ON FactOrderSales;

CREATE INDEX OrderDateKey_IX
ON FactOrderSales(OrderDateKey);

DROP INDEX IF EXISTS CustomerKey_OrderFact_IX
ON FactOrderSales;

CREATE INDEX CustomerKey_OrderFact_IX
ON FactOrderSales(CustomerKey);
