USE AdventureworksDWH2022
GO

-- Drop Territory dimension if exists
IF OBJECT_ID('DimTerritory', 'U') IS NOT NULL
BEGIN
	DROP TABLE DimTerritory;
END
GO


-- Create Territory dimension
CREATE TABLE DimTerritory(
	TerritoryKey INT IDENTITY(1,1) PRIMARY KEY, 
	TerritoryID INT NOT NULL,
	TerritoryName NVARCHAR(50) NOT NULL,
	CountryRegionName NVARCHAR(50) NOT NULL,
	TerritoryGroup NVARCHAR(50) NOT NULL,
	
	-- SCD Columns
	StartDate DATETIME NOT NULL DEFAULT GETDATE(),
	EndDate DATETIME,
	IsCurrent BIT NOT NULL DEFAULT 1
	);
GO


-- Create indexes
DROP INDEX IF EXISTS TerritoryID_IX
ON DimTerritory;

CREATE INDEX TerritoryID_IX 
ON DimTerritory(TerritoryID);
GO


-- Insert a default row
SET IDENTITY_INSERT DimTerritory ON;


INSERT INTO DimTerritory(TerritoryKey, TerritoryID, TerritoryName,CountryRegionName, TerritoryGroup, StartDate, EndDate, IsCurrent) 
VALUES (0, 0, 'Unknown', 'Unknown', 'Unknown', '1900-01-01', NULL, 1);


SET IDENTITY_INSERT DimTerritory off;
GO