-- TASK 4

-- 1) Verifica univocità PK
SELECT ProductID, COUNT(*) 
FROM Product 
GROUP BY ProductID 
HAVING COUNT(*) > 1;


-- 2) Elenco transazioni completo
SELECT 
    S.OrderID, 
    S.OrderDate, 
    P.ProductName, 
    C.CategoryName, 
    ST.StateName, 
    SR.SalesRegionName,
    CASE 
        WHEN DATEDIFF(day, S.OrderDate, GETDATE()) > 180 THEN 'True' 
        ELSE 'False' 
    END AS Superato180Giorni
FROM Sales S
JOIN Product P ON S.ProductID = P.ProductID
JOIN Category C ON P.CategoryID = C.CategoryID
JOIN State ST ON S.StateID = ST.StateID
JOIN SalesRegion SR ON ST.SalesRegionID = SR.SalesRegionID;


-- 3) Prodotti con vendite totali > media vendite dell'ultimo anno censito
SELECT ProductID, SUM(Quantity) AS TotaleVenduto
FROM Sales
WHERE YEAR(OrderDate) = (SELECT MAX(YEAR(OrderDate)) FROM Sales)
GROUP BY ProductID
HAVING SUM(Quantity) > (
    SELECT AVG(Quantity) 
    FROM Sales 
    WHERE YEAR(OrderDate) = (SELECT MAX(YEAR(OrderDate)) FROM Sales)
);

-- 4) Elenco prodotti venduti e fatturato totale per anno
SELECT ProductID, YEAR(OrderDate) AS Anno, SUM(Quantity * UnitPrice) AS FatturatoAnnuale
FROM Sales
GROUP BY ProductID, YEAR(OrderDate);


-- 5) Fatturato totale per stato per anno (Ordinato per data e fatturato decrescente)
SELECT ST.StateName, YEAR(S.OrderDate) AS Anno, SUM(S.Quantity * S.UnitPrice) AS Fatturato
FROM Sales S
JOIN State ST ON S.StateID = ST.StateID
GROUP BY ST.StateName, YEAR(S.OrderDate)
ORDER BY Anno, Fatturato DESC;


-- 6) Categoria di articoli maggiormente richiesta dal mercato
SELECT TOP, C.CategoryName, SUM(S.Quantity) AS QuantitaTotale
FROM Sales S
JOIN Product P ON S.ProductID = P.ProductID
JOIN Category C ON P.CategoryID = C.CategoryID
GROUP BY C.CategoryName
ORDER BY QuantitaTotale DESC;


-- 7) Prodotti invenduti (Due approcci)
-- Approccio 1: Usando NOT IN
SELECT * 
FROM Product 
WHERE ProductID NOT IN (SELECT ProductID FROM Sales);

-- Approccio 2: Usando LEFT JOIN
SELECT P.* 
FROM Product P
LEFT JOIN Sales S ON P.ProductID = S.ProductID
WHERE S.ProductID IS NULL;


-- 8) Vista prodotti denormalizzata (Codice, Nome Prodotto, Nome Categoria)
CREATE VIEW VistaProdottiDenormalizzata AS
SELECT P.ProductID, P.ProductName, C.CategoryName
FROM Product P
JOIN Category C ON P.CategoryID = C.CategoryID;


-- 9) Vista per le informazioni geografiche
CREATE VIEW VistaGeografica AS
SELECT ST.StateID, ST.StateName, SR.SalesRegionName
FROM State ST
JOIN SalesRegion SR ON ST.SalesRegionID = SR.SalesRegionID;