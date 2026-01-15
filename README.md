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

## 🔍 Query di Selezione e Filtro

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

## 📊 Query di Raggruppamento (GROUP BY)

Le query di aggregazione sono state utilizzate per generare statistiche sintetiche sui dati accademici.

| Obiettivo | Funzione SQL | Raggruppamento |
| :--- | :--- | :--- |
| **Iscritti per anno** | `COUNT(*)` | `YEAR(enrolment_date)` |
| **Docenti per ufficio** | `COUNT(*)` | `office_address` |
| **Media voti per esame** | `AVG(vote)` | `exam_id` |
| **Corsi per dipartimento** | `COUNT(*)` | `department_id` |

### Dettagli Tecnici:
1. **Iscritti per anno**: Conteggio degli studenti basato sull'anno di immatricolazione, ordinato cronologicamente.
2. **Insegnanti nello stesso edificio**: Identificazione della distribuzione dei docenti negli uffici.
3. **Media Voti**: Calcolo della performance media per ogni appello d'esame (tabella `exam_student`).
4. **Dipartimenti**: Conteggio dei corsi di laurea per dipartimento, ordinati dal più grande al più piccolo (`DESC`).

## 🔗 Query con JOIN

In questa sezione sono state utilizzate le JOIN per mettere in relazione diverse tabelle del database (studenti, corsi, dipartimenti e insegnanti) al fine di estrarre informazioni complesse.

| Obiettivo | Tabelle Coinvolte | Condizione Principale |
| :--- | :--- | :--- |
| **Studenti di Economia** | `students`, `degrees` | `degrees.name = "Economia"` |
| **Magistrali Neuroscienze** | `degrees`, `departments` | `dept.name = "Neuroscienze"` |
| **Corsi di un docente** | `teachers`, `course_teacher`, `courses` | `teacher_id = 44` |
| **Dettaglio Studenti** | `students`, `degrees`, `departments` | Relazione completa |
| **Corsi e Insegnanti** | `degrees`, `courses`, `teachers` | Relazione N:N |
| **Docenti Matematica** | `teachers`, `courses`, `degrees`, `dept` | `dept.name = "Matematica"` |

### ### Dettagli Tecnici:

1. **Studenti di Economia**: Recupero della lista studenti filtrata per il nome specifico del corso di laurea.
2. **Magistrali Neuroscienze**: Selezione dei corsi filtrando sia per il dipartimento che per il livello del corso ("magistrale").
3. **Corsi di Fulvio Amato**: Utilizzo di una tabella pivot (`course_teacher`) per collegare i docenti ai loro rispettivi corsi.
4. **Dettaglio Studenti**: Una tripla JOIN per ottenere una panoramica completa: Studente -> Corso di Laurea -> Dipartimento.
5. **Corsi e Insegnanti**: Mappatura completa che associa ogni corso di laurea ai singoli insegnamenti e ai relativi docenti responsabili.
6. **Docenti Matematica**: Query complessa con JOIN multiple e clausola `DISTINCT` per evitare duplicati nel caso un docente tenga più corsi nello stesso dipartimento.




