USE AdventureworksDWH2022
GO

-- Drop FactProductSales if exists
IF OBJECT_ID('FactProductSales', 'U') IS NOT NULL
BEGIN
	DROP TABLE FactProductSales;
END
GO


-- Create FactProductSales dimension
CREATE TABLE FactProductSales(
	OrderID INT NOT NULL,
	ProductKey INT NOT NULL,
	DateKey INT NOT NULL,
	CustomerKey INT NOT NULL,
	SpecialOfferKey INT NOT NULL,
	TerritoryKey INT NOT NULL,
	ShipMethodKey INT NOT NULL,
	ChannelKey INT NOT NULL,

	OrderQty SMALLINT NOT NULL,
	UnitPrice MONEY NOT NULL,
	UnitPriceDiscount MONEY NOT NULL,
	UnitCost MONEY NOT NULL,
	TotalCost MONEY NOT NULL,
	SalesAmount MONEY NOT NULL,

	CONSTRAINT PK_FactProductSales
	PRIMARY KEY CLUSTERED (OrderID, ProductKey),

	CONSTRAINT FK_FactProductSales_ProductDim
	FOREIGN KEY (ProductKey) REFERENCES DimProduct(ProductKey),

	CONSTRAINT FK_FactProductSales_DateDim
	FOREIGN KEY (DateKey) REFERENCES DimDate(DateKey),

	CONSTRAINT FK_FactProductSales_CustomerDim
	FOREIGN KEY (CustomerKey) REFERENCES DimCustomer(CustomerKey),

	CONSTRAINT FK_FactProductSales_SpecialOfferDim
	FOREIGN KEY (SpecialOfferKey) REFERENCES DimSpecialOffer(SpecialOfferKey),

	CONSTRAINT FK_FactProductSales_TerritoryDim
	FOREIGN KEY (TerritoryKey) REFERENCES DimTerritory(TerritoryKey),

	CONSTRAINT FK_FactProductSales_ShipMethodDim
	FOREIGN KEY (ShipMethodKey) REFERENCES DimShipMethod(ShipMethodKey),

	CONSTRAINT FK_FactProductSales_ChannelDim
	FOREIGN KEY (ChannelKey) REFERENCES DimChannel(ChannelKey)
	);
GO

-- Create indexes
DROP INDEX IF EXISTS ProductKey_IX
ON FactProductSales;

CREATE INDEX ProductKey_IX
ON FactProductSales(ProductKey);

DROP INDEX IF EXISTS DateKey_IX
ON FactProductSales;

CREATE INDEX DateKey_IX
ON FactProductSales(DateKey);

DROP INDEX IF EXISTS CustomerKey_ProductFact_IX
ON FactProductSales;

CREATE INDEX CustomerKey_ProductFact_IX
ON FactProductSales(CustomerKey);

