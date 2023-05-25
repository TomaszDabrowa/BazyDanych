CREATE DATABASE geochronologia;
USE geochronologia;

-- TWORZENIE TABELI GeoEon

CREATE TABLE GeoEon ( 
id_eon INT AUTO_INCREMENT PRIMARY KEY,
nazwa_eon  VARCHAR(25) 
);
-- Wstawienie wartosci
INSERT INTO GeoEon (nazwa_eon) VALUES ('Fanerozoik');

-- TWORZENIE TABELI GeoEra

CREATE TABLE GeoEra ( 
id_era INT AUTO_INCREMENT PRIMARY KEY,
id_eon INT NOT NULL,
FOREIGN KEY (id_eon) REFERENCES GeoEon(id_eon),
nazwa_era  VARCHAR(25) 
);
-- wstawianie wartosci
INSERT INTO GeoEra (id_eon,nazwa_era) VALUES (1,'Kenozoik'),(1,'Mezozoik'),(1,'Paleozoik');
select * from GeoEra;

-- TWORZENIE TABELI GeoOkres

CREATE TABLE GeoOkres ( 
id_okres INT AUTO_INCREMENT PRIMARY KEY,
id_era INT NOT NULL,
FOREIGN KEY (id_era) REFERENCES GeoEra(id_era),
nazwa_okres  VARCHAR(25) 
);

-- Wstawianie wartosci 
INSERT INTO GeoOkres (id_era,nazwa_okres) VALUES
(1,'Czwartorząd'),
(1,'Neogen'),
(1,'Paleogen'),
(2,'Kread'),
(2,'Jura'),
(2,'Trias'),
(3,'Perm'),
(3,'Karbon'),
(3,'Dewon');

-- TWORZENIE TABLICY GeoEpoka
CREATE TABLE GeoEpoka ( 
id_epoka INT AUTO_INCREMENT PRIMARY KEY,
id_okres INT NOT NULL,
FOREIGN KEY (id_okres) REFERENCES GeoOkres(id_okres),
nazwa_epoka  VARCHAR(25) 
);
-- wstawienie 
INSERT INTO GeoEpoka (id_okres,nazwa_epoka) VALUES
(1,'Halocen'),
(1,'Plejstocen'),
(2,'Pilocen'),
(2,'Miocen'),
(3,'Oligocen'),
(3,'Eocen'),
(3,'Paleocen'),
(4,'Gorna'),
(4,'Dolna'),
(5,'Gorna'),
(5,'Srodkowa'),
(5,'Dolna'),
(6,'Gorna'),
(6,'Srodkowa'),
(6,'Dolna'),
(7,'Gorny'),
(7,'Dolny'),
(8,'Gorny'),
(8,'Dolny'),
(9,'Gorny'),
(9,'Srodkowy'),
(9,'Dolny');

-- TWORZENIE TABELI GeoPietro
CREATE TABLE GeoPietro ( 
id_pietro INT AUTO_INCREMENT PRIMARY KEY,
id_epoka INT NOT NULL,
FOREIGN KEY (id_epoka) REFERENCES GeoEpoka(id_epoka),
nazwa_pietro  VARCHAR(26) 
);

-- Wstawienie wartosci
INSERT INTO GeoPietro VALUES
	(1,1,'megalaj'),
	(2,1,'northgrip'),
	(3,1,'grenland'),
	(4,2,'późny[b]'),
	(5,2,'chiban'),
	(6,2,'kalabr'),
	(7,2,'gelas'),
	(8,3,'piacent'),
	(9,3,'zankl'),
	(10,4,'messyn'),
	(11,4,'torton'),
	(12,4,'serrawal'),
	(13,4,'lang'),
	(14,4,'burdygał'),
	(15,4,'akwitan'),
	(16,5,'szat'),
	(17,5,'rupel'),
	(18,6,'priabon'),
	(19,6,'barton'),
	(20,6,'lutet'),
	(21,6,'iprez'),
	(22,7,'tanet'),
	(23,7,'zeland'),
	(24,7,'dan'),
	(25,8,'mastrycht'),
	(26,8,'kampan'),
	(27,8,'santon'),
	(28,8,'koniak'),
	(29,8,'turon'),
	(30,8,'cenoman'),
	(31,9,'alb'),
	(32,9,'apt'),
	(33,9,'barrem'),
	(34,9,'hoteryw'),
	(35,9,'walanżyn'),
	(36,9,'berrias'),
	(37,10,'tyton'),
	(38,10,'kimeryd'),
	(39,10,'oksford'),
	(40,11,'kelowej'),
	(41,11,'baton'),
	(42,11,'bajos'),
	(43,11,'aalen'),
	(44,12,'toark'),
	(45,12,'pliensbach'),
	(46,12,'synemur'),
	(47,12,'hettang'),
	(48,13,'retyk'),
	(49,13,'noryk'),
	(50,13,'karnik'),
	(51,14,'ladyn'),
	(52,14,'anizyk'),
	(53,15,'olenek'),
	(54,15,'ind'),
	(55,16,'czangsing'),
	(56,16,'wucziaping'),
	(57,16,'kapitan'),
	(58,16,'word'),
	(59,16,'road'),
	(60,17,'kungur'),
	(61,17,'artinsk'),
	(62,17,'sakmar'),
	(63,17,'assel'),
	(64,18,'gżel'),
	(65,18,'kasimow'),
	(66,18,'moskow'),
	(67,18,'baszkir'),
	(68,19,'serpuchow'),
	(69,19,'wizen'),
	(70,19,'turnej'),
	(71,20,'famen'),
	(72,20,'fran'),
	(73,21,'żywet'),
	(74,21,'eifel'),
	(75,22,'ems'),
	(76,22,'prag'),
	(77,22,'lochkow');
    
-- Tworzenie tabeli dziesiec
    
CREATE TABLE dziesiec(
cyfra int, 
bit int
);
INSERT INTO dziesiec VALUES
	(0, 1),
	(1, 1),
	(2, 0),
	(3, 1),
	(4, 0),
	(5, 0),
	(6, 1),
	(7, 0),
	(8, 0),
	(9, 1);

-- Tworzymy tabele milion

CREATE TABLE milion(liczba int,cyfra int, bit int);
INSERT INTO milion SELECT a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra
+ 10000*a5.cyfra + 100000*a6.cyfra AS liczba , a1.cyfra AS cyfra, a1.bit AS bit
FROM dziesiec a1, dziesiec a2, dziesiec a3, dziesiec a4, dziesiec a5, dziesiec a6;

-- Pokazanie tabeli
Select * from GeoEon;
Select * from GeoEra;
Select * from GeoOkres;
Select * from GeoEpoka;
Select * from GeoPietro;
Select * from dziesiec;

-- TWORZENIE ZDENORMALIZOWANEJ TABELI

CREATE TABLE zdenormalizowana AS (SELECT * FROM GeoPietro NATURAL JOIN GeoEpoka 
NATURAL JOIN GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon );
-- Musi byc natural join, bo jest duplikat id_epoka
select * from zdenormalizowana;

-- ZAPYTANIA
-- ZAPYTANIE 1 ZL
SELECT COUNT(*) FROM milion INNER JOIN zdenormalizowana ON 
(mod(milion.liczba,68)=(zdenormalizowana.id_pietro));

-- ZAPYTANIE 2 ZL

SELECT COUNT(*) FROM milion INNER JOIN GeoPietro ON 
(mod(milion.liczba,68)=GeoPietro.id_pietro) NATURAL JOIN GeoEpoka NATURAL JOIN 
GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon;

-- ZAPYTANIE 3 ZG
SELECT COUNT(*) FROM milion WHERE mod(milion.liczba,68)= 
(SELECT id_pietro FROM zdenormalizowana WHERE mod(milion.liczba,68)=(id_pietro));

-- ZAPYTANIE 4 ZG
SELECT COUNT(*) FROM milion WHERE mod(milion.liczba,68)
IN (SELECT geopietro.id_pietro FROM geopietro
NATURAL JOIN geoepoka NATURAL JOIN
geookres NATURAL JOIN geoera NATURAL JOIN geoeon);

-- INDEKSY
CREATE UNIQUE INDEX liczba_idx ON milion (liczba);
CREATE UNIQUE INDEX id_pietro_idx ON zdenormalizowana (id_pietro);
CREATE UNIQUE INDEX id_eon_idx ON GeoEon (id_eon);
CREATE UNIQUE INDEX id_era_idx ON GeoEra (id_era);
CREATE UNIQUE INDEX id_okres_idx ON GeoOkres (id_okres);
CREATE UNIQUE INDEX id_epoka_idx ON GeoEpoka (id_epoka);
CREATE UNIQUE INDEX id_pietroG_idx ON GeoPietro (id_pietro);

-- ZDJECIE INDEKSOW
DROP INDEX liczba_idx ON milion;
DROP INDEX id_pietro_idx ON zdenormalizowana;
DROP INDEX id_eon_idx ON GeoEon;
DROP INDEX id_era_idx ON GeoEra;
DROP INDEX id_okres_idx ON GeoOkres;
DROP INDEX id_epoka_idx ON GeoEpoka;
DROP INDEX id_pietroG_idx ON GeoPietro;






