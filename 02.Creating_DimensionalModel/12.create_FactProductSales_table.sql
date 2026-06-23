USE AdventureworksDWH2022
GO

-- Drop FactSalesOrdreDetail if exists
IF OBJECT_ID('FactSalesOrdreDetail', 'U') IS NOT NULL
BEGIN
	DROP TABLE FactSalesOrdreDetail;
END
GO


-- Create FactSalesOrdreDetail dimension
CREATE TABLE FactSalesOrdreDetail(
	OrderID INT NOT NULL,
	SalesOrderDetailID INT NOT NULL,
	ProductKey INT NOT NULL,
	SpecialOfferKey INT NOT NULL,
	DateKey INT NOT NULL,
	CustomerKey INT NOT NULL,
	TerritoryKey INT NOT NULL,
	ShipMethodKey INT NOT NULL,
	Channel NVARCHAR(25) NOT NULL,

	OrderQty SMALLINT NOT NULL,
	UnitPrice MONEY NOT NULL,
	UnitPriceDiscount MONEY NOT NULL,
	UnitCost MONEY NOT NULL,
	TotalCost MONEY NOT NULL,
	SalesAmount MONEY NOT NULL,

	CONSTRAINT PK_FactSalesOrdreDetail
	PRIMARY KEY CLUSTERED (OrderID, SalesOrderDetailID),

	CONSTRAINT FK_FactSalesOrdreDetail_ProductDim
	FOREIGN KEY (ProductKey) REFERENCES DimProduct(ProductKey),

	CONSTRAINT FK_FactSalesOrdreDetail_SpecialOfferDim
	FOREIGN KEY (SpecialOfferKey) REFERENCES DimSpecialOffer(SpecialOfferKey),

	CONSTRAINT FK_FactSalesOrdreDetail_DateDim
	FOREIGN KEY (DateKey) REFERENCES DimDate(DateKey),

	CONSTRAINT FK_FactSalesOrdreDetail_CustomerDim
	FOREIGN KEY (CustomerKey) REFERENCES DimCustomer(CustomerKey),

	CONSTRAINT FK_FactSalesOrdreDetail_TerritoryDim
	FOREIGN KEY (TerritoryKey) REFERENCES DimTerritory(TerritoryKey),

	CONSTRAINT FK_FactSalesOrdreDetail_ShipMethodDim
	FOREIGN KEY (ShipMethodKey) REFERENCES DimShipMethod(ShipMethodKey),
	);
GO

-- Create indexes
DROP INDEX IF EXISTS ProductKey_IX
ON FactSalesOrdreDetail;

CREATE INDEX ProductKey_IX
ON FactSalesOrdreDetail(ProductKey);

DROP INDEX IF EXISTS DateKey_IX
ON FactSalesOrdreDetail;

CREATE INDEX DateKey_IX
ON FactSalesOrdreDetail(DateKey);

DROP INDEX IF EXISTS CustomerKey_ProductFact_IX
ON FactSalesOrdreDetail;

CREATE INDEX CustomerKey_ProductFact_IX
ON FactSalesOrdreDetail(CustomerKey);

