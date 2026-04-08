SELECT ProductKey, COUNT(*)
FROM DimProduct
GROUP BY ProductKey
HAVING COUNT(*) > 1;

SELECT *
FROM DimProduct
WHERE ProductKey IS NULL;