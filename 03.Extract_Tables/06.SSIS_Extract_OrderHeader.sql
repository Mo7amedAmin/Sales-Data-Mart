SELECT [SalesOrderID]
      ,CONVERT(DATE, OrderDate) AS OrderDate
      ,CONVERT(DATE, DueDate) AS DueDate
      ,CONVERT(DATE, ShipDate) AS ShipDate
      ,[OnlineOrderFlag]
      ,[CustomerID]
      ,[TerritoryID]
      ,[ShipMethodID]
      ,[SubTotal]
      ,[TaxAmt]
      ,[Freight]
      ,[TotalDue]
FROM [STG_Sales].[SalesOrderHeader]