# Tutto bene

## Breve Analisi
agiungero qui riflessioni o spiegazioni di particolari campi che ho voluto creare.
* Ho distaccato la tabella Categoria per questioni di normalizzazione
* Ho scelto come primary key di Utenti il codice fiscale in modo che il sistema possa interfacciarsi con gli scanner che la comessa prevedeva, inoltre permettono di risparmiare molta memoria.

### ER - Diagram

![E/R](https://github.com/taglioIsCoding/MySqlScripts/blob/master/TuttoBene/ER.png)

### Logic model

Categoria(**ID_Categoria**, Descrizione);
Utenti (**CodFiscale**,Città, Via, N_civico);
Luoghi (**ID_Luogo**, Nome, Città, Via, N_civico, *ID_Categoria*);
Recare (***ID_Luogo***, ***CodFiscale***, Data, Ora);