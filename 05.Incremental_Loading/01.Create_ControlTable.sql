USE [AdventureworksDWH2022]
GO

CREATE TABLE ControlTable(
	TableName VARCHAR(100) PRIMARY KEY,
	LastLoadDate DATETIME NOT NULL
	);
GO

INSERT INTO ControlTable
VALUES ('FactSalesOrderHeader', '1900-01-01'), ('FactSalesOrderDetail', '1900-01-01');
GO

INSERT INTO ControlTable
VALUES ('BridgeSalesReason', '1900-01-01');
GO