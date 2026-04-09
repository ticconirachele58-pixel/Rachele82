SELECT 
    G.City, 
    SUM(F.SalesAmount) AS Fatturato_Totale
FROM 
    adventureworksdw2020.factresellersales AS F
JOIN 
    adventureworksdw2020.dimreseller AS R ON F.ResellerKey = R.ResellerKey
JOIN 
    adventureworksdw2020.dimgeography AS G ON R.GeographyKey = g.GeographyKey
WHERE 
    F.OrderDate >= '2020-01-01'
GROUP BY 
    G.City
HAVING 
    Fatturato_Totale > 60000
ORDER BY 
    City ASC;