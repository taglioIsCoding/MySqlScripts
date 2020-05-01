CREATE DATABASE Fisi;

CREATE TABLE Nazionale
(
  ID_Nazione INT,
  Nazione VARCHAR(30),
  PRIMARY KEY (ID_Nazione)
);

CREATE TABLE Gara
(
  ID_Gara INT,
  DataGara DATE,
  Nome VARCHAR(30),
  PrimoPremio INT,
  Citta VARCHAR(30),
  Latitudine VARCHAR(7),
  Longitudine VARCHAR(7),
  ID_Nazione INT,
  PRIMARY KEY (ID_Gara),
  FOREIGN KEY (ID_Nazione) REFERENCES Nazionale(ID_Nazione)
);

CREATE TABLE Trick
(
  ID_Trick INT,
  Nome VARCHAR(30),
  Rotazione CHAR(2),
  PRIMARY KEY (ID_Trick)
);

CREATE TABLE Rider
(
  ID_Rider INT,
  Nome VARCHAR(20),
  Cognome VARCHAR(20),
  Sesso BOOLEAN,
  Stance VARCHAR(6),
  DataNascita DATE,
  ID_Nazione INT,
  PRIMARY KEY (ID_Rider),
  FOREIGN KEY (ID_Nazione) REFERENCES Nazionale(ID_Nazione)
);

CREATE TABLE Run
(
  ID_Run INT AUTO_INCREMENT,
  Voto INT,
  ID_Gara INT,
  ID_Rider INT,
  ID_Trick INT,
  PRIMARY KEY (ID_Run),
  FOREIGN KEY (ID_Gara) REFERENCES Gara(ID_Gara),
  FOREIGN KEY (ID_Rider) REFERENCES Rider(ID_Rider),
  FOREIGN KEY (ID_Trick) REFERENCES Trick(ID_Trick)
);

CREATE TABLE Partcipare
(
  Vincitore CHAR,
  ID_Rider INT,
  ID_Gara INT,
  PRIMARY KEY (ID_Rider, ID_Gara),
  FOREIGN KEY (ID_Rider) REFERENCES Rider(ID_Rider),
  FOREIGN KEY (ID_Gara) REFERENCES Gara(ID_Gara)
);

/*POPOLAZIONE*/

INSERT INTO Nazionale(ID_Nazione, Nazione) VALUES (1, "Italia"); 
INSERT INTO Nazionale(ID_Nazione, Nazione) VALUES (2, "Usa");
INSERT INTO Nazionale(ID_Nazione, Nazione) VALUES (3, "Canada"); 
INSERT INTO Nazionale(ID_Nazione, Nazione) VALUES (4, "Belgio"); 
INSERT INTO Nazionale(ID_Nazione, Nazione) VALUES (5, "Norvegia"); 

INSERT INTO Gara(ID_Gara, DataGara, Nome, PrimoPremio, Citta, Latitudine, Longitudine, ID_Nazione) VALUES (1, 2020-1-13, "BigAir", 10000, "Modena", "44.6568" ,"10.9202" ,1); 
INSERT INTO Gara(ID_Gara, DataGara, Nome, PrimoPremio, Citta, Latitudine, Longitudine, ID_Nazione) VALUES (2, 2020-2-15, "Canada Champ", 13400, "Montreal", "45.5088" ,"-73.561" ,3); 
INSERT INTO Gara(ID_Gara, DataGara, Nome, PrimoPremio, Citta, Latitudine, Longitudine, ID_Nazione) VALUES (3, 2020-3-16, "Belgium Open", 3455, "Bruxelles", "50.8504" ,"4.34878" ,4); 
INSERT INTO Gara(ID_Gara, DataGara, Nome, PrimoPremio, Citta, Latitudine, Longitudine, ID_Nazione) VALUES (4, 2020-4-20, "US Open", 22000, "Aspen", "39.1910" ,"-106.817" ,2); 
INSERT INTO Gara(ID_Gara, DataGara, Nome, PrimoPremio, Citta, Latitudine, Longitudine, ID_Nazione) VALUES (5, 2020-5-12, "X games", 3500, "Oslo", "59.9127" ,"10.7460" ,5); 
INSERT INTO Gara(ID_Gara, DataGara, Nome, PrimoPremio, Citta, Latitudine, Longitudine, ID_Nazione) VALUES (6, 2020-6-10, "BigAir2", 10000, "Palo Alto", "37.4683" ,"-122.14" ,2); 

INSERT INTO Trick(ID_Trick, Nome, Rotazione) VALUES (1, "Ollie", null); 
INSERT INTO Trick(ID_Trick, Nome, Rotazione) VALUES (2, "1440", "FS"); 
INSERT INTO Trick(ID_Trick, Nome, Rotazione) VALUES (3, "1440", "BS"); 
INSERT INTO Trick(ID_Trick, Nome, Rotazione) VALUES (4, "Cork", "FS"); 
INSERT INTO Trick(ID_Trick, Nome, Rotazione) VALUES (5, "Double Cork", "FS"); 
INSERT INTO Trick(ID_Trick, Nome, Rotazione) VALUES (6, "Triple Cork", "FS"); 
INSERT INTO Trick(ID_Trick, Nome, Rotazione) VALUES (7, "Quad Cork", "FS"); 
INSERT INTO Trick(ID_Trick, Nome, Rotazione) VALUES (8, "Blody dracula", null); 
INSERT INTO Trick(ID_Trick, Nome, Rotazione) VALUES (9, "Back Flip", null); 
INSERT INTO Trick(ID_Trick, Nome, Rotazione) VALUES (10, "Front Flip", null); 
INSERT INTO Trick(ID_Trick, Nome, Rotazione) VALUES (11, "McTwist", null); 
INSERT INTO Trick(ID_Trick, Nome, Rotazione) VALUES (12, "Rodeo", "FS"); 
INSERT INTO Trick(ID_Trick, Nome, Rotazione) VALUES (13, "Michalchuk", "FS"); 
INSERT INTO Trick(ID_Trick, Nome, Rotazione) VALUES (14, "Michalchuk", "BS"); 
INSERT INTO Trick(ID_Trick, Nome, Rotazione) VALUES (15, "Cork", "BS"); 
INSERT INTO Trick(ID_Trick, Nome, Rotazione) VALUES (16 "Double Cork", "BS"); 
INSERT INTO Trick(ID_Trick, Nome, Rotazione) VALUES (17, "Triple Cork", "BS"); 
INSERT INTO Trick(ID_Trick, Nome, Rotazione) VALUES (18, "Quad Cork", "BS"); 
INSERT INTO Trick(ID_Trick, Nome, Rotazione) VALUES (19, "Rodeo", "BS"); 

INSERT INTO Rider(ID_Rider, Nome, Cognome, Sesso, Stance, DataNascita, ID_Nazione) VALUES (1, "Mark", "McMorris", true, "Regular", 1993-12-9 , 3); 
INSERT INTO Rider(ID_Rider, Nome, Cognome, Sesso, Stance, DataNascita, ID_Nazione) VALUES (2, "Max", "Parrot", true, "Regular", 1993-12-9 , 3); 
INSERT INTO Rider(ID_Rider, Nome, Cognome, Sesso, Stance, DataNascita, ID_Nazione) VALUES (3, "Red", "Gerard", true, "Goofy", 1993-12-9 , 2); 
INSERT INTO Rider(ID_Rider, Nome, Cognome, Sesso, Stance, DataNascita, ID_Nazione) VALUES (4, "Alberto", "Maffei", true, "Regular", 1993-12-9 , 1); 
INSERT INTO Rider(ID_Rider, Nome, Cognome, Sesso, Stance, DataNascita, ID_Nazione) VALUES (5, "Seppe", "Smith", true, "Goofy", 1993-12-9 , 4); 
INSERT INTO Rider(ID_Rider, Nome, Cognome, Sesso, Stance, DataNascita, ID_Nazione) VALUES (6, "Chris", "Corning", true, "Goofy", 1993-12-9 , 2); 
INSERT INTO Rider(ID_Rider, Nome, Cognome, Sesso, Stance, DataNascita, ID_Nazione) VALUES (7, "Eero", "Ettala", true, "Regular", 1993-12-9 , 5); 
INSERT INTO Rider(ID_Rider, Nome, Cognome, Sesso, Stance, DataNascita, ID_Nazione) VALUES (8, "Marcus", "Kleveland", true, "Regular", 1993-12-9 , 5); 
INSERT INTO Rider(ID_Rider, Nome, Cognome, Sesso, Stance, DataNascita, ID_Nazione) VALUES (9, "Roberto", "Bragotto", true, "Goofy", 1993-12-9 , 1); 
INSERT INTO Rider(ID_Rider, Nome, Cognome, Sesso, Stance, DataNascita, ID_Nazione) VALUES (10, "Vlad", "Hakink", true, "Regular", 1993-12-9 , 5); 

INSERT INTO Partcipare(ID_Gara, ID_Rider, Vincitore) VALUES (1, 1, "Y"); 
INSERT INTO Partcipare(ID_Gara, ID_Rider, Vincitore) VALUES (1, 3, "N"); 
INSERT INTO Partcipare(ID_Gara, ID_Rider, Vincitore) VALUES (1, 5, "N"); 
INSERT INTO Partcipare(ID_Gara, ID_Rider, Vincitore) VALUES (1, 7, "N"); 
INSERT INTO Partcipare(ID_Gara, ID_Rider, Vincitore) VALUES (1, 9, "N"); 
INSERT INTO Partcipare(ID_Gara, ID_Rider, Vincitore) VALUES (1, 10, "N"); 

INSERT INTO Partcipare(ID_Gara, ID_Rider, Vincitore) VALUES (2, 2, "Y"); 
INSERT INTO Partcipare(ID_Gara, ID_Rider, Vincitore) VALUES (2, 4, "N"); 
INSERT INTO Partcipare(ID_Gara, ID_Rider, Vincitore) VALUES (2, 6, "N"); 
INSERT INTO Partcipare(ID_Gara, ID_Rider, Vincitore) VALUES (2, 8, "N"); 
INSERT INTO Partcipare(ID_Gara, ID_Rider, Vincitore) VALUES (2, 10, "N"); 
INSERT INTO Partcipare(ID_Gara, ID_Rider, Vincitore) VALUES (2, 3, "N"); 

INSERT INTO Partcipare(ID_Gara, ID_Rider, Vincitore) VALUES (3, 1, "Y"); 
INSERT INTO Partcipare(ID_Gara, ID_Rider, Vincitore) VALUES (3, 2, "N"); 
INSERT INTO Partcipare(ID_Gara, ID_Rider, Vincitore) VALUES (3, 3, "N"); 
INSERT INTO Partcipare(ID_Gara, ID_Rider, Vincitore) VALUES (3, 4, "N"); 
INSERT INTO Partcipare(ID_Gara, ID_Rider, Vincitore) VALUES (3, 5, "N"); 
INSERT INTO Partcipare(ID_Gara, ID_Rider, Vincitore) VALUES (3, 6, "N"); 

INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (1, 1, 9); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (1, 1, 13); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (1, 1, 17); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (1, 3, 7); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (1, 3, 2); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (1, 3, 12); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (1, 5, 1); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (1, 5, 8); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (1, 5, 15); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (1, 7, 3); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (1, 7, 9); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (1, 7, 19); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (1, 9, 7); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (1, 9, 8); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (1, 9, 9); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (1, 10, 12); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (1, 10, 15); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (1, 10, 14); 

INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (2, 2, 9); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (2, 2, 13); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (2, 2, 17); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (2, 4, 7); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (2, 4, 2); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (2, 4, 12); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (2, 6, 1); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (2, 6, 8); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (2, 6, 15); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (2, 8, 3); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (2, 8, 9); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (2, 8, 19); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (2, 3, 7); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (2, 3, 8); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (2, 3, 9); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (2, 10, 12); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (2, 10, 15); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (2, 10, 14); 

INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (3, 1, 9); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (3, 1, 13); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (3, 1, 17); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (3, 2, 7); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (3, 2, 2); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (3, 2, 12); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (3, 3, 1); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (3, 3, 8); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (3, 3, 15); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (3, 4, 3); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (3, 4, 9); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (3, 4, 19); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (3, 5, 7); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (3, 5, 8); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (3, 5, 9); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (3, 6, 12); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (3, 6, 15); 
INSERT INTO Run(ID_Gara, ID_Rider, ID_Trick) VALUES (3, 6, 14); 
