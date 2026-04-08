SELECT OrderDate, COUNT(SalesOrderLineNumber)
FROM adventureworksdw2020.factresellersales
WHERE OrderDate >= '2020-01-01'
GROUP BY OrderDate;