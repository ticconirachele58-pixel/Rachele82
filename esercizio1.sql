SELECT SalesOrderNumber, ProductKey, OrderDate, SalesAmount, TotalProductCost, (SalesAmount - TotalProductCost) AS Profitto
FROM adventureworksdw2020.factresellersales
WHERE OrderDate >= '2020-01-01'
AND ProductKey IN (597, 598, 477, 214);