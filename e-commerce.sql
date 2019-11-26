/**
 LOGICAL MODEL
clienti(credito, cap, citta,via, numero c, id_cliente)
ordini (id_ordine, data_ordine, data_inoltro, stato, data_ricezione, data_consegna, totale, id_cliente, id_corriere)
prodotti (id_prodotto, nome, peso, qta)
corrieri (id_corriere, nome, cognome, nr_patente)
contiene (id_ordine, id_prodotto)
**/


create database e_commerce;

  create table clienti(
      credito decimal(8,2),
      cap int(5),
      citta varchar(17),
      via varchar (20),
      numero_civico varchar(6),
      id_cliente int(10),


      primary key (id_cliente)
    );


create table prodotti (
  id_prodotto int (20),
   nome varchar(20),
   peso decimal(8,2),
   qta int(5),

   primary key (id_prodotto)
 );


 create table corrieri (
   id_corriere int(20) auto_increment,
   nome varchar(17),
   cognome varchar(17),
  nr_patente char(10),

  primary key(id_corriere)

);

create table stato(
    id_stato int(3),
    descrizione varchar(40),

    primary key(id_stato)

);

create table ordini (
  id_ordine int(20) auto_increment,
  data_ordine date,
  data_inoltro date,
  id_stato int(3),
  data_ricezione date,
  data_consegna date,
  totale int(20),
  id_cliente int(10),
  id_corriere int(20),

  primary key(id_ordine),
  foreign key (id_cliente) references clienti(id_cliente),
  foreign key (id_corriere) references corrieri(id_corriere),
  foreign key (id_stato) references stato(id_stato)


);


create table contiene (
  id_ordine int(20),
  id_prodotto int(20),
  quantita int(5),

  primary key(id_ordine, id_prodotto),
    foreign key (id_ordine) references ordini(id_ordine),
    foreign key (id_prodotto) references prodotti(id_prodotto)

);


/* popolo tabelle*/

INSERT INTO `stato`(`id_stato`, `descrizione`) VALUES (1,"Presa in carico");
INSERT INTO `stato`(`id_stato`, `descrizione`) VALUES (2,"In attesa del corriere");
INSERT INTO `stato`(`id_stato`, `descrizione`) VALUES (3,"Spedito");
INSERT INTO `stato`(`id_stato`, `descrizione`) VALUES (4,"Conseganto");


INSERT INTO `corrieri`(`id_corriere`, `nome`, `cognome`, `nr_patente`) VALUES (1,"Ali", "Ala", 1111111111);
INSERT INTO `corrieri`(`id_corriere`, `nome`, `cognome`, `nr_patente`) VALUES (1,"Moamed", "Ali", 2222222222);

INSERT INTO `prodotti`(`id_prodotto`, `nome`, `peso`, `quantità`) VALUES (1,"Iphone XS", 100.2, 100);
INSERT INTO `prodotti`(`id_prodotto`, `nome`, `peso`, `quantità`) VALUES (2,"Air Pods", 15.2, 340);
INSERT INTO `prodotti`(`id_prodotto`, `nome`, `peso`, `quantità`) VALUES (3,"Mac pro", 1032.2, 23);
INSERT INTO `prodotti`(`id_prodotto`, `nome`, `peso`, `quantità`) VALUES (4,"Ipad pro", 342.2, 59);

INSERT INTO `clienti`(`id_cliente`, `via`, `cap`, `citta`,`numero_civico`,`credito`) VALUES (1,"via rossi", 25100 ,"Brescia", 100, 0.05);
INSERT INTO `clienti`(`id_cliente`, `via`, `cap`, `citta`,`numero_civico`,`credito`) VALUES (2,"via bianchi", 25100 ,"Brescia", 30, 100000.05);
INSERT INTO `clienti`(`id_cliente`, `via`, `cap`, `citta`,`numero_civico`,`credito`) VALUES (3,"via verdi", 25100 ,"Brescia", 20, 10);
INSERT INTO `clienti`(`id_cliente`, `via`, `cap`, `citta`,`numero_civico`,`credito`) VALUES (4,"via verdi", 25100 ,"Brescia", 40, 700);

INSERT INTO `ordini`(`id_ordine`, `data_oridne`, `data_inoltro`, `id_stato`,`data_ricezione`,`data_consegna`, `id_cliente`,`id_corriere`) VALUES (1,2019-10-20, 2019-10-21, 1, 2019-10-22, 2019-10-23, 1, 1);
INSERT INTO `ordini`(`id_ordine`, `data_oridne`, `data_inoltro`, `id_stato`,`data_ricezione`,`data_consegna`, `id_cliente`,`id_corriere`) VALUES (2,2019-10-20, 2019-10-21, 2, 2019-10-22, 2019-10-23, 2, 2);
INSERT INTO `ordini`(`id_ordine`, `data_oridne`, `data_inoltro`, `id_stato`,`data_ricezione`,`data_consegna`, `id_cliente`,`id_corriere`) VALUES (3,2019-10-21, 2019-10-22, 3, 2019-10-23, 2019-10-24, 3, 3);
INSERT INTO `ordini`(`id_ordine`, `data_oridne`, `data_inoltro`, `id_stato`,`data_ricezione`,`data_consegna`, `id_cliente`,`id_corriere`) VALUES (4,2019-10-21, 2019-10-22, 4, 2019-10-23, 2019-10-24, 4, 4);

INSERT INTO `contiene`(`id_ordine`, `id_prodotto`) VALUES (1,1);
INSERT INTO `contiene`(`id_ordine`, `id_prodotto`) VALUES (2,2);
INSERT INTO `contiene`(`id_ordine`, `id_prodotto`) VALUES (3,2);
INSERT INTO `contiene`(`id_ordine`, `id_prodotto`) VALUES (4,3);

