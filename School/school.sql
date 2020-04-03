create database Istituti;


create table istituti(
  IdIstituto varchar(10),
  NomeI varchar(10),
  NumTelefono varchar(10),
  Citta varchar(10),
  Via varchar(20),
  NumCivico varchar(4),

  primary key(IdIstituto)
);


create table studenti(
  Matricola varchar(10),
  NomeS varchar(10),
  CongnomeS varchar(10),
  Sesso boolean,
  NumTelefono varchar(10),
  IdIstituto varchar(10),

  primary key(Matricola),
  foreign key(IdIstituto) references istituti (IdIstituto)
);


create table docenti(
  MatricolaD varchar(10),
  NomeD varchar(10),
  CongnomeD varchar(10),
  IdIstituto varchar(10),
  IdCors varchar(10),

  primary key(MatricolaD),
  foreign key(IdIstituto) references istituti (IdIstituto),
  foreign key(IdCors) references corsi (IdCors)
);

create table corsi(
  IdCors varchar(10),
  Descrizione varchar(30),


  primary key(IdCors)
);


create table frequentare(
  Idcors varchar(10),
  Matricola varchar(10),

  primary key(IdCors, Matricola),
  foreign key(IdCors) references corsi (IdCors),
  foreign key(Matricola) references studenti (Matricola)
);

INSERT INTO `istituti`(`IdIstituto`, `NomeI`, `NumTelefono`, `Citta`, `Via`, `NumCivico`) VALUES (1,"ITIS CASTELLI","0300101010","Brescia","Via Cantore","20");
INSERT INTO `istituti`(`IdIstituto`, `NomeI`, `NumTelefono`, `Citta`, `Via`, `NumCivico`) VALUES (2,"ABBA BALLINI","0301010101","Brescia","Via Ballini","18");

INSERT INTO `studenti`(`Matricola`, `NomeS`, `CongnomeS`, `Sesso`, `NumTelefono`, `IdIstituto`) VALUES (1,"Lorenzo","Cagni",true,"3321213213",1);
INSERT INTO `studenti`(`Matricola`, `NomeS`, `CongnomeS`, `Sesso`, `NumTelefono`, `IdIstituto`) VALUES (2,"Matteo","Huqi",true,"312312312",1);
INSERT INTO `studenti`(`Matricola`, `NomeS`, `CongnomeS`, `Sesso`, `NumTelefono`, `IdIstituto`) VALUES (3,"Stefano","Valloncini",true,"335465713",2);
INSERT INTO `studenti`(`Matricola`, `NomeS`, `CongnomeS`, `Sesso`, `NumTelefono`, `IdIstituto`) VALUES (4,"Matteo","Botti",true,"3488618750",1);
INSERT INTO `studenti`(`Matricola`, `NomeS`, `CongnomeS`, `Sesso`, `NumTelefono`, `IdIstituto`) VALUES (5,"Giulio","Lonati",true,"114145212",2);


INSERT INTO `corsi`(`IdCors`, `Descrizione`) VALUES (1,"Informatica");
INSERT INTO `corsi`(`IdCors`, `Descrizione`) VALUES (2,"Inglese");
INSERT INTO `corsi`(`IdCors`, `Descrizione`) VALUES (3,"Educazione Fisica")

INSERT INTO `docenti`(`MatricolaD`, `NomeD`, `CongnomeD`, `IdIstituto`, `IdCors`) VALUES (1,"Barbara","Bottari",1,1);
INSERT INTO `docenti`(`MatricolaD`, `NomeD`, `CongnomeD`, `IdIstituto`, `IdCors`) VALUES (2,"Tobia","Donato",1,2);
INSERT INTO `docenti`(`MatricolaD`, `NomeD`, `CongnomeD`, `IdIstituto`, `IdCors`) VALUES (3,"Paolo","Lancello",2,3);

INSERT INTO `frequentare`(`IdCors`, `Matricola`) VALUES (1,2);
INSERT INTO `frequentare`(`IdCors`, `Matricola`) VALUES (2,3);
INSERT INTO `frequentare`(`IdCors`, `Matricola`) VALUES (3,4);

/*QUERY*/
/*1*/
select count(studenti.nomeS) AS numStudenti
from (studenti join frequentare on frequentare.matricola=studenti.matricola)join corsi on corsi.idcors = frequentare.idcors
where corsi.idcors="2"

/*2*/
select docenti.nomed, docenti.congnomed
from docenti join corsi on corsi.idcors=docenti.idcors
where corsi.idcors IS NOT null

/*3*/
select count(studenti.matricola) AS numStudenti,istituti.nomei
from studenti join istituti on istituti.Idistituto=studenti.idistituto
group by istituti.idistituto

/*4*/
select DISTINCT istituti.nomei,istituti.numtelefono,istituti.citta
from ((studenti join frequentare on frequentare.matricola=studenti.matricola)join corsi on corsi.idcors=frequentare.idcors)join istituti on istituti.Idistituto=studenti.idistituto
where corsi.idcors=3

/*5*/
select docenti.Congnomed,docenti.nomed ,istituti.nomei
  from istituti join docenti on istituti.idistituto=docenti.idistituto
  order by docenti.nomed

/*6*/
select count(studenti.matricola) AS numStudenti
  from ((studenti join frequentare on frequentare.matricola=studenti.matricola)join corsi on corsi.idcors=frequentare.idcors)join istituti on istituti.Idistituto=studenti.idistituto
  where istituti.idistituto=2 group by corsi.idcors