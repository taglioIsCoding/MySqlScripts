# Analisi es Bottari
### Agenzia di Pubblicazioni

Il problema presentato si rifersce a un'agenzia di pubblicaszioni.
La seguente agenzia richiede che delle varie pubblicazioni ne venga registrato il tipo
e le edicole presenti nelle varie province in cui essa opera.
* Le pubblicazioni verrano identificate da un codice univoco mentre come attributi
avranno: il titolo di tipo varchar, il nome dell'editore anch'esso di tipo varchar,
e il tipo di pubblicazioni che ritengo possa diventare un ulteriore tabella per
questioni di normalizzazione ritengo inoltre che non sia utile creare una tabella
editore (anche se previsto per la normalizzazione).
* Nella tabella tipoPubblicazione le diverse pubblicazioni verrano distinte le
une dalle altre tramite un id univoco di tipo int, e avranno come attributo la
periodicita di consegna espressa in numero di giorni.
* Le diverse pubblicazioni verranno consegnate a alcune edicole che verranno
identificate ench'esse da un codice univoco di tipo int, il nome dell'edicola
stessa e un codice che ne identifica la provincia.
* Ogni provincia verra identificata da un codice univoco e da il proprio nome.
* Le pubblicazioni saranno poste in relazione con le edicole tramite la tabella
Spedizione che avrà come attributi il numero di copie consegnate o rese di ogni
edicola e la data in cui è avvenuta l'operazione, ritengo che le consegne vengano
effettuate una sola volta al giorno.

Di seguito riporto il modello logico e il modello E/R che utilizzero per
sviluppare il database.

#### E/R Model
![E/R](./E_R.png)

#### Logic Model
Pubblicazioni(**idPubb**, titolo, nomeEditore, _tipo_)
tipoPubblicazione(**idTipo**, nomeTipo, periodicitaConsegna, descrizione)
Edicole(**idEdicola**, nomeEdicola, _codProvincia_)
Province(**idProv**, nomeProvincia)
Spedizione(_**idPubb**_, _**idEdicola**_, numConsegnati, numResi, **dataOperazione**)
