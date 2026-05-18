USE AdventureworksDWH2022
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
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    MinQty INT NOT NULL,
    MaxQty INT
	);
GO

-- Create indexes
DROP INDEX IF EXISTS SpecialOfferID_IX
ON DimTerritory;

CREATE INDEX SpecialOfferID_IX 
ON DimSpecialOffer(SpecialOfferID);
GO


-- Insert a default row
SET IDENTITY_INSERT DimSpecialOffer ON;


INSERT INTO DimSpecialOffer(SpecialOfferKey, SpecialOfferID, OfferDescription, DiscountPct, OfferType, OfferCategory,StartDate, EndDate, MinQty, MaxQty) 
VALUES (0, 0, 'Unknown', 0, 'Unknown', 'Unknown', '1900-01-01', '1900-01-01', 0, 0);


SET IDENTITY_INSERT DimSpecialOffer off;
GO