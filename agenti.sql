create database befana;

create table agenti
(
	codiceAgente int(3),
	nomeAgente varchar(20),
	codiceZona int(3),
	stipendio decimal(8,2),
	primary key (codiceAgente)

);

create table clienti
(
	codiceCliente int(3),
	ragioneSociale varchar(20),
	partitaIva char(11),
	provinca char(2),
	agenteDiZona int(3),
	primary key (codiceCliente),
	foreign key (agenteDiZona) references agenti (codiceAgente)
);

/*popolo la tabella agenti*/

INSERT INTO `agenti`(`codiceAgente`, `nomeAgente`, `codiceZona`, `stipendio`) VALUES (1,"Bruno Mars", 1, 1250.33);

INSERT INTO `agenti`(`codiceAgente`, `nomeAgente`, `codiceZona`, `stipendio`) VALUES (2,"Sfera Ebbasta", 1, 250);

INSERT INTO `agenti`(`codiceAgente`, `nomeAgente`, `codiceZona`, `stipendio`) VALUES (3,"Luca Laurenti",2,125000);

INSERT INTO `agenti`(`codiceAgente`, `nomeAgente`, `codiceZona`, `stipendio`) VALUES (4,"Paolo Brosio",3,5000);


/*popolo la tabella clienti*/


INSERT INTO `clienti`(`codiceCliente`, `ragioneSociale`, `partitaIva`, `provinca`, `agenteDiZona`) VALUES (1,"ITIS Castelli","12312312312","BS",3);

INSERT INTO `clienti`(`codiceCliente`, `ragioneSociale`, `partitaIva`, `provinca`, `agenteDiZona`) VALUES (2,"Lunardi", "22222222222", "VR",4);

INSERT INTO `clienti`(`codiceCliente`, `ragioneSociale`, `partitaIva`, `provinca`, `agenteDiZona`) VALUES (3,"Calini", "33333333333", "BS",1);

INSERT INTO `clienti`(`codiceCliente`, `ragioneSociale`, `partitaIva`, `provinca`, `agenteDiZona`) VALUES (4,"Fortuny", "44444444444", "TO",1);



/*per aggiungere una colonna ad agenti*/

alter table agenti add provincia char(2);

/*per togliere una colonna ad agenti*/

alter table agenti add provincia;

/*Aggiorna tabella*/
UPDATE agenti SET provincia="BS" WHERE codiceAgente=1;
UPDATE agenti SET provincia="MI" WHERE codiceAgente=2;
UPDATE agenti SET provincia="VR" WHERE codiceAgente=3;
UPDATE agenti SET provincia="SA" WHERE codiceAgente=4;

/*aggiungo colonne*/
alter table clienti add n_civico varchar(4);
alter table clienti add via varchar(20);

UPDATE clienti SET via="riccobelli", n_civico="12a" WHERE codiceCliente=1;
UPDATE clienti SET via="gatti", n_civico="13a" WHERE codiceCliente=2;
UPDATE clienti SET via="scandale", n_civico="14a" WHERE codiceCliente=3;
UPDATE clienti SET via="botta", n_civico="14a" WHERE codiceCliente=4;

/*cancella tutti i valori di una colonna*/
ALTER TABLE clienti DROP COLUMN provinca;

/*elimina tutta la tabella*/
DELETE FROM clienti;

/*modifica nome colonna*/
ALTER TABLE clienti CHANGE provinca privincia char(2);

/*elimina spacificando un campo*/
DELETE FROM agenti WHERE provincia = "BS";

/*cambiare il tipo di dato di una tabella*/
ALTER TABLE clienti MODIDIFY COLUMN prova varchar(3);

/*mostra la tabella clienti*/
SELECT * FROM clienti;

/*mostra la tabella clienti dove la provincia è brescia*/
SELECT * FROM clienti WHERE provincia="BS";

/*mostra la tabella clienti la cui ragione sociale inizia per c*/
SELECT * FROM clienti WHERE ragioneSociale LIKE "c%";

/*mostra la tabella clienti la cui ragione sociale finisce per c*/
SELECT * FROM clienti WHERE ragioneSociale LIKE "%c";

/*mostra la tabella clienti la cui ragione sociale contiene la lettera c*/
SELECT * FROM clienti WHERE ragioneSociale LIKE "%c%";

/*mostra via e civico dove la RS è itis Castelli*/
SELECT via, n_civico FROM clienti WHERE ragioneSociale ="ITIS Castelli";

/*join tra due tabelle e ricerca l'associazione tra clienti e agenti secondo le zome*/
SELECT clienti.ragioneSociale AS istituto, agenti.nomeAgente AS bond
	FROM clienti, agenti
		WHERE clienti.agenteDiZona = agenti.codiceAgente
		ORDER BY clienti.ragioneSociale /*DESC decrescente*/
