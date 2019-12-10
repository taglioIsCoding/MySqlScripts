

create database Musica_Tagliani;

  create table cd
  (
  	idCd int(8),
  	titolo varchar(20),
  	prezzo decimal(8,2),

  	primary key (idCd)

  );

  create table AUTORICD
  (
  	idArtista int(8),
  	nomeArtista varchar(20),
    dataNascita date,
  	dataMorte date,
    idCd int(8),



  	primary key (idArtista),
    foreign key (idCd) references cd (idCd)

  );

  create table docenti
    (
    idDoc int(8),
    materia varchar(20),
    dataNascita date,
    dataMorte date,

    primary key (idDoc)

  );

  INSERT INTO `cd`(`idCd`, `titolo`, `prezzo`) VALUES (1,"AAA", 13.50);
  INSERT INTO `cd`(`idCd`, `titolo`, `prezzo`) VALUES (2,"BBB", 45);
  INSERT INTO `cd`(`idCd`, `titolo`, `prezzo`) VALUES (3,"CCC", 1);

  INSERT INTO `AUTORICD`(`idArtista`, `nomeArtista`, `dataNascita`,`dataMorte`,`idCd` ) VALUES (1,"eminem",20191020, null, 1);
  INSERT INTO `AUTORICD`(`idArtista`, `nomeArtista`, `dataNascita`,`dataMorte`,`idCd` ) VALUES (2,"pippo",20011204, 20191022, 2);
  INSERT INTO `AUTORICD`(`idArtista`, `nomeArtista`, `dataNascita`,`dataMorte`,`idCd` ) VALUES (3,"baudo",20020903, 20191023, 3);

  alter table AUTORICD add StatoDiNascita char(3);

  UPDATE AUTORICD SET StatoDiNascita="USA" WHERE idArtista=1;
  UPDATE AUTORICD SET StatoDiNascita="ITA" WHERE idArtista=2;
  UPDATE AUTORICD SET StatoDiNascita="GER" WHERE idArtista=3;

  ALTER TABLE docenti DROP COLUMN dataMorte;
