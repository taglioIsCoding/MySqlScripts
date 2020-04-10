CREATE DATABASE OpereMusei;

CREATE TABLE Musei
(
  ID_Museo INT,
  NomeMuseo VARCHAR(10),
  Città VARCHAR(25),
  PRIMARY KEY (ID_Museo)
);

CREATE TABLE Nazionalita
(
  ID_Nazione INT,
  Stato VARCHAR(25),
  PRIMARY KEY (ID_Nazione)
);

CREATE TABLE Protagonisti
(
  ID_Protagonista INT,
  Descrizione VARCHAR(30),
  PRIMARY KEY (ID_Protagonista)
);

CREATE TABLE Artisti
(
  ID_artista INT,
  Nome VARCHAR(15),
  Cognome VARCHAR(15),
  DataNascita DATE,
  DataMorte DATE,
  ID_Nazione INT,
  PRIMARY KEY (ID_artista),
  FOREIGN KEY (ID_Nazione) REFERENCES Nazionalita(ID_Nazione)
);

CREATE TABLE Opere
(
  ID_Opera INT,
  Titolo VARCHAR(20),
  Anno INT,
  ID_artista INT,
  ID_Museo INT,
  ID_Protagonista INT ,
  PRIMARY KEY (ID_Opera),
  FOREIGN KEY (ID_artista) REFERENCES Artisti(ID_artista),
  FOREIGN KEY (ID_Museo) REFERENCES Musei(ID_Museo),
  FOREIGN KEY (ID_Protagonista) REFERENCES Protagonisti(ID_Protagonista)
);



INSERT INTO `Musei`(`ID_Museo`, `nomeMuseo`, `città`) VALUES (1 ,"Uffizzi", "Firenze");
INSERT INTO `Musei`(`ID_Museo`, `nomeMuseo`, `città`) VALUES (2 ,"PalPitti", "Firenze");
INSERT INTO `Musei`(`ID_Museo`, `nomeMuseo`, `città`) VALUES (3 ,"El Prado", "Madrid");
INSERT INTO `Musei`(`ID_Museo`, `nomeMuseo`, `città`) VALUES (4 ,"NationalG", "Londra");
INSERT INTO `Musei`(`ID_Museo`, `nomeMuseo`, `città`) VALUES (5 ,"Louvre", "Parigi");

INSERT INTO `Nazionalita`(`ID_Nazione`, `Stato`) VALUES (1,"Italia");
INSERT INTO `Nazionalita`(`ID_Nazione`, `Stato`) VALUES (2,"Spagna");
INSERT INTO `Nazionalita`(`ID_Nazione`, `Stato`) VALUES (3,"UK");

INSERT INTO `Protagonisti`(`ID_Protagonista`, `Descrizione`) VALUES (1,"Madonna");
INSERT INTO `Protagonisti`(`ID_Protagonista`, `Descrizione`) VALUES (2,"Gesù e San Giovannino");
INSERT INTO `Protagonisti`(`ID_Protagonista`, `Descrizione`) VALUES (3,"la Madonna e Giovanni Battista");
INSERT INTO `Protagonisti`(`ID_Protagonista`, `Descrizione`) VALUES (4,"San Giovanni");
INSERT INTO `Protagonisti`(`ID_Protagonista`, `Descrizione`) VALUES (5,"Michael Jackson");
INSERT INTO `Protagonisti`(`ID_Protagonista`, `Descrizione`) VALUES (6,"Gioconda");

INSERT INTO `Artisti`(`ID_Artista`, `nome`, `cognome`, `dataNascita`, `dataMorte`, `ID_Nazione`) VALUES (1,"Pablo", "Picasso", 18891211, 19300401, 2);
INSERT INTO `Artisti`(`ID_Artista`, `nome`, `cognome`, `dataNascita`, `dataMorte`, `ID_Nazione`) VALUES (2,"Tiziano", "Vecellio", 14901011, 15760827, 1);
INSERT INTO `Artisti`(`ID_Artista`, `nome`, `cognome`, `dataNascita`, `dataMorte`, `ID_Nazione`) VALUES (3,"Sandro", "Botticelli", 18891211, 19300401, 1);
INSERT INTO `Artisti`(`ID_Artista`, `nome`, `cognome`, `dataNascita`, `dataMorte`, `ID_Nazione`) VALUES (4,"Leonardo", "Da Vinci", 18891211, 19300401, 1);
INSERT INTO `Artisti`(`ID_Artista`, `nome`, `cognome`, `dataNascita`, `dataMorte`, `ID_Nazione`) VALUES (5,"Raffaello", "Sanzio", 14450301, 15100517, 3);

INSERT INTO `Opere`(`ID_Opera`, `Titolo`, `Anno`, `ID_artista`, `ID_Museo`, `ID_Protagonista`) VALUES (1,"Guernica", 1910, 1, 3, 5);
INSERT INTO `Opere`(`ID_Opera`, `Titolo`, `Anno`, `ID_artista`, `ID_Museo`, `ID_Protagonista`) VALUES (2,"Gesu Bambino", 1355, 2, 1, 2);
INSERT INTO `Opere`(`ID_Opera`, `Titolo`, `Anno`, `ID_artista`, `ID_Museo`, `ID_Protagonista`) VALUES (3,"Madre", 1221, 2, 3, 3);
INSERT INTO `Opere`(`ID_Opera`, `Titolo`, `Anno`, `ID_artista`, `ID_Museo`, `ID_Protagonista`) VALUES (4,"Amanti", 1456, 3, 2, 5);
INSERT INTO `Opere`(`ID_Opera`, `Titolo`, `Anno`, `ID_artista`, `ID_Museo`, `ID_Protagonista`) VALUES (5,"Gioconda", 1501, 4, 5, 6);
INSERT INTO `Opere`(`ID_Opera`, `Titolo`, `Anno`, `ID_artista`, `ID_Museo`, `ID_Protagonista`) VALUES (6,"La vergine", 1476, 4, 5, 1);
INSERT INTO `Opere`(`ID_Opera`, `Titolo`, `Anno`, `ID_artista`, `ID_Museo`, `ID_Protagonista`) VALUES (7,"POP", 1478, 5, 4, 4);
INSERT INTO `Opere`(`ID_Opera`, `Titolo`, `Anno`, `ID_artista`, `ID_Museo`, `ID_Protagonista`) VALUES (8,"Venere", 1355, 3, 1, 1);
INSERT INTO `Opere`(`ID_Opera`, `Titolo`, `Anno`, `ID_artista`, `ID_Museo`, `ID_Protagonista`) VALUES (9,"Uomo", 1236, 4, 4, 6);
INSERT INTO `Opere`(`ID_Opera`, `Titolo`, `Anno`, `ID_artista`, `ID_Museo`, `ID_Protagonista`) VALUES (10,"Maddoninna", 1354, 2, 4, 4);
INSERT INTO `Opere`(`ID_Opera`, `Titolo`, `Anno`, `ID_artista`, `ID_Museo`, `ID_Protagonista`) VALUES (11,"Guernica2", 1913, 1, 2, 6);
INSERT INTO `Opere`(`ID_Opera`, `Titolo`, `Anno`, `ID_artista`, `ID_Museo`, `ID_Protagonista`) VALUES (12,"BellaCiao", 1111, 3, 4, 1);
INSERT INTO `Opere`(`ID_Opera`, `Titolo`, `Anno`, `ID_artista`, `ID_Museo`, `ID_Protagonista`) VALUES (13,"Paella", 1234, 1, 4, 3);
INSERT INTO `Opere`(`ID_Opera`, `Titolo`, `Anno`, `ID_artista`, `ID_Museo`, `ID_Protagonista`) VALUES (14,"Signore", 1455, 5, 4, 3);
INSERT INTO `Opere`(`ID_Opera`, `Titolo`, `Anno`, `ID_artista`, `ID_Museo`, `ID_Protagonista`) VALUES (15,"Signore2", 1455, 5, 4, 2);
INSERT INTO `Opere`(`ID_Opera`, `Titolo`, `Anno`, `ID_artista`, `ID_Museo`, `ID_Protagonista`) VALUES (16,"S.Giovanni", 3058, 1, 3, 5);
INSERT INTO `Opere`(`ID_Opera`, `Titolo`, `Anno`, `ID_artista`, `ID_Museo`, `ID_Protagonista`) VALUES (17,"S.John", 3057, 1, 3, 4);


/*QUERY*/
/*1*/Select Opera.Titolo 
        from (Artisti join Opere on Artisti.ID_Artista = Opere.ID_Artista)
            join Musei on Opere.ID_Museo = Musei.ID_Museo
                Where Artisti.nome = "Tiziano"
                and Musei.nomeMuseo = "El Prado"

/*2*/Select Artisti.nome, Artisti.cognome, Opere.Titolo
        from (Artisti join Opere on Artisti.ID_Artista = Opere.ID_Artista)
            join Musei on Opere.ID_Museo = Musei.ID_Museo
                Where Musei.nomeMuseo = "Uffizzi"

/*3*/Select Artisti.nome, Artisti.cognome, Opere.Titolo
        from (Artisti join Opere on Artisti.ID_Artista = Opere.ID_Artista)
            join Musei on Opere.ID_Museo = Musei.ID_Museo
                Where Musei.Città = "Firenze"

/*4*/Select Opere.Titolo, Musei.Città
        from (Artisti join Opere on Artisti.ID_Artista = Opere.ID_Artista)
            join Musei on Opere.ID_Museo = Musei.ID_Museo
                Where Artisti.nome = "Leonardo"

/*5*/Select Opere.Titolo
        from (Artisti join Opere on Artisti.ID_Artista = Opere.ID_Artista)
            join Musei on Opere.ID_Museo = Musei.ID_Museo
                Where Artisti.nome = "Tiziano"
                and Musei.città = "Londra"

/*6*/Select Artisti.nome, Artisti.cognome, Opere.Titolo
        from ((Artisti join Opere on Artisti.ID_Artista = Opere.ID_Artista)
            join Musei on Opere.ID_Museo = Musei.ID_Museo)
            join Nazionalita on Artisti.ID_Nazione = Nazionalita.ID_Nazione
                Where Musei.Città = "Firenze"
                and Nazionalita.Stato = "Spagna"

/*7*/Select Artisti.nome, Artisti.cognome, Opere.Titolo
        from (((Artisti join Opere on Artisti.ID_Artista = Opere.ID_Artista)
            join Musei on Opere.ID_Museo = Musei.ID_Museo)
            join Nazionalita on Artisti.ID_Nazione = Nazionalita.ID_Nazione)
            join Protagonisti on Opere.ID_Protagonista = Protagonisti.ID_Protagonista
                Where Musei.Città = "Londra"
                and Nazionalita.Stato = "Italia"
                and Protagonisti.Descrizione = "Madonna"

/*8*/Select Musei.nomeMuseo
        from ((Artisti join Opere on Artisti.ID_Artista = Opere.ID_Artista)
            join Musei on Opere.ID_Museo = Musei.ID_Museo)
                Where Musei.Città = "Londra"
                and Artisti.cognome = "Picasso"

/*9*/Select Artisti.nome, Artisti.cognome, Opere.Titolo
        from ((Artisti join Opere on Artisti.ID_Artista = Opere.ID_Artista)
            join Musei on Opere.ID_Museo = Musei.ID_Museo)
            join Protagonisti on Opere.ID_Protagonista = Protagonisti.ID_Protagonista
                Where Protagonisti.Descrizione = "Gesù e San Giovannino"

/*10*/Select distinct Artisti.nome, Artisti.cognome
        from ((Artisti join Opere on Artisti.ID_Artista = Opere.ID_Artista)
            join Musei on Opere.ID_Museo = Musei.ID_Museo)
            join Protagonisti on Opere.ID_Protagonista = Protagonisti.ID_Protagonista
                Where Protagonisti.Descrizione = "Gesù e San Giovannino"

/*11*/Select Opere.Titolo, Artisti.nome, Artisti.cognome
        from ((Artisti join Opere on Artisti.ID_Artista = Opere.ID_Artista)
            join Musei on Opere.ID_Museo = Musei.ID_Museo)
            join Protagonisti on Opere.ID_Protagonista = Protagonisti.ID_Protagonista
                Where Protagonisti.Descrizione = "Gesù e San Giovannino" 
                Or Protagonisti.Descrizione = "la Madonna e Giovanni Battista"

/*12*/Select Opere.Titolo, Artisti.nome, Artisti.cognome
        from ((Artisti join Opere on Artisti.ID_Artista = Opere.ID_Artista)
            join Musei on Opere.ID_Museo = Musei.ID_Museo)
            join Protagonisti on Opere.ID_Protagonista = Protagonisti.ID_Protagonista
                Where Protagonisti.Descrizione = "San Giovanni"
                and Musei.nomeMuseo = "el Prado"