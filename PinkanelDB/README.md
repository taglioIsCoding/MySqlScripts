# My final test project based on the PCTO experience

In this project I would like to modify and upgrade my PCTO projetc with some new tasks

### TO DO:
* Analyze the possibility of implement a VPN comunication
* Analize how the use JDBC


### DONE:
* Re-Analyze the problem (data types)
* New ER diagram
* New Logic model 
* True SQL implementation
* Create a dashboard (Grafana??)

### Analyze the problem

La prima entità che ho trovato all'interno del problema proposto è l'entita User.
Nella tabella user verranno orgazzinati e salvati i dati di tutti gli utenti: ogni un utente sarà idenfcato
da un ID univoco, dal suo nome, il suo cognome (entrambi di tipo varchar).
Ho deciso di non aggiungere altre informazioni a proposito degli utenti perche non gli ritenevo utili al fine 
del progetto, rischiavo perciò di occupare solamente spazio all'interno del database.
La seconda entità che ho riscontrato è Games.
I Games sono tutte le partite che vengono giocate e di cui vogliamo tener traccia.
I record della tabella games vengono idenificate tramite un ID univoco, sono preseni poi 2 campi che rappresentano 
i punti segnati dai due giocatori durante la partita, visto l'inserimento automattizzato da parte del programma ho deciso di porre sempre come primo il valore del giocatore vincente, questo permetterà un più facile calcolo di alcuni paramentri tramite query.
Le due entità sopra presentate sono vicolate con una cardinalita N-N, perciò verrà a formasi la tabella Play.
L'ultima entita del database è l'entità Dots. L'entità dots rappresenta tutti i punti toccati dalla palllina durante una parita
che il programma riesce ad indivuduare tramite la libreria di computer vision OpenCV. Ogni punto verrà registrato tramite in ID univoco,
le sue coordinate cartesiane (X e Y) e l'istante in cui è stato individuato, ho utilizzato un timestamp(6) in modo di avere una sensibilità di 1ms.
Questa entità sarà legata all'entità Games tramite una relazione di cardinalità N-1 infatti ogni partita è formata
da una serie di punti. 


Di seguito verranno presentati modello ER e modello logico.

### ER 

![E/R](https://github.com/taglioIsCoding/MySqlScripts/blob/master/PinkanelDB/ER.png)

### Logic model

Player(**ID_Player**, Name, Surname); </br>
Games(**ID_Game**, Startime, Score1, Score2); </br>
Dots(**ID_Dot**, X, Y, T, *ID_Game*); </br>
Play(***ID_Game***, *Player1*, *Player2*); </br>

### Dashboard 

Ho utilizzato il toolkit Grafana per creare una dashboard interattiva che potesse andare a mostrare alcuni dei principali dati raccolti dal sistema. Grafana permette inoltre di creare un server che puo essere utilizzato per richiedere i dati del database, questo apre alla possibilità di creare in futuro nuove  e differenti applicazioni.

![DashBoard](https://github.com/taglioIsCoding/MySqlScripts/blob/master/PinkanelDB/Dashboard.png)
