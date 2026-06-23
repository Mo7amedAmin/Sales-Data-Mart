SELECT A.AddressID,
	   C.CustomerID,
	   AddT.Name AS AddressType,
	   A.AddressLine1 AS AddressLine1,
	   A.AddressLine2 AS AddressLine2,
	   A.City AS City,
	   SP.Name AS ProcinceName,
	   CR.Name AS CountryRegionName
FROM STG_Sales.Customer C LEFT OUTER JOIN STG_Person.Person P
	ON C.PersonID = P.BusinessEntityID AND C.StoreID IS NULL
LEFT OUTER JOIN STG_Sales.Store S
	ON C.StoreID = S.BusinessEntityID
LEFT OUTER JOIN STG_Person.BusinessEntityAddress BEA
	ON P.BusinessEntityID = BEA.BusinessEntityID OR S.BusinessEntityID = BEA.BusinessEntityID
LEFT OUTER JOIN STG_Person.Address A
	ON BEA.AddressID = A.AddressID
LEFT OUTER JOIN STG_Person.AddressType AddT
	ON BEA.AddressTypeID = AddT.AddressTypeID
LEFT OUTER JOIN STG_Person.StateProvince SP
	ON A.StateProvinceID = SP.StateProvinceID
LEFT OUTER JOIN STG_Person.CountryRegion CR
	ON SP.CountryRegionCode = CR.CountryRegionCode

UNION ALL
SELECT NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL



