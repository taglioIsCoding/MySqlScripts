/*CREAZIONE TABELLE*/
create database CatenaSupermercati;

create table Categorie(
Descrizione varchar(50),
IdCategoria int(5),
PRIMARY KEY(IdCategoria)
);

create table Supermercati(
IdSuper int(5),
NumCivico varchar(5),
Citta varchar(20),
Via varchar(20),
PRIMARY KEY(IdSuper)
);

create table Prodotti(
IdProdotto int(5),
IdCategoria int(5),
Nome varchar(20),
Prezzo decimal(5,2),
PRIMARY KEY(IdProdotto),
FOREIGN KEY(IdCategoria) REFERENCES Categorie(Idcategoria)
);

create table possedere(
NumConfM int(10),
NumConfE int(10),
IdProdotto int(5),
IdSuper int(5),
PRIMARY KEY(IdProdotto, IdSuper),
FOREIGN KEY(IdProdotto)REFERENCES Prodotti(IdProdotto),
FOREIGN KEY(IdSuper) REFERENCES Supermercati(IdSuper)
);

/*POPOLO TABELLE*/

INSERT INTO `Supermercato`(`IDSuper`, `NumCivico`, `Citta`, `Via`) VALUES (1,25,"Brescia","Via 25 aprile");
INSERT INTO `Supermercato`(`IDSuper`, `NumCivico`, `Citta`, `Via`) VALUES (2,18,"Bergamo","Via aldo moro");
INSERT INTO `Supermercato`(`IDSuper`, `NumCivico`, `Citta`, `Via`) VALUES (3,11,"Milano","Via del campo");
INSERT INTO `Supermercato`(`IDSuper`, `NumCivico`, `Citta`, `Via`) VALUES (4,27,"Cremona","Via del cigliegio");
INSERT INTO `Supermercato`(`IDSuper`, `NumCivico`, `Citta`, `Via`) VALUES (5,27,"Pavia","Via omlipico");
INSERT INTO `Supermercato`(`IDSuper`, `NumCivico`, `Citta`, `Via`) VALUES (6,27,"Vicenza","Via marte");
INSERT INTO `Supermercato`(`IDSuper`, `NumCivico`, `Citta`, `Via`) VALUES (7,27,"Venezia","Via dei navigli");
INSERT INTO `Supermercato`(`IDSuper`, `NumCivico`, `Citta`, `Via`) VALUES (8,67,"Pisa","Via busi");

 

INSERT INTO `Prodotto`(`IdProdotto`, `Nome`, `Prezzo`,`Idcategoria`) VALUES (1,"Samsung galaxy A10",128.99,1);
INSERT INTO `Prodotto`(`IdProdotto`, `Nome`, `Prezzo`,`Idcategoria`) VALUES (2,"Uova di pasqua",7.49,2);
INSERT INTO `Prodotto`(`IdProdotto`, `Nome`, `Prezzo`,`Idcategoria`) VALUES (3,"Martini",3.95,3);
INSERT INTO `Prodotto`(`IdProdotto`, `Nome`, `Prezzo`,`Idcategoria`) VALUES (4,"Prosciutto cotto",14.90,4);
INSERT INTO `Prodotto`(`IdProdotto`, `Nome`, `Prezzo`,`Idcategoria`) VALUES (5,"Salame",16.69,5);
INSERT INTO `Prodotto`(`IdProdotto`, `Nome`, `Prezzo`,`Idcategoria`) VALUES (6,"Coca cola stock",3.38,6);
INSERT INTO `Prodotto`(`IdProdotto`, `Nome`, `Prezzo`,`Idcategoria`) VALUES (7,"Bibite san benedetto",0.59,7);
INSERT INTO `Prodotto`(`IdProdotto`, `Nome`, `Prezzo`,`Idcategoria`) VALUES (8,"Vino rosso",6.72,8);

 


INSERT INTO `Categoria`(`Idcategoria`, `descrizione`) VALUES (1,"Insaccati");
INSERT INTO `Categoria`(`Idcategoria`, `descrizione`) VALUES (2,"Alcolici");
INSERT INTO `Categoria`(`Idcategoria`, `descrizione`) VALUES (3,"Elettrodomestici");
INSERT INTO `Categoria`(`Idcategoria`, `descrizione`) VALUES (4,"Prodotti per la casa");
INSERT INTO `Categoria`(`Idcategoria`, `descrizione`) VALUES (5,"Surgelati");
INSERT INTO `Categoria`(`Idcategoria`, `descrizione`) VALUES (6,"Frutta e verdura");
INSERT INTO `Categoria`(`Idcategoria`, `descrizione`) VALUES (7,"Dolci");
INSERT INTO `Categoria`(`Idcategoria`, `descrizione`) VALUES (8,"Pescheria");

 

INSERT INTO `Possedere`(`NumConfM`,`NumConfE`,`IdSuper`,`IdProdotto`) VALUES (120,100,1,1);
INSERT INTO `Possedere`(`NumConfM`,`NumConfE`,`IdSuper`,`IdProdotto`) VALUES (300,80,2,2);
INSERT INTO `Possedere`(`NumConfM`,`NumConfE`,`IdSuper`,`IdProdotto`) VALUES (200,50,3,3);
INSERT INTO `Possedere`(`NumConfM`,`NumConfE`,`IdSuper`,`IdProdotto`) VALUES (159,70,4,4);
INSERT INTO `Possedere`(`NumConfM`,`NumConfE`,`IdSuper`,`IdProdotto`) VALUES (171,30,5,5);
INSERT INTO `Possedere`(`NumConfM`,`NumConfE`,`IdSuper`,`IdProdotto`) VALUES (124,73,6,6);
INSERT INTO `Possedere`(`NumConfM`,`NumConfE`,`IdSuper`,`IdProdotto`) VALUES (250,28,7,7);
INSERT INTO `Possedere`(`NumConfM``NumConfE`,`IdSuper`,`IdProdotto`) VALUES (400,65,8,8);

/*QUERY*/
/*1*/ SELECT possedere.numconfM, possedere.numconfE
      FROM (supermercato JOIN possedere ON supermercato.idSuper=possedere.idSuper) 
      JOIN prodotto ON prodotto.idProdotto=possedere.idProdotto
      WHERE prodotto.nome= "Banane"
      ORDER BY supermercato.idSuper

/*2*/ SELECT supermercato.idSuper, prodotto.nome
      FROM (supermercato JOIN possedere ON supermercato.idSuper=possedere.idSuper) 
      JOIN prodotto ON prodotto.idProdotto=possedere.idProdotto
      WHERE possedere.numconfM > 100
      ORDER BY supermercato.idSuper

/*3*/ SELECT supermercato.IdSuper
        FROM supermercato 
        JOIN possedere ON supermercato.IdSuper=possedere.IdSuper
        WHERE possedere.idProdotto = "INPUT"
        ORDER BY possedere.numConfE
        LIMIT 1