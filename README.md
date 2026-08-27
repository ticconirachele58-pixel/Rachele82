# Sales Performance & KPI Analysis — THP (Tobacco Heating Products)

**Capstone Project — AI Data Analysis Master, Epicode**
**Candidata:** Rachele Ticconi

## Descrizione del progetto

Analisi delle performance di vendita territoriali di un prodotto a tabacco riscaldato (BAT — glo), sviluppata per rispondere a una richiesta simulata della Direzione Commerciale: individuare dove si concentrano i cali di vendita rispetto ai target trimestrali, quali prodotti sono più colpiti, quali store/agenti necessitano supporto, e in quali giorni/orari concentrare la presenza delle Brand Ambassador sul territorio.

Il progetto nasce dalla mia esperienza diretta di due anni come Brand Ambassador per multinazionali del settore tabacco riscaldato (BAT, JTI), e integra dati di mercato reali (fonti pubbliche) con un dataset di vendita simulato ma realistico, costruito nel rispetto della riservatezza commerciale delle aziende reali coinvolte.

## Struttura del repository

| File | Descrizione |
|---|---|
| `Relazione_Finale_Capstone.pdf` | Relazione completa: Executive Summary, metodologia, risultati, raccomandazioni (bilingue IT/EN) |
| `Relazione_Finale_Capstone.docx` | Versione Word della relazione |
| `dataset_glo_raw.xlsx` | Dataset simulato (5 regioni, 15 store, 5 prodotti, 4.181 transazioni Q2 2026) + 4 fogli di analisi |
| `query_capstone.sql` | Query SQL commentate per le 4 domande operative, testate su SQLite e MySQL Workbench |
| `Dashboard_glo_capstone.pbix` | Dashboard interattiva Power BI (2 pagine: Overview, Deep Dive) |
| `images/` | Screenshot della dashboard Power BI, inclusi nella relazione |

## Strumenti utilizzati

- **Microsoft Excel** — data cleaning, formule di aggregazione (SUMIFS, INDEX/MATCH), tabelle pivot
- **SQL (MySQL)** — query relazionali strutturate su database dedicato
- **Microsoft Power BI** — dashboard interattiva per Sales Director e Area Manager
- **Ricerca web** — raccolta dati reali di mercato (BAT, PMI/IQOS, mercato italiano THP)

## Metodologia — dati reali vs simulati

- **Dati reali**: contesto di mercato generale (quote HTP, trend Italia, confronto competitivo BAT vs IQOS), da fonti pubbliche (report annuali aziendali, ADM, Mordor Intelligence, ALICe Italia)
- **Dati simulati**: vendite, store, agenti, target trimestrali — informazioni per natura riservate a livello aziendale, costruite in modo realistico sulla base dell'esperienza diretta sul campo

Il dettaglio completo della metodologia è disponibile nella relazione finale (sezione 2).

## Risultati principali

- Anomalia territoriale confermata: Lombardia (+24,9%) e Veneto (+22,2%) sopra target; Campania (-25,2%) e Sicilia (-29,8%) sotto target
- 6 store critici identificati, tutti concentrati in Campania e Sicilia
- Il calo colpisce più l'hardware (-51,3%) rispetto ai consumabili (-39,7%) — indicando un problema di acquisizione nuovi clienti
- Picchi di vendita concentrati nel weekend, fascia 16:00-21:00 — indicazione operativa per la pianificazione delle Brand Ambassador

## Video pitch

Presentazione video (~3 minuti) inviata separatamente via email, come da istruzioni del corso.
