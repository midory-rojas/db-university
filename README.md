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
