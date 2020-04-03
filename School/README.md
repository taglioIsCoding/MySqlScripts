# Scuole

## Analisi del problema
La consegna che ci è stata fornirnita era chiara.
A questo punto io e i miei compagni abbiamo individuato deiverse entità: </br>
La prima entità sarà sicuramente _Studenti_ identificato unicamente dal campo matricola e da altri
attributi come il nome, il cgnome e il sesso. Lo stundete studierà (come da consegna) in un solo istituto
quindi vigerà una relzione di tipo N:1, inoltre lo studente frequenterà uno o più corsi quindi ci sarà una
cardinalità di tipo N:N, abbiamo considerato nel fare le query che uno studente se presente nel database e di conseguenza iscritto non potra non partecipare ad alcun corso. </br>
La seconda entità trovata è quella _Istituti_ caratterrizata in modo univoco da un Id e da alcuni attributi
come l'indirizzo e il numero di telefono. l'istuituto oltre che essere collegato a stundenti come detto in precenza sarà collegato a insegnati in quanto in un istituto lavorano più inseganti (cardinalità 1:N). </br>
L'entità individuata successivamente è l'entità _Docenti_, essi saranno indivduati in modo univoco da una matricola e avranno come attributi in nome e il cognome (non abbiamo reputato necessario, per le richieste che ci sono state fatte, aggiungere ulteriori campi che sarebbero risultati superflui). I docenti saranno collegati alla tabella Istituti come illustato in precendeza e gli stessi docenti terranno un corso quindi saranno collegti tramite relazione 1:N a corsi (Abbiamo pensato che ci possano esere corsi uguali ma insegnait da docenti diffrenti).  </br>
L'ultima entità individuata è l'entità _Corsi_ che avrà come attributo univoco IdCorso e avrà come attributo il campo descrizione. </br>

In seguito all'analisi abbiamo creato il modello ER e il modello logico. 


## ERD

![E/R](https://github.com/taglioIsCoding/MySqlScripts/blob/master/school/ER.png)


## Logic Model

_PrimaryKEY_</br>
*ForeignKEY*</br>

* Istituto (_IdIstituto_, NomeI, Citta, Via, NumCivico, Numtelelefono)
* Studenti (_Matricola_, NomeS, CognomeS, NumTelefono, Sesso, *IdIstituto*)
* Docenti (_MatricolaD_, NomeD, CognomeD,  *IdIstituto*, *IdCorso*)
* Corsi (_IdCorso_, Descrizione)
* Frequentare (*_IdCorso_*, *_MatricolaD_*)


## Contributes
* Analisi: Tutti </br>
* ERD: Tagliani, Busi </br>
* SQL:  Botti</br>
* Query: Busi, Cavagnini, Boldrini