-- ============================================================
-- CAPSTONE PROJECT: Sales Performance & KPI Analysis - THP (BAT/glo)
-- Query SQL per le 4 domande operative della Direzione Commerciale
-- Database: capstone_glo.db (SQLite)
-- ============================================================

-- ============================================================
-- DOMANDA 1: Il calo e' legato a un prodotto specifico
-- (device Hardware vs Consumabili) nelle regioni sotto target?
-- ============================================================
SELECT
    CASE
        WHEN s.ID_Regione IN ('R1', 'R3') THEN 'Performanti'
        WHEN s.ID_Regione IN ('R4', 'R5') THEN 'In Calo'
        ELSE 'Altro'
    END AS Gruppo_Regione,
    p.Categoria,
    SUM(v.Quantita) AS Quantita_Totale,
    ROUND(SUM(v.Ricavo_EUR), 2) AS Ricavo_Totale
FROM vendite v
JOIN store s ON v.ID_Store = s.ID_Store
JOIN prodotti p ON v.ID_Prodotto = p.ID_Prodotto
WHERE s.ID_Regione IN ('R1', 'R3', 'R4', 'R5')  -- esclude R2 (Lazio, gruppo neutro)
GROUP BY Gruppo_Regione, p.Categoria
ORDER BY Gruppo_Regione, p.Categoria;


-- ============================================================
-- DOMANDA 2: Confronto vendite effettive vs target per REGIONE
-- (vista aggregata per la Direzione Commerciale / Sales Director)
-- ============================================================
SELECT
    r.Nome_Regione,
    r.Area_Manager,
    SUM(v.Quantita) AS Quantita_Venduta,
    ROUND(SUM(v.Ricavo_EUR), 2) AS Ricavo_Venduto,
    COUNT(DISTINCT s.ID_Store) * 430 AS Target_Quantita_Regione,
    COUNT(DISTINCT s.ID_Store) * 4600 AS Target_Ricavo_Regione,
    ROUND(
        (SUM(v.Quantita) - (COUNT(DISTINCT s.ID_Store) * 430)) * 100.0
        / (COUNT(DISTINCT s.ID_Store) * 430), 1
    ) AS Scostamento_Percentuale
FROM vendite v
JOIN store s ON v.ID_Store = s.ID_Store
JOIN regioni r ON s.ID_Regione = r.ID_Regione
GROUP BY r.Nome_Regione, r.Area_Manager
ORDER BY Scostamento_Percentuale DESC;


-- ============================================================
-- DOMANDA 3: Quali STORE/AGENTI non raggiungono i target?
-- (vista dettagliata per l'Area Manager)
-- ============================================================
SELECT
    s.ID_Store,
    s.Nome_Store,
    r.Nome_Regione,
    s.Agente_Responsabile,
    SUM(v.Quantita) AS Quantita_Venduta,
    t.Target_Quantita,
    ROUND(
        (SUM(v.Quantita) - t.Target_Quantita) * 100.0 / t.Target_Quantita, 1
    ) AS Scostamento_Percentuale,
    CASE
        WHEN (SUM(v.Quantita) - t.Target_Quantita) * 1.0 / t.Target_Quantita < -0.15
            THEN 'Sotto Target (critico)'
        WHEN (SUM(v.Quantita) - t.Target_Quantita) * 1.0 / t.Target_Quantita < 0
            THEN 'Sotto Target'
        ELSE 'In linea / Sopra Target'
    END AS Stato
FROM vendite v
JOIN store s ON v.ID_Store = s.ID_Store
JOIN regioni r ON s.ID_Regione = r.ID_Regione
JOIN target t ON s.ID_Store = t.ID_Store
GROUP BY s.ID_Store, s.Nome_Store, r.Nome_Regione, s.Agente_Responsabile, t.Target_Quantita
ORDER BY Scostamento_Percentuale ASC;


-- ============================================================
-- DOMANDA 4: In quali giorni/orari concentrare le Brand Ambassador?
-- (pattern di traffico per pianificare la presenza sul campo)
-- ============================================================
SELECT
    Giorno_Settimana,
    Fascia_Oraria,
    SUM(Quantita) AS Quantita_Venduta,
    ROUND(SUM(Ricavo_EUR), 2) AS Ricavo_Generato
FROM vendite
GROUP BY Giorno_Settimana, Fascia_Oraria
ORDER BY Quantita_Venduta DESC
LIMIT 10;  -- le 10 combinazioni giorno/fascia con piu' traffico: priorita' per le BA
