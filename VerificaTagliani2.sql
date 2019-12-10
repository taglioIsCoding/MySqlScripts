create database comune_tagliani;

  create table sedi(

    codiceSede int(8),
    nome varchar(20),
    via varchar(20),
    nr_civicio int(4),
    cap int(5),

    primary key (codiceSede)


  );

  create table eventi(

    id_e int(4),
    descrizione varchar(70),

    primary key (id_e)

  );

    create table Sala_riunioni(

      codiceSala int(8),
      nomeSala varchar(20),
      codiceSede int(8),

      primary key (codiceSala),
      foreign key (codiceSede) references sedi(codiceSede)

    );

    create table tenere(
      codiceSala int(8),
      id_e int(4),
      data_evento date,

      primary key(codiceSala, id_e),
      foreign key (codiceSala) references Sala_riunioni (codiceSala),
      foreign key (id_e) references eventi (id_e)

    );

      INSERT INTO `sedi`(`codiceSede`, `nome`, `via`,`nr_civicio`,`cap` ) VALUES (1,"rossi","san Paolo", 10, 25100);
      INSERT INTO `sedi`(`codiceSede`, `nome`, `via`,`nr_civicio`,`cap` ) VALUES (2,"bianchi","san Francesco", 11, 25101);
      INSERT INTO `sedi`(`codiceSede`, `nome`, `via`,`nr_civicio`,`cap` ) VALUES (3,"verdi","san Giorgio", 12, 25102);

      INSERT INTO `eventi`(`id_e`, `descrizione`) VALUES (1,"Studi di funzione");
      INSERT INTO `eventi`(`id_e`, `descrizione`) VALUES (2,"Studi di animali");
      INSERT INTO `eventi`(`id_e`, `descrizione`) VALUES (3,"Corso di cucina");

      INSERT INTO `Sala_riunioni`(`codiceSala`, `nomeSala`, `codiceSede` ) VALUES (1,"che funzione",1);
      INSERT INTO `Sala_riunioni`(`codiceSala`, `nomeSala`, `codiceSede` ) VALUES (2,"che cane",2);
      INSERT INTO `Sala_riunioni`(`codiceSala`, `nomeSala`, `codiceSede` ) VALUES (3,"che bonta",3);

      INSERT INTO `tenere`(`codiceSala`, `id_e`, `data_evento` ) VALUES (1,1,20191207);
      INSERT INTO `tenere`(`codiceSala`, `id_e`, `data_evento` ) VALUES (2,2,20191208);
      INSERT INTO `tenere`(`codiceSala`, `id_e`, `data_evento` ) VALUES (3,3,20191209);


      alter table Sala_riunioni add nr_posti int(6);
        UPDATE Sala_riunioni SET nr_posti=100 WHERE codiceSala=1;
        UPDATE Sala_riunioni SET nr_posti=200 WHERE codiceSala=2;
        UPDATE Sala_riunioni SET nr_posti=300 WHERE codiceSala=3;

        UPDATE Sala_riunioni SET nr_posti= Sala_riunioni.nr_posti +(Sala_riunioni.nr_posti/10) WHERE codiceSala=1;
        UPDATE Sala_riunioni SET nr_posti= Sala_riunioni.nr_posti +(Sala_riunioni.nr_posti/10) WHERE codiceSala=2;
        UPDATE Sala_riunioni SET nr_posti= Sala_riunioni.nr_posti +(Sala_riunioni.nr_posti/10) WHERE codiceSala=3;
