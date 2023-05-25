-- Database: geochronologia

-- DROP DATABASE IF EXISTS geochronologia;

--CREATE DATABASE geochronologia
--    WITH
--    OWNER = postgres
--    ENCODING = 'UTF8'
--    LC_COLLATE = 'Polish_Poland.1252'
--    LC_CTYPE = 'Polish_Poland.1252'
--    TABLESPACE = pg_default
--    CONNECTION LIMIT = -1
--    IS_TEMPLATE = False;

-- TWORZENIE TABEL

CREATE TABLE GeoEon
(
id_eon INTEGER NOT NULL PRIMARY KEY,
nazwa_eon VARCHAR(50) NOT NULL
);

CREATE TABLE GeoEra
(
id_era INTEGER NOT NULL PRIMARY KEY,
id_eon INTEGER REFERENCES GeoEon(id_eon),
nazwa_era VARCHAR(50) NOT NULL
);

CREATE TABLE GeoOkres
(
id_okres INTEGER NOT NULL PRIMARY KEY,
id_era INTEGER REFERENCES GeoEra(id_era),
nazwa_okres VARCHAR(50) NOT NULL
);

CREATE TABLE GeoWiek
(
id_lat INTEGER NOT NULL PRIMARY KEY,
lat INTEGER NOT NULL
);

CREATE TABLE GeoEpoka
(
id_epoka INTEGER NOT NULL PRIMARY KEY,
id_okres INTEGER REFERENCES GeoOkres(id_okres),
id_lat INTEGER REFERENCES GeoWiek(id_lat),
nazwa_epoka VARCHAR(50) NOT NULL
);

CREATE TABLE GeoPietro
(
id_pietro INTEGER NOT NULL PRIMARY KEY,
id_epoka INTEGER REFERENCES GeoEpoka(id_epoka),
nazwa_pietro VARCHAR(50) NOT NULL
);

-- WSTAWIANIE WARTOŚCI do GeoEon

INSERT INTO GeoEon VALUES(1, 'Fanerozoik');

-- WSTAWIANIE WARTOŚCI DO GeoEra

INSERT INTO GeoEra VALUES(1, 1, 'Paleozoik');
INSERT INTO GeoEra VALUES(2, 1, 'Mezozoik');
INSERT INTO GeoEra VALUES(3, 1, 'Kenozoik');

-- WSTAWIANIE WARTOŚCI DO GeoOkres

INSERT INTO GeoOkres VALUES(1, 1, 'Dewon');
INSERT INTO GeoOkres VALUES(2, 1, 'Karbon');
INSERT INTO GeoOkres VALUES(3, 1, 'Perm');
INSERT INTO GeoOkres VALUES(4, 2, 'Trias');
INSERT INTO GeoOkres VALUES(5, 2, 'Jura');
INSERT INTO GeoOkres VALUES(6, 2, 'Kreda');
INSERT INTO GeoOkres VALUES(7, 3, 'TrzeciorzedPaleogen');
INSERT INTO GeoOkres VALUES(8, 3, 'TrzeciorzedNeogen');
INSERT INTO GeoOkres VALUES(9, 3, 'Czwartorzed');

-- WSTAWIANIE WARTOŚCI DO GeoWiek

INSERT INTO GeoWiek VALUES(1, 395);
INSERT INTO GeoWiek VALUES(2, 345);
INSERT INTO GeoWiek VALUES(3, 280);
INSERT INTO GeoWiek VALUES(4, 230);
INSERT INTO GeoWiek VALUES(5, 195);
INSERT INTO GeoWiek VALUES(6, 140);
INSERT INTO GeoWiek VALUES(7, 65);
INSERT INTO GeoWiek VALUES(8, 22.5);
INSERT INTO GeoWiek VALUES(9, 1.8);
INSERT INTO GeoWiek VALUES(10, 0.010);

-- WSTAWIANIE WARTOŚCI DO GeoEpoka
INSERT INTO GeoEpoka VALUES(1, 1, 1, 'Dolny');
INSERT INTO GeoEpoka VALUES(2, 1, 1, 'Srodkowy');
INSERT INTO GeoEpoka VALUES(3, 1, 1, 'Gorny');
INSERT INTO GeoEpoka VALUES(4, 2, 2, 'Dolny');
INSERT INTO GeoEpoka VALUES(5, 2, 2, 'Gorny');
INSERT INTO GeoEpoka VALUES(6, 3, 3, 'Dolny');
INSERT INTO GeoEpoka VALUES(7, 3, 3, 'Gorny');
INSERT INTO GeoEpoka VALUES(8, 4, 4, 'Dolna');
INSERT INTO GeoEpoka VALUES(9, 4, 4, 'Srodkowa');
INSERT INTO GeoEpoka VALUES(10, 4, 4, 'Gorna');
INSERT INTO GeoEpoka VALUES(11, 5, 5, 'Dolna');
INSERT INTO GeoEpoka VALUES(12, 5, 5, 'Srodkowa');
INSERT INTO GeoEpoka VALUES(13, 5, 5, 'Gorna');
INSERT INTO GeoEpoka VALUES(14, 6, 6, 'Dolna');
INSERT INTO GeoEpoka VALUES(15, 6, 6, 'Gorna');
INSERT INTO GeoEpoka VALUES(16, 7, 7, 'Paleocen');
INSERT INTO GeoEpoka VALUES(17, 7, 7, 'Eocen');
INSERT INTO GeoEpoka VALUES(18, 7, 7, 'Oligocen');
INSERT INTO GeoEpoka VALUES(19, 8, 8, 'Miocen');
INSERT INTO GeoEpoka VALUES(20, 8, 8, 'Pliocen');
INSERT INTO GeoEpoka VALUES(21, 9, 9, 'Plejstocen');
INSERT INTO GeoEpoka VALUES(22, 9, 10, 'Holocen');

-- WSTAWIANIE WARTOŚCI DO GeoPietro

INSERT INTO GeoPietro VALUES(1, 1, 'Lachkow');
INSERT INTO GeoPietro VALUES(2, 1, 'Prag');
INSERT INTO GeoPietro VALUES(3, 1, 'Ems');
INSERT INTO GeoPietro VALUES(4, 2, 'Eifel');
INSERT INTO GeoPietro VALUES(5, 2, 'Zywet');
INSERT INTO GeoPietro VALUES(6, 3, 'Fran');
INSERT INTO GeoPietro VALUES(7, 3, 'Famen');
INSERT INTO GeoPietro VALUES(8, 6, 'Assel');
INSERT INTO GeoPietro VALUES(9, 6, 'Sakmar');
INSERT INTO GeoPietro VALUES(10, 6, 'Artinsk');
INSERT INTO GeoPietro VALUES(11, 6, 'Kangur');
INSERT INTO GeoPietro VALUES(12, 7, 'Ufa');
INSERT INTO GeoPietro VALUES(13, 7, 'Kazan');
INSERT INTO GeoPietro VALUES(14, 7, 'Tatar');
INSERT INTO GeoPietro VALUES(15, 8, 'Ind');
INSERT INTO GeoPietro VALUES(16, 8, 'Olenek');
INSERT INTO GeoPietro VALUES(17, 9, 'Anizyk');
INSERT INTO GeoPietro VALUES(18, 9, 'Ladyn');
INSERT INTO GeoPietro VALUES(19, 10, 'Karnik');
INSERT INTO GeoPietro VALUES(20, 10, 'Noryk');
INSERT INTO GeoPietro VALUES(21, 10, 'Retyk');
INSERT INTO GeoPietro VALUES(22, 11, 'Hetang');
INSERT INTO GeoPietro VALUES(23, 11, 'Synemur');
INSERT INTO GeoPietro VALUES(24, 11, 'Pliensbach');
INSERT INTO GeoPietro VALUES(25, 11, 'Toark');
INSERT INTO GeoPietro VALUES(26, 12, 'Aalen');
INSERT INTO GeoPietro VALUES(27, 12, 'Bajos');
INSERT INTO GeoPietro VALUES(28, 12, 'Baton');
INSERT INTO GeoPietro VALUES(29, 12, 'Kelowej');
INSERT INTO GeoPietro VALUES(30, 13, 'Oksford');
INSERT INTO GeoPietro VALUES(31, 13, 'Kimeryd');
INSERT INTO GeoPietro VALUES(32, 13, 'Tyton');
INSERT INTO GeoPietro VALUES(33, 14, 'Berias');
INSERT INTO GeoPietro VALUES(34, 14, 'Walanzyn');
INSERT INTO GeoPietro VALUES(35, 14, 'Hoteryw');
INSERT INTO GeoPietro VALUES(36, 14, 'Barrem');
INSERT INTO GeoPietro VALUES(37, 14, 'Apt');
INSERT INTO GeoPietro VALUES(38, 14, 'Alb');
INSERT INTO GeoPietro VALUES(39, 15, 'Cenoman');
INSERT INTO GeoPietro VALUES(40, 15, 'Turon');
INSERT INTO GeoPietro VALUES(41, 15, 'Koniak');
INSERT INTO GeoPietro VALUES(42, 15, 'Santon');
INSERT INTO GeoPietro VALUES(43, 15, 'Kampan');
INSERT INTO GeoPietro VALUES(44, 15, 'Mastrycht');
INSERT INTO GeoPietro VALUES(45, 16, 'Dan');
INSERT INTO GeoPietro VALUES(46, 16, 'Zeland');
INSERT INTO GeoPietro VALUES(47, 16, 'Tanet');
INSERT INTO GeoPietro VALUES(48, 17, 'Iprez');
INSERT INTO GeoPietro VALUES(49, 17, 'Lutet');
INSERT INTO GeoPietro VALUES(50, 17, 'Barton');
INSERT INTO GeoPietro VALUES(51, 17, 'Priabon');
INSERT INTO GeoPietro VALUES(52, 18, 'Rupel');
INSERT INTO GeoPietro VALUES(53, 18, 'Szat');
INSERT INTO GeoPietro VALUES(54, 19, 'Akwitan');
INSERT INTO GeoPietro VALUES(55, 19, 'Burdygal');
INSERT INTO GeoPietro VALUES(56, 19, 'Lang');
INSERT INTO GeoPietro VALUES(57, 19, 'Serrawal');
INSERT INTO GeoPietro VALUES(58, 19, 'Torton');
INSERT INTO GeoPietro VALUES(59, 19, 'Mesyn');
INSERT INTO GeoPietro VALUES(60, 20, 'Zankl');
INSERT INTO GeoPietro VALUES(61, 20, 'Piacent');
INSERT INTO GeoPietro VALUES(62, 20, 'Gelas');

-- TWORZENIE ZDENORMALIZOWANEJ GEOTABELI

SELECT GeoPietro.id_pietro, GeoPietro.nazwa_pietro, GeoEpoka.id_epoka,
GeoEpoka.nazwa_epoka, GeoOkres.id_okres, GeoOkres.nazwa_okres, GeoEra.id_era,
GeoEra.nazwa_era, GeoEon.id_eon, GeoEon.nazwa_eon
INTO GeoTabela
FROM GeoPietro
JOIN GeoEpoka ON GeoEpoka.id_epoka = GeoPietro.id_epoka
JOIN GeoOkres ON GeoOkres.id_okres = GeoEpoka.id_okres
JOIN GeoEra ON GeoEra.id_era = GeoOkres.id_era
JOIN GeoEon ON GeoEon.id_eon = GeoEra.id_eon;

-- DODANIE KLUCZA GŁÓWNEGO DO GEOTABELI
ALTER TABLE GeoTabela
ADD PRIMARY KEY (id_pietro);

-- TWORZENIE TABELI dziesiec
CREATE TABLE Dziesiec
(
	cyfra INTEGER NOT NULL PRIMARY KEY,
	bit INTEGER NOT NULL
);

-- WYPEŁNIENIE TABELI
INSERT INTO Dziesiec VALUES(0,1);
INSERT INTO Dziesiec VALUES(1,0);
INSERT INTO Dziesiec VALUES(2,0);
INSERT INTO Dziesiec VALUES(3,0);
INSERT INTO Dziesiec VALUES(4,1);
INSERT INTO Dziesiec VALUES(5,0);
INSERT INTO Dziesiec VALUES(6,1);
INSERT INTO Dziesiec VALUES(7,1);
INSERT INTO Dziesiec VALUES(8,1);
INSERT INTO Dziesiec VALUES(9,0);

-- TWORZENIE TABELI Milion

CREATE TABLE milion(liczba int,cyfra int, bit int);
INSERT INTO milion SELECT a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra
+ 10000*a5.cyfra + 100000*a6.cyfra AS liczba , a1.cyfra AS cyfra, a1.bit AS bit
FROM dziesiec a1, dziesiec a2, dziesiec a3, dziesiec a4, dziesiec a5, dziesiec a6;

-- 1 ZL
SELECT COUNT(*) FROM milion INNER JOIN GeoTabela ON 
(mod(Milion.liczba,68)=(GeoTabela.id_pietro));

-- 2 ZL
SELECT COUNT(*) FROM Milion INNER JOIN GeoPietro ON 
(mod(Milion.liczba,68)=GeoPietro.id_pietro) NATURAL JOIN GeoEpoka NATURAL JOIN 
GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon;

-- 3 ZG
SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,68)= 
(SELECT id_pietro FROM GeoTabela WHERE mod(Milion.liczba,68)=(id_pietro));

-- 4 ZG
SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,68)
IN (SELECT GeoPietro.id_pietro FROM GeoPietro
NATURAL JOIN GeoEpoka NATURAL JOIN
GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon); 

-- INDEKSY
CREATE UNIQUE INDEX liczba_index ON Milion (liczba);
CREATE UNIQUE INDEX id_pietro_index ON GeoTabela (id_pietro);
CREATE UNIQUE INDEX id_eon_index ON GeoEon (id_eon);
CREATE UNIQUE INDEX id_era_index ON GeoEra (id_era);
CREATE UNIQUE INDEX id_okres_index ON GeoOkres (id_okres);
CREATE UNIQUE INDEX id_epoka_index ON GeoEpoka (id_epoka);
CREATE UNIQUE INDEX id_pietroG_index ON GeoPietro (id_pietro);

