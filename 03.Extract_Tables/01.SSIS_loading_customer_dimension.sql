SELECT C.CustomerID,
	   C.TerritoryID,
	   C.AccountNumber,
	   S.Name AS StoreName,
	   P.PersonType,
	   P.FirstName,
	   P.LastName
FROM STG_Sales.Customer C LEFT OUTER JOIN STG_Person.Person P
	ON C.PersonID = P.BusinessEntityID AND C.StoreID IS NULL
LEFT OUTER JOIN STG_Sales.Store S
	ON C.StoreID = S.BusinessEntityID

UNION ALL
SELECT NULL, NULL, NULL, NULL, NULL, NULL, NULL