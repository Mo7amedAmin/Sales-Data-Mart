USE AdventureworksDWH2022
GO

-- Drop Channel dimension if exists
IF OBJECT_ID('DimChannel', 'U') IS NOT NULL
BEGIN
	DROP TABLE DimChannel;
END
GO

-- Create Channel dimension
CREATE TABLE DimChannel(
	ChannelKey INT IDENTITY(1,1) PRIMARY KEY, 
	ChannelName NVARCHAR(25) NOT NULL,
	);
GO



-- Insert a default row
SET IDENTITY_INSERT DimChannel ON;


INSERT INTO DimChannel(ChannelKey, ChannelName) 
VALUES (0, 'Unknown');


SET IDENTITY_INSERT DimChannel off;
GO