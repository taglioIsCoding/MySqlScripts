# Where is that piece of art?

## Analisi

La realtà presentata mi è sembrata subito chiara e ho cominciato ad individuare le entità presenti. </br>
Per questo database ho cercato di lavorare in terza forma normale. </br>


### E/R Model

![E/R](https://github.com/taglioIsCoding/MySqlScripts/blob/master/Art/ER.png)

### Logic model

Nazionalità (*ID_Nazione*, Stato)</br>
Musei (*ID_Museo*, NomeMuseo, Città)</br>
Protagonisti (*ID_Protagonista*, Descrizione) </br>
Artisti (*ID_artisti*, Nome, Cognome, DataNascita, DataMorte, _ID_Nazione_) </br>
Opere (*ID_Opera*, Titolo, Anno, _ID_Opera_, _ID_Museo_, _ID_Protagonista_) </br>



