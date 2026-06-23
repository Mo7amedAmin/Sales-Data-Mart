SELECT ST.TerritoryID,
	   ST.Name AS TerritoryName,
	   CR.Name CountryRegionName,
	   ST.[Group] AS TerritoryGroup

FROM STG_Sales.SalesTerritory ST INNER JOIN STG_Person.CountryRegion CR
ON ST.CountryRegionCode = CR.CountryRegionCode