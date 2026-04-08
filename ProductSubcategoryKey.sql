SELECT EnglishProductName, S.EnglishProductSubcategoryName
FROM adventureworksdw2020.dimproduct AS P
JOIN dimproductsubcategory AS S 
ON S.ProductSubcategoryKey = P.ProductSubcategoryKey
GROUP BY EnglishProductName, EnglishProductSubcategoryName
ORDER BY EnglishProductName