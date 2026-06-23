USE AdventureWorksSTG2022
GO


-- Create schema if not exists
IF SCHEMA_ID('STG_Sales') IS NULL
BEGIN
	EXEC('CREATE SCHEMA STG_Sales');
END
GO



-- Create schema if not exists
IF SCHEMA_ID('STG_Person') IS NULL
BEGIN
	EXEC('CREATE SCHEMA STG_Person');
END
GO


-- Create schema if not exists
IF SCHEMA_ID('STG_Production') IS NULL
BEGIN
	EXEC('CREATE SCHEMA STG_Production');
END
GO


-- Create schema if not exists
IF SCHEMA_ID('STG_Purchasing') IS NULL
BEGIN
	EXEC('CREATE SCHEMA STG_Purchasing');
END
GO

-- Create SalesOrderHeader table
IF OBJECT_ID('STG_Sales.SalesOrderHeader', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Sales.SalesOrderHeader;
END
GO

CREATE TABLE STG_Sales.SalesOrderHeader(
		[SalesOrderID] INT,
		[RevisionNumber] TINYINT,
		[OrderDate] DATETIME,
		[DueDate] DATETIME,
		[ShipDate] DATETIME,
		[Status] TINYINT,
		[OnlineOrderFlag] BIT,
		[SalesOrderNumber] NVARCHAR(25),
		[PurchaseOrderNumber] NVARCHAR(25),
		[AccountNumber] NVARCHAR(15),
		[CustomerID] INT,
		[SalesPersonID] INT,
		[TerritoryID] INT,
		[BillToAddressID] INT,
		[ShipToAddressID] INT,
		[ShipMethodID] INT,
		[CreditCardID] INT,
		[CreditCardApprovalCode] NVARCHAR(15),
		[CurrencyRateID] INT,
		[SubTotal] MONEY,
		[TaxAmt] MONEY,
		[Freight] MONEY,
		[TotalDue] MONEY,
		[Comment] NVARCHAR(128),
		[rowguid] UNIQUEIDENTIFIER,
		[ModifiedDate] DATETIME);

GO



-- Create SalesOrderDetail table
IF OBJECT_ID('STG_Sales.SalesOrderDetail', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Sales.SalesOrderDetail;
END
GO

CREATE TABLE STG_Sales.SalesOrderDetail(
		[SalesOrderID] INT,
        [SalesOrderDetailID] INT,
        [CarrierTrackingNumber] NVARCHAR(25),
        [OrderQty] SMALLINT,
        [ProductID] INT,
        [SpecialOfferID] INT,
        [UnitPrice] MONEY,
        [UnitPriceDiscount] MONEY,
        [LineTotal] NUMERIC(38,6),
        [rowguid] UNIQUEIDENTIFIER,
        [ModifiedDate] DATETIME
	);
GO



-- Create SalesReason table
IF OBJECT_ID('STG_Sales.SalesReason', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Sales.SalesReason;
END
GO

CREATE TABLE STG_Sales.SalesReason(
		[SalesReasonID] INT,
        [Name] NVARCHAR(50),
        [ReasonType] NVARCHAR(50),
        [ModifiedDate] DATETIME
	);
GO



-- Create SalesOrderHeaderSalesReason table
IF OBJECT_ID('STG_Sales.SalesOrderHeaderSalesReason', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Sales.SalesOrderHeaderSalesReason;
END
GO

CREATE TABLE STG_Sales.SalesOrderHeaderSalesReason(
		[SalesOrderID] INT,
        [SalesReasonID] INT,
        [ModifiedDate] DATETIME
	);
GO


-- Create SpecialOffer table
IF OBJECT_ID('STG_Sales.SpecialOffer', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Sales.SpecialOffer;
END
GO

CREATE TABLE STG_Sales.SpecialOffer(
		[SpecialOfferID] INT,
        [Description] NVARCHAR(255),
        [DiscountPct] SMALLMONEY,
        [Type] NVARCHAR(50),
        [Category] NVARCHAR(50),
        [StartDate] DATETIME,
        [EndDate] DATETIME,
        [MinQty] INT,
        [MaxQty] INT,
        [rowguid] UNIQUEIDENTIFIER,
        [ModifiedDate] DATETIME
	);
GO


-- Create SpecialOfferProduct table
IF OBJECT_ID('STG_Sales.SpecialOfferProduct', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Sales.SpecialOfferProduct;
END
GO

CREATE TABLE STG_Sales.SpecialOfferProduct(
		[SpecialOfferID] INT,
        [ProductID] INT,
        [rowguid] UNIQUEIDENTIFIER,
        [ModifiedDate] DATETIME
	);
GO


-- Create SalesTerritory table
IF OBJECT_ID('STG_Sales.SalesTerritory', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Sales.SalesTerritory;
END
GO

CREATE TABLE STG_Sales.SalesTerritory(
		[TerritoryID] INT,
        [Name] NVARCHAR(50),
        [CountryRegionCode] NVARCHAR(3),
        [Group] NVARCHAR(50),
        [SalesYTD] MONEY,
        [SalesLastYear] MONEY,
        [CostYTD] MONEY,
        [CostLastYear] MONEY,
        [rowguid] UNIQUEIDENTIFIER,
        [ModifiedDate] DATETIME
	);

GO



-- Create Customer table
IF OBJECT_ID('STG_Sales.Customer', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Sales.Customer;
END
GO

CREATE TABLE STG_Sales.Customer(
		[CustomerID] INT,
        [PersonID] INT,
        [StoreID] INT,
        [TerritoryID] INT,
        [AccountNumber] NVARCHAR(10),
        [rowguid] UNIQUEIDENTIFIER,
        [ModifiedDate] DATETIME
	);
GO



-- Create Store table
IF OBJECT_ID('STG_Sales.Store', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Sales.Store;
END
GO

CREATE TABLE STG_Sales.Store(
		[BusinessEntityID] INT,
        [Name] NVARCHAR(50),
        [SalesPersonID] INT,
        [Demographics] XML,
        [rowguid] UNIQUEIDENTIFIER,
        [ModifiedDate] DATETIME
	);
GO


-- Create Person table
IF OBJECT_ID('STG_Person.Person', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Person.Person;
END
GO

CREATE TABLE STG_Person.Person(
		[BusinessEntityID] INT,
        [PersonType] NCHAR(2),
        [NameStyle] BIT,
        [Title] NVARCHAR(8),
        [FirstName] NVARCHAR(50),
        [MiddleName] NVARCHAR(50),
        [LastName] NVARCHAR(50),
        [Suffix] NVARCHAR(10),
        [EmailPromotion] INT,
        [AdditionalContactInfo] XML,
        [Demographics] XML,
        [rowguid] UNIQUEIDENTIFIER,
        [ModifiedDate] DATETIME
	);
GO

-- Create BusinessEntityAddress table
IF OBJECT_ID('STG_Person.BusinessEntityAddress', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Person.BusinessEntityAddress;
END
GO

CREATE TABLE STG_Person.BusinessEntityAddress(
		[BusinessEntityID] INT,
        [AddressID] INT,
		[AddressTypeID] INT,
		[rowguid] UNIQUEIDENTIFIER,
        [ModifiedDate] DATETIME
	);

GO

-- Create AddressType table
IF OBJECT_ID('STG_Person.AddressType', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Person.AddressType;
END
GO

CREATE TABLE STG_Person.AddressType(
		[AddressTypeID] INT,
		[Name] NVARCHAR(50),
		[rowguid] UNIQUEIDENTIFIER,
        [ModifiedDate] DATETIME
	);

GO


-- Create Address table
IF OBJECT_ID('STG_Person.Address', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Person.Address;
END
GO

CREATE TABLE STG_Person.Address(
		[AddressID] INT,
        [AddressLine1] NVARCHAR(60),
        [AddressLine2] NVARCHAR(60),
        [City] NVARCHAR(30),
        [StateProvinceID] INT,
        [PostalCode] NVARCHAR(15),
        [rowguid] UNIQUEIDENTIFIER,
        [ModifiedDate] DATETIME
	);
GO



-- Create StateProvince table
IF OBJECT_ID('STG_Person.StateProvince', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Person.StateProvince;
END
GO

CREATE TABLE STG_Person.StateProvince(
		[StateProvinceID] INT,
        [StateProvinceCode] NCHAR(3),
        [CountryRegionCode] NVARCHAR(3),
        [IsOnlyStateProvinceFlag] BIT,
        [Name] NVARCHAR(50),
        [TerritoryID] INT,
        [rowguid] UNIQUEIDENTIFIER,
        [ModifiedDate] DATETIME
	);
GO




-- Create CountryRegion table
IF OBJECT_ID('STG_Person.CountryRegion', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Person.CountryRegion;
END
GO

CREATE TABLE STG_Person.CountryRegion(
		[CountryRegionCode] NVARCHAR(3),
        [Name] NVARCHAR(50),
        [ModifiedDate] DATETIME
	);
GO


-- Create Product table
IF OBJECT_ID('STG_Production.Product', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Production.Product;
END
GO

CREATE TABLE STG_Production.Product(
		[ProductID] INT,
        [Name] NVARCHAR(50),
        [ProductNumber] NVARCHAR(25),
        [MakeFlag] BIT,
        [FinishedGoodsFlag] BIT,
        [Color] NVARCHAR(15),
        [SafetyStockLevel] SMALLINT,
        [ReorderPoint] SMALLINT,
        [StandardCost] MONEY,
        [ListPrice] MONEY,
        [Size] NVARCHAR(5),
        [SizeUnitMeasureCode] NCHAR(3),
        [WeightUnitMeasureCode] NCHAR(3),
        [Weight] DECIMAL(8,2),
        [DaysToManufacture] INT,
        [ProductLine] NCHAR(2),
        [Class] NCHAR(2),
        [Style] NCHAR(2),
        [ProductSubcategoryID] INT,
        [ProductModelID] INT,
        [SellStartDate] DATETIME,
        [SellEndDate] DATETIME,
        [DiscontinuedDate] DATETIME,
        [rowguid] UNIQUEIDENTIFIER,
        [ModifiedDate] DATETIME
	);
GO



-- Create ProductSubcategory table
IF OBJECT_ID('STG_Production.ProductSubcategory', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Production.ProductSubcategory;
END
GO

CREATE TABLE STG_Production.ProductSubcategory(
		[ProductSubcategoryID] INT,
        [ProductCategoryID] INT,
        [Name] NVARCHAR(50),
        [rowguid] UNIQUEIDENTIFIER,
        [ModifiedDate] DATETIME
	);
GO



-- Create ProductCategory table
IF OBJECT_ID('STG_Production.ProductCategory', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Production.ProductCategory;
END
GO

CREATE TABLE STG_Production.ProductCategory(
		[ProductCategoryID] INT,
        [Name] NVARCHAR(50),
        [rowguid] UNIQUEIDENTIFIER,
        [ModifiedDate] DATETIME
	);
GO



-- Create ProductInventory table
IF OBJECT_ID('STG_Production.ProductInventory', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Production.ProductInventory;
END
GO

CREATE TABLE STG_Production.ProductInventory(
		[ProductID] INT,
        [LocationID] SMALLINT,
        [Shelf] NVARCHAR(10),
        [Bin] TINYINT,
        [Quantity] SMALLINT,
        [rowguid] UNIQUEIDENTIFIER,
        [ModifiedDate] DATETIME
	);
GO



-- Create Location table
IF OBJECT_ID('STG_Production.Location', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Production.Location;
END
GO

CREATE TABLE STG_Production.Location(
		[LocationID] SMALLINT,
        [Name] NVARCHAR(50),
        [CostRate] SMALLMONEY,
        [Availability] DECIMAL(8,2),
        [ModifiedDate] DATETIME
	);
GO

-- Create ProductCostHistory table
IF OBJECT_ID('STG_Production.ProductCostHistory', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Production.ProductCostHistory;
END
GO

CREATE TABLE STG_Production.ProductCostHistory(
		[ProductID] INT,
        [StartDate] DATETIME,
		[EndDate] DATETIME,
		[StandardCost] MONEY,
        [ModifiedDate] DATETIME
	);
GO

-- Create ProductListPriceHistory table
IF OBJECT_ID('STG_Production.ProductListPriceHistory', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Production.ProductListPriceHistory;
END
GO

CREATE TABLE STG_Production.ProductListPriceHistory(
		[ProductID] INT,
        [StartDate] DATETIME,
		[EndDate] DATETIME,
		[ListPrice] MONEY,
        [ModifiedDate] DATETIME
	);
GO


-- Create ShipMethod table
IF OBJECT_ID('STG_Purchasing.ShipMethod', 'U') IS NOT NULL
BEGIN
	DROP TABLE STG_Purchasing.ShipMethod;
END
GO

CREATE TABLE STG_Purchasing.ShipMethod(
		[ShipMethodID] INT,
        [Name] NVARCHAR(50),
		[ShipBase] MONEY,
		[ShipRate] MONEY,
		[rowguid] UNIQUEIDENTIFIER,
        [ModifiedDate] DATETIME
	);
GO