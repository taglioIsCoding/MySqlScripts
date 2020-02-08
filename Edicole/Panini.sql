create database Panini;

create table tipoPubblicazione(

  idTipo int(5),
  nomeTipo varchar(15),
  periodicitaConsegna int(4),
  descrizione varchar(20),

  primary key (idTipo)
);

create table Province(

  idProv int(2),
  nomeProvincia varchar(10),

  primary key(idProv)
);

create table Pubblicazioni(
  idPubb int(5),
  titolo varchar(15),
  nomeEditore varchar(10),
  tipo int(5),

  primary key(idPubb),
  foreign key (tipo) references tipoPubblicazione(idTipo)

);

create table Edicole(
  idEdicola int(5),
  nomeEdicola varchar(10),
  codProvincia int(2),

  primary key(idEdicola),
  foreign key (codProvincia) references Province(idProv)

);

create table Spedizione(
  idPubb int(5),
  idEdicola int(5),
  numConsegnati int(7),
  numResi int (7),
  dataOperazione date,

  primary key (idPubb, idEdicola,dataOperazione),
  foreign key (idPubb) references Pubblicazioni(idPubb),
  foreign key (idEdicola) references Edicole(idEdicola)

);




INSERT INTO `tipoPubblicazione`(`idTipo`, `nomeTipo`, `periodicitaConsegna`, `descrizione`) VALUES (1,"quotidiano", 1,"Informazione");
INSERT INTO `tipoPubblicazione`(`idTipo`, `nomeTipo`, `periodicitaConsegna`, `descrizione`) VALUES (2,"Rivista", 30,"Svago");
INSERT INTO `tipoPubblicazione`(`idTipo`, `nomeTipo`, `periodicitaConsegna`, `descrizione`) VALUES (3,"Politica", 90,"Dibattito");

INSERT INTO `Province`(`idProv`, `nomeProvincia`) VALUES (1,"Brescia");
INSERT INTO `Province`(`idProv`, `nomeProvincia`) VALUES (2,"Milano");
INSERT INTO `Province`(`idProv`, `nomeProvincia`) VALUES (3,"Cremona");

INSERT INTO `Pubblicazioni`(`idPubb`, `titolo`, `nomeEditore`,`tipo`) VALUES (2,"ilSole24","Mondadori",1);
INSERT INTO `Pubblicazioni`(`idPubb`, `titolo`, `nomeEditore`,`tipo`) VALUES (1,"BellaBionda","GossipGirl",2);
INSERT INTO `Pubblicazioni`(`idPubb`, `titolo`, `nomeEditore`,`tipo`) VALUES (3,"Focus","Mondadori",3);

INSERT INTO `Edicole`(`idEdicola`, `nomeEdicola`, `codProvincia`) VALUES (1,"FrescoDiStampa", 2);
INSERT INTO `Edicole`(`idEdicola`, `nomeEdicola`, `codProvincia`) VALUES (2,"NewsForAll", 3);
INSERT INTO `Edicole`(`idEdicola`, `nomeEdicola`, `codProvincia`) VALUES (3,"Stampino", 1);

INSERT INTO `Spedizione`(`idPubb`, `idEdicola`, `numConsegnati`,`numResi`,`dataOperazione`) VALUES (1,1,20,10, 20200201);
INSERT INTO `Spedizione`(`idPubb`, `idEdicola`, `numConsegnati`,`numResi`,`dataOperazione`) VALUES (2,1,25,1, 20200201);
INSERT INTO `Spedizione`(`idPubb`, `idEdicola`, `numConsegnati`,`numResi`,`dataOperazione`) VALUES (3,1,2,15, 20200202);
INSERT INTO `Spedizione`(`idPubb`, `idEdicola`, `numConsegnati`,`numResi`,`dataOperazione`) VALUES (1,2,2,1, 20200201);
INSERT INTO `Spedizione`(`idPubb`, `idEdicola`, `numConsegnati`,`numResi`,`dataOperazione`) VALUES (2,2,52,20, 20200201);
INSERT INTO `Spedizione`(`idPubb`, `idEdicola`, `numConsegnati`,`numResi`,`dataOperazione`) VALUES (3,2,24,7, 20200202);
INSERT INTO `Spedizione`(`idPubb`, `idEdicola`, `numConsegnati`,`numResi`,`dataOperazione`) VALUES (1,3,10,10, 20200201);
INSERT INTO `Spedizione`(`idPubb`, `idEdicola`, `numConsegnati`,`numResi`,`dataOperazione`) VALUES (2,3,5,10, 20200201);
INSERT INTO `Spedizione`(`idPubb`, `idEdicola`, `numConsegnati`,`numResi`,`dataOperazione`) VALUES (3,3,12,1, 20200202);
