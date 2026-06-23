USE AdventureworksDWH2022
GO

-- Drop FK constrains from Fact Tables
IF EXISTS (
    SELECT 1
    FROM sys.objects
    WHERE name = 'FK_FactSalesOrdreDetail_SpecialOfferDim'
    AND type = 'F'
)
BEGIN
	ALTER TABLE FactSalesOrdreDetail
	DROP CONSTRAINT FK_FactSalesOrdreDetail_SpecialOfferDim;
END
GO

-- Drop SpecialOffer dimension if exists
IF OBJECT_ID('DimSpecialOffer', 'U') IS NOT NULL
BEGIN
	DROP TABLE DimSpecialOffer;
END
GO

-- Create SpecialOffer dimension
CREATE TABLE DimSpecialOffer(
	SpecialOfferKey INT IDENTITY(1,1) PRIMARY KEY, 
	SpecialOfferID INT NOT NULL,
	OfferDescription NVARCHAR(255) NOT NULL,
	DiscountPct SMALLMONEY NOT NULL,
	OfferType NVARCHAR(50) NOT NULL,
    OfferCategory NVARCHAR(50) NOT NULL,
    MinQty INT NOT NULL,
    MaxQty INT,
	StartDate DATETIME NOT NULL,
    EndDate DATETIME,
	IsCurrent BIT NOT NULL
	);
GO

-- Recreate FKs in Fact Tables
IF OBJECT_ID('FactSalesOrdreDetail', 'U') IS NOT NULL
BEGIN
	ALTER TABLE FactSalesOrdreDetail 
	ADD CONSTRAINT FK_FactSalesOrdreDetail_SpecialOfferDim
	FOREIGN KEY (SpecialOfferKey)
	REFERENCES DimSpecialOffer(SpecialOfferKey);
END
GO

-- Create indexes
DROP INDEX IF EXISTS SpecialOfferID_IX
ON DimTerritory;

CREATE INDEX SpecialOfferID_IX 
ON DimSpecialOffer(SpecialOfferID);
GO


-- Insert a default row
SET IDENTITY_INSERT DimSpecialOffer ON;


INSERT INTO DimSpecialOffer(SpecialOfferKey, SpecialOfferID, OfferDescription, DiscountPct, OfferType, OfferCategory, MinQty, MaxQty, StartDate, EndDate, IsCurrent) 
VALUES (0, 0, 'Unknown', 0, 'Unknown', 'Unknown', 0, 0, '1900-01-01', '1900-01-01', 1);


SET IDENTITY_INSERT DimSpecialOffer off;
GO