SELECT EnglishProductName AS Nome_Prodotto, SUM(f.SalesAmount) AS Fatturato_Totale, 
SUM(f.OrderQuantity) AS Quantita_Totale, AVG(f.UnitPrice) AS Prezzo_Medio
FROM adventureworksdw2020.factresellersales
JOIN adventureworksdw2020.dimproduct ON factresellersales.ProductKey = dimproduct.ProductKey
WHERE OrderDate >='2020-01-01'
GROUP BY dimproduct.EnglishProductName;