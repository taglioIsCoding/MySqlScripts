create database filmografie;

create table REGISTI (
   Nome varchar(20),
   DataNascita date,
   Nazionalità varchar(30),

   primary key(Nome)
 );

  create table ATTORI (
    Nome varchar(20),
    DataNascita date,
    Nazionalità varchar(30),

    primary key(Nome)
  );

create table FILM (
    Titolo varchar(20),
    NomeRegista varchar(30),
    Anno int(4),

    primary key(Titolo),
    foreign key (NomeRegista) references REGISTI (Nome)

  );

create table INTERPRETA (
  Attore varchar(20),
  Film varchar(20),
  Personaggio varchar(20),

  primary key (ATTORE, FILM),
  foreign key (ATTORE) references ATTORI(Nome),
  foreign key (Film) references FILM(Titolo)
);

create table CINEMA (
   Citta varchar(20),
   NomeCinema varchar(20),
   NumSale int (5),
   NumPosti int(10),


   primary key(citta,NomeCinema)

 );

 create table proiezioni(
  citta varchar(20),
     nomecinema varchar(20),
     TitoloFilm varchar(20),

     PRIMARY key (citta, nomecinema, TitoloFilm),
     FOREIGN KEY (citta, nomecinema) REFERENCES cinema(citta, nomeCinema),
     FOREIGN key (titoloFilm) REFERENCES film(titolo)
 )

 INSERT INTO `REGISTI`(`nome`, `DataNascita`, `Nazionalità`) VALUES ("Sorrentino",'19981011',"Italia");
 INSERT INTO `REGISTI`(`nome`, `DataNascita`, `Nazionalità`) VALUES ("Swanky",'19970910',"Russia");
 INSERT INTO `REGISTI`(`nome`, `DataNascita`, `Nazionalità`) VALUES ("Connery",'19960809',"Usa");
 INSERT INTO `REGISTI`(`nome`, `DataNascita`, `Nazionalità`) VALUES ("Tarantito",'19951212',"Messico");

 INSERT INTO `ATTORI`(`nome`, `DataNascita`, `Nazionalità`) VALUES ("Boldi",'19951212',"Italia");
 INSERT INTO `ATTORI`(`nome`, `DataNascita`, `Nazionalità`) VALUES ("DeSica",'19951212',"Italia");
 INSERT INTO `ATTORI`(`nome`, `DataNascita`, `Nazionalità`) VALUES ("VinDiesel",'19951212',"Usa");
 INSERT INTO `ATTORI`(`nome`, `DataNascita`, `Nazionalità`) VALUES ("TheRock",'19951212',"Francia");
 INSERT INTO `ATTORI`(`nome`, `DataNascita`, `Nazionalità`) VALUES ("Huqi",'19951212',"Albania");

 INSERT INTO `FILM`(`titolo`, `NomeRegista`, `anno`) VALUES ("Cinepanettone","Sorrentino",2020);
 INSERT INTO `FILM`(`titolo`, `NomeRegista`, `anno`) VALUES ("Cinepanettone2","Sorrentino",2020);
 INSERT INTO `FILM`(`titolo`, `NomeRegista`, `anno`) VALUES ("Cinepanettone3","Sorrentino",2021);
 INSERT INTO `FILM`(`titolo`, `NomeRegista`, `anno`) VALUES ("FastAndFurious","Tarantito",2019);
 INSERT INTO `FILM`(`titolo`, `NomeRegista`, `anno`) VALUES ("IoEte","Swanky",2018);
 INSERT INTO `FILM`(`titolo`, `NomeRegista`, `anno`) VALUES ("IlNomeDiTuoPApa","Connery",2017);
 INSERT INTO `FILM`(`titolo`, `NomeRegista`, `anno`) VALUES ("PulciniScatenati","Sorrentino",2016);

 INSERT INTO `CINEMA`(`Citta`, `NomeCinema`, `NumSale`, `NumPosti`) VALUES ("Bologna","Wiz", 20, 3000);
 INSERT INTO `CINEMA`(`Citta`, `NomeCinema`, `NumSale`, `NumPosti`) VALUES ("Brescia","Oz", 10, 1500);
 INSERT INTO `CINEMA`(`Citta`, `NomeCinema`, `NumSale`, `NumPosti`) VALUES ("Trento","Grande", 5, 400);

 INSERT INTO `INTERPRETA`(`ATTORE`, `film`, `Personaggio`) VALUES ("Boldi","Cinepanettone","Sasso");
 INSERT INTO `INTERPRETA`(`ATTORE`, `film`, `Personaggio`) VALUES ("DeSica","Cinepanettone","Morto");
 INSERT INTO `INTERPRETA`(`ATTORE`, `film`, `Personaggio`) VALUES ("VinDiesel","FastAndFurious","Figo");
 INSERT INTO `INTERPRETA`(`ATTORE`, `film`, `Personaggio`) VALUES ("Huqi","PulciniScatenati","Pulcino");
 INSERT INTO `INTERPRETA`(`ATTORE`, `film`, `Personaggio`) VALUES ("TheRock","PulciniScatenati","Pulcino");
 INSERT INTO `INTERPRETA`(`ATTORE`, `film`, `Personaggio`) VALUES ("DeSica","IoEte","Polizziotto");
 INSERT INTO `INTERPRETA`(`ATTORE`, `film`, `Personaggio`) VALUES ("VinDiesel","IoEte","Prete");
 INSERT INTO `INTERPRETA`(`ATTORE`, `film`, `Personaggio`) VALUES ("Boldi","IlNomeDiTuoPApa","Papa");

 INSERT INTO `proiezioni`(`citta`, `nomeCinema`, `titoloFilm`) VALUES ("Bologna","Wiz","Cinepanettone");
 INSERT INTO `proiezioni`(`citta`, `nomeCinema`, `titoloFilm`) VALUES ("Brescia","Oz","FastAndFurious");
 INSERT INTO `proiezioni`(`citta`, `nomeCinema`, `titoloFilm`) VALUES ("Bologna","Wiz","PulciniScatenati");
 INSERT INTO `proiezioni`(`citta`, `nomeCinema`, `titoloFilm`) VALUES ("Bologna","Wiz","IoEte");
 INSERT INTO `proiezioni`(`citta`, `nomeCinema`, `titoloFilm`) VALUES ("Trento","Grande","IoEte");
 INSERT INTO `proiezioni`(`citta`, `nomeCinema`, `titoloFilm`) VALUES ("Brescia","Oz","IlNomeDiTuoPApa");


/*Query*/
SELECT DISTINCT Nazionalità FROM `registi` join film on registi.Nome = film.NomeRegista where film.anno = 2020 and film.anno<>2019
