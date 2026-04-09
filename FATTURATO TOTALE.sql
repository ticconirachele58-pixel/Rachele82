SELECT 
EnglishProductName AS Nome_Prodotto, 
SUM(SalesAmount) AS Fatturato_Totale, 
SUM(OrderQuantity) AS Quantita_Totale,
AVG(UnitPrice) AS Prezzo_Medio
FROM adventureworksdw2020.factresellersales
JOIN 
adventureworksdw2020.dimproduct ON factresellersales.ProductKey = dimproduct.ProductKey
WHERE FactResellerSales.OrderDate >='2020-01-01'
GROUP BY EnglishProductName
-- ORDER BY EnglishProductName DESC
ORDER BY Nome_Prodotto ASC 