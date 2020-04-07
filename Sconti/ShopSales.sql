create database ShopSales;

CREATE TABLE Negozi
(
  ID_negozio INT,
  Nome VARCHAR(15),
  Città VARCHAR(20) ,
  Via VARCHAR(20),
  N_Civico INT,
  PRIMARY KEY (ID_negozio)
);

CREATE TABLE Magazzino
(
  ID_mag INT,
  Capienza INT,
  ID_negozio INT,
  PRIMARY KEY (ID_mag),
  FOREIGN KEY (ID_negozio) REFERENCES Negozi(ID_negozio)
);

CREATE TABLE Categoria
(
  ID_categoria INT,
  descrizione VARCHAR(20),
  PRIMARY KEY (ID_categoria)
);

CREATE TABLE Prodotto
(
  ID_prodotto INT,
  nome VARCHAR(20),
  prezzo INT,
  ID_categoria INT,
  PRIMARY KEY (ID_prodotto),
  FOREIGN KEY (ID_categoria) REFERENCES Categoria(ID_categoria)
);

CREATE TABLE Contenere
(
  ID_prodotto INT,
  ID_mag INT,
  N_pezzi INT,
  Offerta VARCHAR(4),
  PRIMARY KEY (ID_prodotto, ID_mag),
  FOREIGN KEY (ID_prodotto) REFERENCES Prodotto(ID_prodotto),
  FOREIGN KEY (ID_mag) REFERENCES Magazzino(ID_mag)
);


INSERT INTO `Negozi`(`ID_negozio`,`Nome`, `Città`, `via`, `n_civico`) VALUES (1,"Mediaword", "Milano", "Marco polo", 31);
INSERT INTO `Negozi`(`ID_negozio`,`Nome`, `Città`, `via`, `n_civico`) VALUES (2,"Euronics", "Milano", "Leonardo da Vinci", 23);
INSERT INTO `Negozi`(`ID_negozio`,`Nome`, `Città`, `via`, `n_civico`) VALUES (3,"Esselunga", "Brescia", "Conte Cavour", 45);
INSERT INTO `Negozi`(`ID_negozio`,`Nome`, `Città`, `via`, `n_civico`) VALUES (4,"Unieuro", "Napoli", "Maradona", 66);

INSERT INTO `Magazzino`(`ID_mag`,`Capienza`, `ID_negozio`) VALUES (1, 20, 2);
INSERT INTO `Magazzino`(`ID_mag`,`Capienza`, `ID_negozio`) VALUES (2, 30, 2);
INSERT INTO `Magazzino`(`ID_mag`,`Capienza`, `ID_negozio`) VALUES (3, 50, 1);
INSERT INTO `Magazzino`(`ID_mag`,`Capienza`, `ID_negozio`) VALUES (4, 60, 3);
INSERT INTO `Magazzino`(`ID_mag`,`Capienza`, `ID_negozio`) VALUES (5, 70, 4);

INSERT INTO `Categoria`(`ID_Categoria`,`Descrizione`) VALUES (1, "Casa");
INSERT INTO `Categoria`(`ID_Categoria`,`Descrizione`) VALUES (2, "Ufficio");
INSERT INTO `Categoria`(`ID_Categoria`,`Descrizione`) VALUES (3, "Informatica");

INSERT INTO `Prodotto`(`ID_Prodotto`,`Nome`, `prezzo`, `ID_categoria`) VALUES (1,"Sedia", 20, 2);
INSERT INTO `Prodotto`(`ID_Prodotto`,`Nome`, `prezzo`, `ID_categoria`) VALUES (2,"Computer", 400, 1);
INSERT INTO `Prodotto`(`ID_Prodotto`,`Nome`, `prezzo`, `ID_categoria`) VALUES (3,"Pasta", 5, 1);
INSERT INTO `Prodotto`(`ID_Prodotto`,`Nome`, `prezzo`, `ID_categoria`) VALUES (4,"Brioche", 6, 1);
INSERT INTO `Prodotto`(`ID_Prodotto`,`Nome`, `prezzo`, `ID_categoria`) VALUES (5,"Lampada", 40, 2);
INSERT INTO `Prodotto`(`ID_Prodotto`,`Nome`, `prezzo`, `ID_categoria`) VALUES (6,"Biro", 1, 2);
INSERT INTO `Prodotto`(`ID_Prodotto`,`Nome`, `prezzo`, `ID_categoria`) VALUES (7,"Thee", 100, 1);

INSERT INTO `Contenere`(`ID_Prodotto`,`ID_mag`, `N_pezzi`, `Offerta`) VALUES (1,1, 20, null);
INSERT INTO `Contenere`(`ID_Prodotto`,`ID_mag`, `N_pezzi`, `Offerta`) VALUES (1,4, 100, "20%");
INSERT INTO `Contenere`(`ID_Prodotto`,`ID_mag`, `N_pezzi`, `Offerta`) VALUES (2,1, 34, "1%");
INSERT INTO `Contenere`(`ID_Prodotto`,`ID_mag`, `N_pezzi`, `Offerta`) VALUES (2,3, 23, "5%");
INSERT INTO `Contenere`(`ID_Prodotto`,`ID_mag`, `N_pezzi`, `Offerta`) VALUES (2,5, 15, "10%");
INSERT INTO `Contenere`(`ID_Prodotto`,`ID_mag`, `N_pezzi`, `Offerta`) VALUES (3,4, 560, null);
INSERT INTO `Contenere`(`ID_Prodotto`,`ID_mag`, `N_pezzi`, `Offerta`) VALUES (4,4, 10, null);
INSERT INTO `Contenere`(`ID_Prodotto`,`ID_mag`, `N_pezzi`, `Offerta`) VALUES (5,4, 7, "34%");
INSERT INTO `Contenere`(`ID_Prodotto`,`ID_mag`, `N_pezzi`, `Offerta`) VALUES (5,1, 9, "70%");
INSERT INTO `Contenere`(`ID_Prodotto`,`ID_mag`, `N_pezzi`, `Offerta`) VALUES (6,4, 22, "16%");
INSERT INTO `Contenere`(`ID_Prodotto`,`ID_mag`, `N_pezzi`, `Offerta`) VALUES (6,2, 56, "19%");


/*QUERY*/
/*1*/ Select * from (Prodotto join Contenere) 
        where Prodotto.ID_Prodotto = Contenere.ID_Prodotto 
          and Contenere.Offerta IS NOT NULL

/*2*/ Select Prodotto.nome, Contenere.N_pezzi from (Prodotto join Contenere) 
        join Magazzino
          join Negozi
            where Prodotto.ID_Prodotto = Contenere.ID_Prodotto 
              and Contenere.ID_mag = Magazzino.ID_mag
              and Magazzino.ID_negozio = Negozi.ID_negozio
                and Contenere.Offerta IS NOT NULL
                and Negozi.nome = "Euronics"

/*3*/ /*??? Non ho idea di come inserire la data di un'offerta*/

/*4*/ Select Prodotto.nome, Contenere.N_pezzi from (Prodotto join Contenere) 
        join Categoria
        where Prodotto.ID_Prodotto = Contenere.ID_Prodotto
          and Prodotto.ID_categoria = Categoria.ID_categoria
            And Categoria.descrizione = "Ufficio"

/*5*/ Select Prodotto.nome, Contenere.N_pezzi, Categoria.descrizione from (Prodotto join Contenere) 
        join Magazzino
          join Negozi
            join Categoria
              where Prodotto.ID_Prodotto = Contenere.ID_Prodotto 
                and Contenere.ID_mag = Magazzino.ID_mag
                and Magazzino.ID_negozio = Negozi.ID_negozio
                and Prodotto.ID_categoria = Categoria.ID_categoria
                  and Negozi.nome = "Euronics"
                  and Prodotto.nome LIKE "C%"

/*6*/ Select * from Prodotto join Categoria
        where Prodotto.ID_categoria = Categoria.ID_categoria
            And Prodotto.nome LIKE "____"

/*7*/ Select * from (Prodotto join Contenere) 
        join Magazzino
          join Negozi
            where Prodotto.ID_Prodotto = Contenere.ID_Prodotto 
              and Contenere.ID_mag = Magazzino.ID_mag
              and Magazzino.ID_negozio = Negozi.ID_negozio
                and Negozi.città = "Milano" Order by Prodotto.nome
                  group by Prodotto.ID_Prodotto
                    having (MAX(Contenere.N_pezzi))

/*8*/ Select Prodotto.nome from (Prodotto join Contenere) 
        join Magazzino
          join Negozi
            where Prodotto.ID_Prodotto = Contenere.ID_Prodotto 
              and Contenere.ID_mag = Magazzino.ID_mag
              and Magazzino.ID_negozio = Negozi.ID_negozio
                and Negozi.città = "Milano"
                and Contenere.Offerta IS NOT NULL
