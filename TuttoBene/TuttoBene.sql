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
  Città VARCHAR(30),
  Via VARCHAR(20),
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
  FOREIGN KEY (ID_Categoria) REFERENCES Categorie(ID_Categoria)
);

CREATE TABLE `Recare`(`CodFiscale`, `ID_luogo`, `Data`, `OraIngresso`, `OraUscita`)go INT,
  CodFiscale CHAR(16),
  PRIMARY KEY (ID_luogo, CodFiscale),
  FOREIGN KEY (ID_luogo) REFERENCES Luoghi(ID_luogo),
  FOREIGN KEY (CodFiscale) REFERENCES Utenti(CodFiscale)
);

INSERT INTO `Categorie`(`Descrizione`) VALUES ("Farmacia");
INSERT INTO `Categorie`(`Descrizione`) VALUES ("Supermercato");

INSERT INTO `Utenti`(`CodFiscale`, `Città`, `Via`, `N_civico`) VALUES ('TGLPSR23G43D234Z','Brescia','Corsica',102);
INSERT INTO `Utenti`(`CodFiscale`, `Città`, `Via`, `N_civico`) VALUES ('AAABBB45Z66B186A','Brescia','Milano',10);
INSERT INTO `Utenti`(`CodFiscale`, `Città`, `Via`, `N_civico`) VALUES ('BBBCCC98V32B355S','Brescia','Bella',12);
INSERT INTO `Utenti`(`CodFiscale`, `Città`, `Via`, `N_civico`) VALUES ('VVVZZZ45H77B367Q','Brescia','Sardegna',112);

INSERT INTO `Luoghi`(`Nome`, `Città`, `Via`, `N_civico`, `ID_Categoria`) VALUES ('Esselunga','Brescia','Volta',2, 2);
INSERT INTO `Luoghi`(`Nome`, `Città`, `Via`, `N_civico`, `ID_Categoria`)VALUES ('Coop','Brescia','Pilastroni', 12, 2);
INSERT INTO `Luoghi`(`Nome`, `Città`, `Via`, `N_civico`, `ID_Categoria`) VALUES ('Lidl','Brescia','Verona',33, 2);
INSERT INTO `Luoghi`(`Nome`, `Città`, `Via`, `N_civico`, `ID_Categoria`)VALUES ('Gori','Brescia','Ernerio',3, 1);

INSERT INTO `Recare`(`CodFiscale`, `ID_luogo`, `Data`, `OraIngresso`, `OraUscita`) VALUES ('TGLPSR23G43D234Z', 2, 20200321, '12:30', '13:30');
INSERT INTO `Recare`(`CodFiscale`, `ID_luogo`, `Data`, `OraIngresso`, `OraUscita`) VALUES ('TGLPSR23G43D234Z', 1, 20200321, '10:00', '12:0');
INSERT INTO `Recare`(`CodFiscale`, `ID_luogo`, `Data`, `OraIngresso`, `OraUscita`) VALUES ('AAABBB45Z66B186A', 3, 20200325, '12:30', '13:30');
INSERT INTO `Recare`(`CodFiscale`, `ID_luogo`, `Data`, `OraIngresso`, `OraUscita`) VALUES ('AAABBB45Z66B186A', 2, 20200326, '12:30', '13:30');
INSERT INTO `Recare`(`CodFiscale`, `ID_luogo`, `Data`, `OraIngresso`, `OraUscita`) VALUES ('AAABBB45Z66B186A', 1, 20200327, '10:00', '10:30');
INSERT INTO `Recare`(`CodFiscale`, `ID_luogo`, `Data`, `OraIngresso`, `OraUscita`) VALUES ('BBBCCC98V32B355S', 3, 20200321, '12:30', '13:30');
INSERT INTO `Recare`(`CodFiscale`, `ID_luogo`, `Data`, `OraIngresso`, `OraUscita`) VALUES ('BBBCCC98V32B355S', 1, 20200402, '12:30', '14:30');
INSERT INTO `Recare`(`CodFiscale`, `ID_luogo`, `Data`, `OraIngresso`, `OraUscita`) VALUES ('VVVZZZ45H77B367Q', 1, 20200402, '12:30', '13:30');
INSERT INTO `Recare`(`CodFiscale`, `ID_luogo`, `Data`, `OraIngresso`, `OraUscita`) VALUES ('VVVZZZ45H77B367Q', 2, 20200403, '11:30', '17:30');
INSERT INTO `Recare`(`CodFiscale`, `ID_luogo`, `Data`, `OraIngresso`, `OraUscita`) VALUES ('VVVZZZ45H77B367Q', 3, 20200404, '12:00', '14:30');
INSERT INTO `Recare`(`CodFiscale`, `ID_luogo`, `Data`, `OraIngresso`, `OraUscita`) VALUES ('VVVZZZ45H77B367Q', 4, 20200405, '16:30', '17:30');
INSERT INTO `Recare`(`CodFiscale`, `ID_luogo`, `Data`, `OraIngresso`, `OraUscita`) VALUES ('AAABBB45Z66B186A', 4, 20200327, '10:00', '10:30');
INSERT INTO `Recare`(`CodFiscale`, `ID_luogo`, `Data`, `OraIngresso`, `OraUscita`) VALUES ('TGLPSR23G43D234Z', 4, 20200321, '10:01', '10:29');


/*QUERY*/
/*1*/ Select Utenti.CodFiscale, Recare.OraIngresso, Recare.OraUscita, Luoghi.nome
        from (Utenti join Recare on Recare.CodFiscale = Utenti.CodFiscale)
                join Luoghi on Luoghi.ID_luogo = Recare.ID_luogo
        where Luoghi.Nome = "Gori"
        and OraIngresso >= "10:00"
        and OraUscita <=  "10:30"

/*2*/ Select Luoghi.Nome, Count(Recare.ID_luogo) as NumeroClienti
        from (Utenti join Recare on Recare.CodFiscale = Utenti.CodFiscale)
                join Luoghi on Luoghi.ID_luogo = Recare.ID_luogo
        group by Luoghi.Nome
        Order by NumeroClienti desc

/*3*/ Select Utenti.CodFiscale, Count(Recare.CodFiscale)
        from (Utenti join Recare on Recare.CodFiscale = Utenti.CodFiscale)
                join Luoghi on Luoghi.ID_luogo = Recare.ID_luogo
        group by Utenti.CodFiscale
        having Count(Recare.CodFiscale) >= 2
    