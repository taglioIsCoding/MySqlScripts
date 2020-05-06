create database TuttoBene;

CREATE TABLE Categorie
(
  ID_Categoria INT AUTO_INCREMENT,
  Descrizione VARCHAR(20) ,
  PRIMARY KEY (ID_Categoria)
);

CREATE TABLE Utenti
(
  CodFiscale CHAR(16),
  Città INT,
  Via INT,
  N_civico INT,
  PRIMARY KEY (CodFiscale)
);

CREATE TABLE Luoghi
(
  ID_luogo INT AUTO_INCREMENT,
  Nome VARCHAR(20),
  Città VARCHAR(30),
  Via VARCHAR(20),
  N_civico INT,
  ID_Categoria INT,
  PRIMARY KEY (ID_luogo),
  FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria)
);

CREATE TABLE Recare
(
  Data DATE,
  Ora TIME,
  ID_luogo INT,
  CodFiscale CHAR(16),
  PRIMARY KEY (ID_luogo, CodFiscale),
  FOREIGN KEY (ID_luogo) REFERENCES Luogo(ID_luogo),
  FOREIGN KEY (CodFiscale) REFERENCES Utente(CodFiscale)
);

INSERT INTO Categorie('Descrizione') VALUES ("Farmacia");
INSERT INTO Categorie('Descrizione') VALUES ("Supermercato");

INSERT INTO Utenti('CodFiscale', 'Citta', 'Via', 'N_civico') VALUES ('TGLPSR23G43D234Z','Brescia','Corsica','102');
INSERT INTO Utenti('CodFiscale', 'Citta', 'Via', 'N_civico') VALUES ('AAABBB45Z66B186A','Brescia','Milano','10');
INSERT INTO Utenti('CodFiscale', 'Citta', 'Via', 'N_civico') VALUES ('BBBCCC98V32B355S','Brescia','Bella','12');
INSERT INTO Utenti('CodFiscale', 'Citta', 'Via', 'N_civico') VALUES ('VVVZZZ45H77B367Q','Brescia','Sardegna','112');

