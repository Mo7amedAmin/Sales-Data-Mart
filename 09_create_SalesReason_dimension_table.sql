USE AdventureworksDWH2022
GO

-- Drop SalesReason dimension if exists
IF OBJECT_ID('DimSalesReason', 'U') IS NOT NULL
BEGIN
	DROP TABLE DimSalesReason;
END
GO


-- Create SalesReason dimension
CREATE TABLE DimSalesReason(
	SalesReasonKey INT IDENTITY(1,1) PRIMARY KEY,
	SalesReasonID INT NOT NULL,
	ReasonName NVARCHAR(50) NOT NULL,
	ReasonType NVARCHAR(50) NOT NULL,
	);
GO

-- Create indexes
DROP INDEX IF EXISTS SalesReasonID_IX
ON DimSalesReason;

CREATE INDEX SalesReasonID_IX 
ON DimSalesReason(SalesReasonID);
GO

-- Insert a default row
SET IDENTITY_INSERT DimSalesReason ON;


INSERT INTO DimSalesReason(SalesReasonKey, SalesReasonID, ReasonName, ReasonType) 
VALUES (0, 0, 'Unknown', 'Unknown');


SET IDENTITY_INSERT DimSalesReason off;
GO