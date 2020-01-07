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
