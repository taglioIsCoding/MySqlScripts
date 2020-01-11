create database universita;


create table studenti(
  matricola varchar(10),
  nomeS varchar(10),
  congnomeS varchar(10),
  CittaRes varchar(10),
  Sesso boolean,
  numTelefono varchar(10),

  primary key(matricola)
);


create table docenti(
  matricolaD varchar(10),
  nomeD varchar(10),
  congnomeD varchar(10),
  dipartimento varchar(10),
  stipendio varchar(10),

  primary key(matricolaD)
);

create table corsi(
  codCorso varchar(10),
  nomeC varchar(10),
  numCrediti int(10),
  matricolaDoc varchar(10),


  primary key(codCorso),
  foreign key (matricolaDoc) references docenti(matricolaD)
);



create table esami(
  matricola varchar(10),
  codCorso varchar(10),
  voto int(2),

  primary key (matricola, codCorso),
  foreign key (matricola) references studenti(matricola),
  foreign key (codCorso) references corsi(codCorso)
);


INSERT INTO `studenti`(`matricola`, `nomeS`, `congnomeS`, `CittaRes`, `Sesso`, `numTelefono`) VALUES (1,"Lorenzo","Cagni","Brescia", true, 332121321312);
INSERT INTO `studenti`(`matricola`, `nomeS`, `congnomeS`, `CittaRes`, `Sesso`, `numTelefono`) VALUES (2,"Matteo","Huqi","Flero", true, 312312312);
INSERT INTO `studenti`(`matricola`, `nomeS`, `congnomeS`, `CittaRes`, `Sesso`, `numTelefono`) VALUES (3,"Stefano","Valloncini","Castegnato", true, 33546571321312);
INSERT INTO `studenti`(`matricola`, `nomeS`, `congnomeS`, `CittaRes`, `Sesso`, `numTelefono`) VALUES (4,"Matteo","Botti","Botticino", true, 45212);
INSERT INTO `studenti`(`matricola`, `nomeS`, `congnomeS`, `CittaRes`, `Sesso`, `numTelefono`) VALUES (5,"Giulio","Lonati","Roma", true, 145212);

INSERT INTO `docenti`(`matricolaD`, `nomeD`, `congnomeD`, `dipartimento`, `stipendio`) VALUES (1,"Barbara","Bottari","Informatica", 3321312);
INSERT INTO `docenti`(`matricolaD`, `nomeD`, `congnomeD`, `dipartimento`, `stipendio`) VALUES (2,"Tobia","Donato","Informatica", 3312);
INSERT INTO `docenti`(`matricolaD`, `nomeD`, `congnomeD`, `dipartimento`, `stipendio`) VALUES (3,"Paolo","Lancello","sms", 1000);

INSERT INTO `corsi`(`codCorso`, `nomeC`, `numCrediti`, `matricolaDoc`) VALUES (1,"Informatica",6,2);
INSERT INTO `corsi`(`codCorso`, `nomeC`, `numCrediti`, `matricolaDoc`) VALUES (2,"Inglese", 20, 1);
INSERT INTO `corsi`(`codCorso`, `nomeC`, `numCrediti`, `matricolaDoc`) VALUES (3,"Tecnologie",4,3);

INSERT INTO `esami`(`codCorso`, `matricola`, `voto`) VALUES (1,2,4);
INSERT INTO `esami`(`codCorso`, `matricola`, `voto`) VALUES (3,2,14);
INSERT INTO `esami`(`codCorso`, `matricola`, `voto`) VALUES (2,1,7);
INSERT INTO `esami`(`codCorso`, `matricola`, `voto`) VALUES (1,3,30);
INSERT INTO `esami`(`codCorso`, `matricola`, `voto`) VALUES (3,4,20);
INSERT INTO `esami`(`codCorso`, `matricola`, `voto`) VALUES (2,5,21);



/*Esempi query*/
SELECT matricola  FROM `studenti` WHERE 1 ORDER BY matricola DESC
SELECT MAX(stipendio) as top from docenti
SELECT * FROM `studenti` WHERE cittaRes LIKE "b%"

SELECT studenti.matricola,
			studenti.congnomeS,
            studenti.nomeS
            	from studenti, esami
                where studenti.matricola = esami.matricola and
                esami.voto > 10 AND
                studenti.congnomeS LIKE "b%"

SELECT studenti.matricola,
			studenti.congnomeS,
            studenti.nomeS
            	from studenti inner join esami on studenti.matricola = esami.matricola
                where
                esami.voto > 10 AND
                studenti.congnomeS LIKE "b%"
                
SELECT studenti.congnomeS
	from studenti join esami join docenti
    where esami.voto > 18
    		AND docenti.stipendio>100
