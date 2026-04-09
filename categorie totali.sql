SELECT 
EnglishProductName AS Prodotto, 
SUM(SalesAmount) AS Fatturato_totale,
SUM(OrderQuantity) AS Quantita_totale
FROM adventureworksdw2020.factresellersales
JOIN
dimproduct ON factresellersales.ProductKey = dimproduct.ProductKey
JOIN 
dimproductsubcategory 
ON dimproduct.ProductSubcategoryKey = dimproductsubcategory.ProductSubcategoryKey
JOIN
dimproductcategory 
ON dimproductsubcategory.ProductcategoryKey = dimproductCategory.ProductCategoryKey
GROUP BY EnglishProductName
ORDER BY EnglishProductName ASC
