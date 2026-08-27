SELECT
    Giorno_Settimana,
    Fascia_Oraria,
    SUM(Quantita) AS Quantita_Venduta,
    ROUND(SUM(Ricavo_EUR), 2) AS Ricavo_Generato
FROM vendite
GROUP BY Giorno_Settimana, Fascia_Oraria
ORDER BY Quantita_Venduta DESC
LIMIT 10;