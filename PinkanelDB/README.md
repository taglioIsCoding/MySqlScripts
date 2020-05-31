# My final test project based on the PCTO experience

In this project I would like to modify and upgrade my PCTO projetc with some new tasks

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

Ho utilizzato il toolkit open source Grafana per creare una dashboard interattiva che potesse andare a mostrare alcuni dei principali dati raccolti dal sistema. Grafana permette inoltre di creare un server che puo essere utilizzato per richiedere i dati del database, questo apre alla possibilità di creare in futuro nuove  e differenti applicazioni.

![DashBoard](https://github.com/taglioIsCoding/MySqlScripts/blob/master/PinkanelDB/Dashboard.png)

Query per trovare i  giocatori più vittoriosi
```SQL
    Select COUNT(Play.ID_Player1), Player.Name
        from (Games Join Play on Games.ID_Game = Play.ID_Game) 
            join Player on Player.ID_Player = Play.ID_Player1
                Group by Play.ID_Player1
```
Query di inserimento di dati all'interno del database 
```SQL
    INSERT INTO Dots( X, Y, T, ID_Game) VALUES (10, 3, '2020/05/29 11:10:12.123456',1); /*Come la farà il programma*/
    INSERT INTO Dots( X, Y, T, ID_Game) VALUES (FLOOR(0 + RAND() * 600),FLOOR(0 + RAND() * 300), '2020/05/29 11:10:12.426488',1); /*Come l'ho fatta io per i test*/
```


### VPN

Pe ora durante tutti i nostri test il database risiedeva in locale, sulla stessa macchina che elaborava l'intero programma. Questa soluzione puo andare bene per una serie di test ma nel momento in cui vogliamo creare affinare il progetto dobbiamo tener conto dell'enorme quantità di dati che la macchina si trova a gestire 4 thred per processare circa 200 frame per secondo. La soluzione migliore che mi sento di proporre è quella di distribuire il sistema portando il nostro database su un server esterno o ancora meglio sul cloud. Fatta questa scelta il problema che c'è da porsi è quello sulla sicurezza e sull'integrita dei dati che andiamo a trasmettere su una rete non sicura come internet. Per permettere tutto ciò ho pensato di implementare una VPN che lavorasse in trasport mode e secondo il protocollo ESP (per garantire anche la confidenzialità dei dati trasmessi cosa che non succede se si utilizza il protocollo AH), scegliere di lavorare in transport mode permette al nostro pincanello IOT di essere trasportato in caso di dimostrazioni o eventi senza doversi preoccupare ogni volta della rete che si sta andando ad utilizzare.

### JDBC 

Il programma per la lettura, l'organizzazione e la presentazione dei dati relativi ad una singola partita è stat scritta in java e in quanto tale per connetterci al nostro Database Mysql abbiamo utilizzato un JDBC. Un JDBC non è altro che un driver menager che fa da ponte tra il nostro programma Java e appunto il databse. Il suo funzionamento non è condizionato dal fatto che il databse sia remoto e tutto cio lo rende la soluzione ottimale per le nostre esigenze. 

Ho qui riportato come il programma si connettesse al databse 

```java
    String driver = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://127.0.0.1:3306/pinkadb?useLegacyDatetimeCode=false&serverTimezone=Europe/Amsterdam&useSSL=false&useFractionalSeconds=true";
    String username = "root";
    String password = "toor";
    Class.forName(driver);
    conn = (Connection) DriverManager.getConnection(url, username, password);
```
E qui come faceva ad inserie il punto in cui riconosceva la pallina 

```java
    String query = " insert into dataBank (game_id, X, Y, time)" + " values (?, ?, ?, ?)";
		
    java.sql.PreparedStatement preparedStmt = conn.prepareStatement(query);
    
    preparedStmt.setInt (1, Constants.GAME_ID);
    preparedStmt.setInt(2, x);
    preparedStmt.setInt(3, y);
    preparedStmt.setTimestamp(4, AMG);

    //execute the prepared statement
    preparedStmt.execute();
```

### TO DO:


### DONE:
* Re-Analyze the problem (data types)
* New ER diagram
* New Logic model 
* True SQL implementation
* Create a dashboard (Grafana??)
* Analyze the possibility of implement a VPN comunication
* Analize how we used JDBC
