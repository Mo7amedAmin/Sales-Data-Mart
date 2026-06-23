SELECT Header.SalesOrderID,
	   Detail.SalesOrderDetailID,
	   Detail.ProductID,
	   Detail.SpecialOfferID,
	   Header.OrderDate,
	   Header.CustomerID,
	   Header.TerritoryID,
	   Header.ShipMethodID,
	   Header.OnlineOrderFlag,
	   Detail.OrderQty,
	   Detail.UnitPrice,
	   Detail.UnitPriceDiscount,
	   PCost.StandardCost,
	   Detail.LineTotal AS SalesAmount
FROM [STG_Sales].[SalesOrderHeader] Header
INNER JOIN [STG_Sales].[SalesOrderDetail] Detail
	ON Header.SalesOrderID = Detail.SalesOrderID
INNER JOIN [STG_Production].[ProductCostHistory] PCost
	ON Detail.ProductID = PCost.ProductID 
	AND OrderDate >= PCost.StartDate 
	AND OrderDate < ISNULL(PCost.EndDate, '9999-12-31')
