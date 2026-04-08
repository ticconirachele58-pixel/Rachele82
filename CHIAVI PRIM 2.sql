SELECT SalesOrderNumber, SalesOrderLineNumber, COUNT(*)
FROM adventureworksdw2020.factresellersales
GROUP BY SalesOrderNumber, SalesOrderLineNumber
HAVING COUNT(*) > 1

SELECT * 
FROM adventureworksdw2020.factresellersales
WHERE SalesOrderNumber IS NULL OR SalesOrderLineNumber IS NULL;