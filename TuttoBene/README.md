# Tutto bene

## Breve Analisi
agiungero qui riflessioni o spiegazioni di particolari campi che ho voluto creare.
* Ho distaccato la tabella Categoria per questioni di normalizzazione
* Ho scelto come primary key di Utenti il codice fiscale in modo che il sistema possa interfacciarsi con gli scanner che la comessa prevedeva, inoltre permettono di risparmiare molta memoria.
* Ho scelto di registrare meno dati possibili per gli utenti perche ritengo una violazione della privacy registrare gli spostamenti delle persone oltre a trattare grandi moli dei loro dati personali. 

### ER - Diagram

![E/R](https://github.com/taglioIsCoding/MySqlScripts/blob/master/TuttoBene/ER.png)

### Logic model

Categoria(**ID_Categoria**, Descrizione); <br>
Utenti (**CodFiscale**,Città, Via, N_civico); <br>
Luoghi (**ID_Luogo**, Nome, Città, Via, N_civico, *ID_Categoria*); <br>
Recare (***ID_Luogo***, ***CodFiscale***, Data, OraIngresso, OraUscita); <br>