SELECT P.ProductID,
	   P.Name,
	   P.ProductNumber,
	   P.Color,
	   P.Size,
	   P.StandardCost,
	   P.ListPrice,
	   P.SafetyStockLevel,
	   P.ReorderPoint,
	   SC.Name AS ProductSubcategoryName,
	   c.Name ProductCategoryName
FROM [STG_Production].[Product] P LEFT JOIN  [STG_Production].[ProductSubcategory] SC
	ON P.ProductSubcategoryID = SC.ProductSubcategoryID
LEFT JOIN [STG_Production].[ProductCategory] C
	ON SC.ProductCategoryID = C.ProductCategoryID