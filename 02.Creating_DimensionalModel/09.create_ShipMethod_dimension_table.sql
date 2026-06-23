USE AdventureworksDWH2022
GO

-- Drop ShipMethod dimension if exists
IF OBJECT_ID('DimShipMethod', 'U') IS NOT NULL
BEGIN
	DROP TABLE DimShipMethod;
END
GO

-- Create ShipMethod dimension
CREATE TABLE DimShipMethod(
	ShipMethodKey INT IDENTITY(1,1) PRIMARY KEY, 
	ShipMethodID INT NOT NULL,
	ShipMethodName NVARCHAR(50) NOT NULL,
	ShipBase MONEY NOT NULL,
	ShipRate MONEY NOT NULL,

	-- SCD
	StartDate DATETIME NOT NULL DEFAULT GETDATE(),
	EndDate DATETIME,
	IsCurrent BIT NOT NULL DEFAULT 1
	);
GO


-- Create indexes
DROP INDEX IF EXISTS ShipMethodID_IX
ON DimShipMethod;

CREATE INDEX ShipMethodID_IX 
ON DimShipMethod(ShipMethodID);

-- Insert a default row
SET IDENTITY_INSERT DimShipMethod ON;


INSERT INTO DimShipMethod(ShipMethodKey, ShipMethodID, ShipMethodName, ShipBase, ShipRate, StartDate, EndDate, IsCurrent) 
VALUES (0, 0, 'Unknown', 0, 0, '1900-01-01', NULL, 1);


SET IDENTITY_INSERT DimShipMethod off;
GO