USE AdventureworksDWH2022
GO

-- Drop BridgeSalesReason if exists
IF OBJECT_ID('BridgeSalesReason', 'U') IS NOT NULL
BEGIN
	DROP TABLE BridgeSalesReason;
END
GO

-- Create BridgeSalesReason 
CREATE TABLE BridgeSalesReason(
	SalesOrderID INT NOT NULL,
	SalesReasonKey INT NOT NULL,

	CONSTRAINT PK_BridgeSalesReason PRIMARY KEY(SalesOrderID, SalesReasonKey),

	CONSTRAINT FK_BridgeSalesReason_DimSalesReason
	FOREIGN KEY (SalesReasonKey) REFERENCES DimSalesReason(SalesReasonKey),

	CONSTRAINT FK_BridgeSalesReason_FactSalesOrderHeader
	FOREIGN KEY (SalesOrderID) REFERENCES FactSalesOrderHeader(OrderID)
	);
GO