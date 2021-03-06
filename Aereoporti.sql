create database aereoporti;

create table Aereoporto(
    citta varchar(20),
    Nazione varchar(10),
    NumPiste int(3),

    primary key (citta)

);

create table Aereo(
   TipoAereo varchar(6),
   NumPasseggeri int(4),
   QtaMerci int(4),

   primary key(TipoAereo)
);

create table volo(
  IdVolo varchar(4),
  GiornoSett char(10),
  CittaPartenza varchar(20),
  oraPartenza time,
  cittaArrivo varchar(20),
  oraArrivo time,
  TipoAereo varchar(6),

  primary key(IdVolo),
  foreign key (CittaPartenza) references aereoporto (citta),
  foreign key (cittaArrivo) references aereoporto (citta),
  foreign key (TipoAereo) references Aereo (TipoAereo)

);


INSERT INTO `Aereoporto`(`citta`, `Nazione`, `NumPiste`) VALUES ("Milano","Italia", 10);
INSERT INTO `Aereoporto`(`citta`, `Nazione`, `NumPiste`) VALUES ("Bergamo","Italia", 1);
INSERT INTO `Aereoporto`(`citta`, `Nazione`, `NumPiste`) VALUES ("Berlino","Germania", 30);
INSERT INTO `Aereoporto`(`citta`, `Nazione`, `NumPiste`) VALUES ("Madrid","Spagna", 15);

INSERT INTO `Aereo`(`TipoAereo`, `NumPasseggeri`, `QtaMerci`) VALUES ("Boeng777",1000, 1000);
INSERT INTO `Aereo`(`TipoAereo`, `NumPasseggeri`, `QtaMerci`) VALUES ("Boeng111",2000, 3000);
INSERT INTO `Aereo`(`TipoAereo`, `NumPasseggeri`, `QtaMerci`) VALUES ("Boeng222",1000, 2000);

INSERT INTO `volo`(`IdVolo`, `GiornoSett`, `CittaPartenza`, `oraPartenza`,`oraArrivo`,`cittaArrivo`,`TipoAereo`) VALUES (1 , "lunedi", "Milano", '10:10:10', '11:10:10',"Berlino","Boeng777");
INSERT INTO `volo`(`IdVolo`, `GiornoSett`, `CittaPartenza`, `oraPartenza`,`oraArrivo`,`cittaArrivo`,`TipoAereo`) VALUES (2 , "martedi", "Berlino", '10:13:10', '18:10:10',"Milano","Boeng111");
INSERT INTO `volo`(`IdVolo`, `GiornoSett`, `CittaPartenza`, `oraPartenza`,`oraArrivo`,`cittaArrivo`,`TipoAereo`) VALUES (3 , "Domenica", "Madrid", '10:10:10', '14:30:10',"Berlino","Boeng222");

/*QUERY*/
SELECT * FROM volo WHERE cittaArrivo = "Milano" ORDER by cittaArrivo DESC

SELECT * FROM Aereoporto Where NumPiste IS NULL

SELECT IdVolo FROM volo join Aereo where Aereo.NumPasseggeri > 0 and Aereo.QtaMerci > 0

SELECT Aereoporto.Nazione, Aereoporto.Nazione FROM (aereoporto A1 join volo on A1.citta=volo.cittaArrivo) join Aereoporto on CittaPartenza = Aereoporto.citta

/*SELECT * from Aereoporto join volo join Aereoporto*/

SELECT aereoporto.nazione, max(aereoporto.NumPiste) FROM aereoporto where NumPiste is not null group by nazione

SELECT aereoporto.nazione, max(aereoporto.NumPiste) FROM aereoporto where NumPiste > 3 group by nazione

SELECT DISTINCT * from (aereoporto as a1 join volo on a1.citta=Volo.CittaPartenza)join aereoporto as a2 on a2.citta = cittaArrivo where a1.Nazione = "Spagna" and a2.Nazione = "Germania"

