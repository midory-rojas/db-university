## 📊 Database Schema – University 
Obiettivo: La **progettazione e modellazione di un database relazionale** finalizzato alla gestione dei dati di una università.

Il modello concettuale è stato definito a partire dai seguenti requisiti funzionali:

- L’università è suddivisa in più **Dipartimenti** (ad esempio: Lettere e Filosofia, Matematica, Ingegneria).
- Ogni Dipartimento offre uno o più **Corsi di Laurea**.
- Ogni Corso di Laurea comprende diversi **Corsi/Insegnamenti**.
- Ogni Corso può essere tenuto da **più Docenti**.
- Ogni Corso prevede **più appelli d’Esame**.
- Ogni Studente è iscritto a **un unico Corso di Laurea**.
- Ogni Studente può sostenere **più Esami**.
- Per ciascun Esame sostenuto è necessario memorizzare **il voto ottenuto**, indipendentemente dal suo esito.

Sulla base di tali requisiti, sono state individuate le entità fondamentali del sistema e definite le relative **relazioni**, con particolare attenzione alla gestione delle relazioni **molti-a-molti** mediante tabelle di associazione.  
Le scelte progettuali adottate garantiscono la **normalizzazione dei dati** e l’**integrità referenziale** del database.

## 🔍 Query SQL Select ed Analisi Dati

### 🛠️ Strumenti e Tecnologie

- **Database Management System**: MySQL
- **Database**: `db_university`

1. **Studenti nati nel 1990**: Selezione filtrata tramite `BETWEEN` per identificare i 160 studenti nati in quell'anno.
2. **Corsi oltre 10 CFU**: Estrazione di tutti i corsi (479) con un carico di crediti formativi superiore alla soglia indicata (<10 crediti)
3. **Studenti con più di 30 anni**: Calcolo dinamico dell'età tramite la funzione `TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())`.
4. **Corsi I Semestre / I Anno**: Filtraggio combinato su periodo e anno accademico (I semestre e primo anno) (286 corsi individuati).
5. **Appelli pomeridiani (20/06/2020)**: Selezione degli esami programmati dopo le ore 14:00 in una data specifica (21 appelli).
6. **Corsi di Laurea Magistrale**: Identificazione di tutti i corsi di studio di livello "magistrale" (38 risultati).
7. **Conteggio Dipartimenti**: Analisi della struttura universitaria composta da un totale di 12 dipartimenti.
8. **Insegnanti senza telefono**: Controllo sulla qualità dei dati tramite `IS NULL` per rintracciare i 50 docenti che non hanno un numero di telefono.

