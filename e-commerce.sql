/**
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
