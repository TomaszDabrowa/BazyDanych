--Zad1
CREATE DATABASE firma;
USE firma;
SET language 'Polish';

--Zad2
CREATE SCHEMA ksiegowosc;

--Zad4
CREATE TABLE ksiegowosc.pracownicy 
(
id_pracownika INT PRIMARY KEY,
imie VARCHAR(50) NOT NULL,
nazwisko VARCHAR(70) NOT NULL,
adres VARCHAR(120),
telefon INT,
);

CREATE TABLE ksiegowosc.godziny (
id_godziny INT PRIMARY KEY,
_data DATE,
liczba_godzin INT NOT NULL,
id_pracownika INT NOT NULL,
CONSTRAINT id_pracownika_fk FOREIGN KEY (id_pracownika) 
REFERENCES ksiegowosc.pracownicy (id_pracownika)
);

CREATE TABLE ksiegowosc.pensja (
id_pensji INT PRIMARY KEY,
stanowisko VARCHAR(70),
kwota FLOAT NOT NULL,
);

CREATE TABLE ksiegowosc.premia (
id_premii INT PRIMARY KEY,
rodzaj VARCHAR(70),
kwota FLOAT
);

CREATE TABLE ksiegowosc.wynagrodzenia (
id_wynagrodzenia INT PRIMARY KEY,
_data DATE NOT NULL,
id_pracownika INT NOT NULL,
id_godziny INT NOT NULL,
id_pensji INT NOT NULL,
id_premii INT NOT NULL,
CONSTRAINT id_pracownika_FK_wynagrodzenia
FOREIGN KEY (id_pracownika) 
REFERENCES ksiegowosc.pracownicy(id_pracownika),
CONSTRAINT id_godziny_FK
FOREIGN KEY (id_godziny) 
REFERENCES ksiegowosc.godziny(id_godziny),
CONSTRAINT id_pensji_FK
FOREIGN KEY (id_pensji) 
REFERENCES ksiegowosc.pensja(id_pensji),
CONSTRAINT id_premii_FK
FOREIGN KEY (id_premii) 
REFERENCES ksiegowosc.premia(id_premii)
);
--dodanie opisów do tabeli pracownicy
EXEC sys.sp_addextendedproperty
@name = N'Opis tabeli o pracownikach',
@value = N'Imię, nazwisko, adres i nr telefonu pracowników',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'pracownicy';
GO

--dodanie opisów do tabeli godziny
EXEC sys.sp_addextendedproperty
@name = N'Opis tabeli zawierającej godziny',
@value = N'Informacje o przepracowanych godzinach',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'godziny';
GO

--dodanie opisów do tabeli pensja
EXEC sys.sp_addextendedproperty
@name = N'Opis tabeli o pensjach',
@value = N'Informacje o pensjach na danych stanowiskach',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'pensja';
GO

--dodanie opisów do tabeli premia
EXEC sys.sp_addextendedproperty
@name = N'Opis tabeli informującej o premiach',
@value = N'Informacje o wysokości i rodzaju premii',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'premia';
GO

--dodanie opisów do tabeli wynagrodzenia
EXEC sys.sp_addextendedproperty
@name = N'Opis tabeli informującej o wynagrodzeniach',
@value = N'Tabela łącząca pracowników z pensją i premią',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'wynagrodzenia';
GO


--Zad 5
--dodanie rekordów
--do tabeli pracownicy

INSERT INTO ksiegowosc.pracownicy VALUES
(
1,
'Gaweł',
'Zawadzki',
'ul. Nurkowa 74 93-492 Łódź',
664628170
);

INSERT INTO ksiegowosc.pracownicy VALUES
(
2,
'Aron',
'Król',
'ul. Profesora Żuka Tomasza 144 70-880 Szczecin',
784275519
);

INSERT INTO ksiegowosc.pracownicy VALUES
(
3,
'Konstantyn',
'Tomaszewski',
'ul. Nowowiejskiego Feliksa 123 61-733 Poznań',
724476434
);

INSERT INTO ksiegowosc.pracownicy VALUES
(
4,
'Jarek',
'Zieliński',
'ul. Piaski 6085-563 Bydgoszcz',
516259972
);

INSERT INTO ksiegowosc.pracownicy VALUES
(
5,
'Dobrosław',
'Ostrowski',
'ul. Szaserów 140 04-306 Warszawa',
533478503
);

INSERT INTO ksiegowosc.pracownicy VALUES
(
6,
'Jolanta',
'Kowalska',
'ul. Mahoniowa 142 75-639 Koszalin',
888564237
);

INSERT INTO ksiegowosc.pracownicy VALUES
(
7,
'Wiola',
'Szczepańska',
'ul. Irkucka 131 51-210 Wrocław',
668099893
);

INSERT INTO ksiegowosc.pracownicy VALUES
(
8,
'matylda',
'Michalska',
'ul. Kokoryczki 12 04-191 Warszawa',
889838778
);

INSERT INTO ksiegowosc.pracownicy VALUES
(
9,
'Bogumiła',
'Rutkowska',
'ul. Jasna 142 05-402 Otwock',
662544786
);

INSERT INTO ksiegowosc.pracownicy VALUES
(
10,
'Radosława',
'Nowak',
'ul. Żmujdzka 127 31-217 Kraków',
517201446
);
select * from ksiegowosc.pracownicy

--dodanie godzin
INSERT INTO ksiegowosc.godziny VALUES
(
1,
'2020-03-01',
9,
1
);

INSERT INTO ksiegowosc.godziny VALUES
(
2,
'2020-03-01',
8,
2
);

INSERT INTO ksiegowosc.godziny VALUES
(
3,
'2020-03-01',
9,
3
);

INSERT INTO ksiegowosc.godziny VALUES
(
4,
'2020-03-01',
8,
4
);

INSERT INTO ksiegowosc.godziny VALUES
(
5,
'2020-03-01',
10,
5
);

INSERT INTO ksiegowosc.godziny VALUES
(
6,
'2020-03-01',
5,
6
);

INSERT INTO ksiegowosc.godziny VALUES
(
7,
'2020-03-01',
10,
7
);

INSERT INTO ksiegowosc.godziny VALUES
(
8,
'2020-03-01',
9,
8
);

INSERT INTO ksiegowosc.godziny VALUES
(
9,
'2020-03-01',
2,
9
);

INSERT INTO ksiegowosc.godziny VALUES
(
10,
'2020-03-01',
9,
10
);

select * from ksiegowosc.godziny

-- Uzupełnianie pensji

INSERT INTO ksiegowosc.pensja VALUES 
(
1,
'kierownik',
7000
);

INSERT INTO ksiegowosc.pensja VALUES 
(
2,
'kierownik',
7500
);

INSERT INTO ksiegowosc.pensja VALUES 
(
3,
'kierownik',
6500
);

INSERT INTO ksiegowosc.pensja VALUES 
(
4,
'przedstawiciel handlowy',
5600
);

INSERT INTO ksiegowosc.pensja VALUES 
(
5,
'specjalista BHP',
5000
);

INSERT INTO ksiegowosc.pensja VALUES 
(
6,
'księgowa',
3700
);

INSERT INTO ksiegowosc.pensja VALUES 
(
7,
'główna księgowa',
5650
);

INSERT INTO ksiegowosc.pensja VALUES 
(
8,
'obsługa sprzątająca',
3200
);

INSERT INTO ksiegowosc.pensja VALUES 
(
9,
'portier',
3100
);

INSERT INTO ksiegowosc.pensja VALUES 
(
10,
'specjalista IT',
8000
);

select * from ksiegowosc.pensja

-- uzupełnianie premii

INSERT INTO ksiegowosc.premia VALUES
(
1,
'uznaniowa',
500
);

INSERT INTO ksiegowosc.premia VALUES
(
2,
'uznaniowa',
600
);

INSERT INTO ksiegowosc.premia VALUES
(
3,
'ustawowa',
1000
);

INSERT INTO ksiegowosc.premia VALUES
(
4,
'motywacyjna',
250
);

INSERT INTO ksiegowosc.premia VALUES
(
5,
'uznaniowa',
500
);

INSERT INTO ksiegowosc.premia VALUES
(
6,
'uznaniowa',
500
);

INSERT INTO ksiegowosc.premia VALUES
(
7,
'regulaminowa',
600
);

INSERT INTO ksiegowosc.premia VALUES
(
8,
'uznaniowa',
650
);

INSERT INTO ksiegowosc.premia VALUES
(
9,
'uznaniowa',
0
);

INSERT INTO ksiegowosc.premia VALUES
(
10,
'uznaniowa',
10
);

select * from ksiegowosc.premia

-- uzupełnianie wynagrodzenia

INSERT INTO ksiegowosc.wynagrodzenia VALUES
(
1,
'2020-03-01',
1,
1,
1,
1
);

INSERT INTO ksiegowosc.wynagrodzenia VALUES
(
2,
'2020-03-01',
2,
2,
2,
2
);

INSERT INTO ksiegowosc.wynagrodzenia VALUES
(
3,
'2020-03-01',
3,
3,
3,
3
);

INSERT INTO ksiegowosc.wynagrodzenia VALUES
(
4,
'2020-03-01',
4,
4,
4,
4
);

INSERT INTO ksiegowosc.wynagrodzenia VALUES
(
5,
'2020-03-01',
5,
5,
5,
5
);

INSERT INTO ksiegowosc.wynagrodzenia VALUES
(
6,
'2020-03-01',
6,
6,
6,
6
);

INSERT INTO ksiegowosc.wynagrodzenia VALUES
(
7,
'2020-03-01',
7,
7,
7,
7
);

INSERT INTO ksiegowosc.wynagrodzenia VALUES
(
8,
'2020-03-01',
8,
8,
8,
8
);

INSERT INTO ksiegowosc.wynagrodzenia VALUES
(
9,
'2020-03-01',
9,
9,
9,
9
);

INSERT INTO ksiegowosc.wynagrodzenia VALUES
(
10,
'2020-03-01',
10,
10,
10,
10
);

select * from ksiegowosc.wynagrodzenia

--Zad 6
-- a)
SELECT pracownicy.id_pracownika, pracownicy.nazwisko
FROM ksiegowosc.pracownicy;

-- b)
SELECT pracownicy.id_pracownika
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenia
ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
JOIN ksiegowosc.pensja
ON wynagrodzenia.id_pensji = pensja.id_pensji
WHERE kwota > 1000;

--c)
SELECT prac.id_pracownika
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenia wyn
ON prac.id_pracownika = wyn.id_pracownika
JOIN ksiegowosc.premia pre
ON wyn.id_premii = pre.id_premii
JOIN ksiegowosc.pensja pen
ON wyn.id_pensji = pen.id_pensji
WHERE pre.kwota = 0 AND pen.kwota > 2000;

-- d)
SELECT *
FROM ksiegowosc.pracownicy
WHERE imie LIKE 'J%';

-- e)
SELECT *
FROM ksiegowosc.pracownicy
WHERE imie LIKE '%a' AND nazwisko LIKE '%n%';

-- f)
SELECT prac.imie, prac.nazwisko,
nadgodziny = 30*godz.liczba_godzin - 160
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenia wyn
ON prac.id_pracownika = wyn.id_pracownika
JOIN ksiegowosc.godziny godz
ON wyn.id_godziny = godz.id_godziny;

-- g)
SELECT prac.imie, prac.nazwisko
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenia wyn
ON prac.id_pracownika = wyn.id_pracownika
JOIN ksiegowosc.pensja pen
ON pen.id_pensji = wyn.id_pensji
WHERE pen.kwota BETWEEN 1500 AND 3000;

-- h)
SELECT prac.imie, prac.nazwisko
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenia wyn
ON prac.id_pracownika = wyn.id_pracownika
JOIN ksiegowosc.godziny godz
ON wyn.id_godziny = godz.id_godziny
JOIN ksiegowosc.premia pre
ON pre.id_premii = wyn.id_premii
WHERE 30*godz.id_godziny - 160 > 0 AND pre.kwota = 0;

-- i)
SELECT prac.imie, prac.nazwisko, pen.kwota
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenia wyn
ON prac.id_pracownika = wyn.id_pracownika
JOIN ksiegowosc.pensja pen
ON pen.id_pensji = wyn.id_pensji
ORDER BY pen.kwota ASC;

-- j)
SELECT prac.imie, prac.nazwisko, pen.kwota,
pensja_i_premia = pen.kwota + pre.kwota
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenia wyn
ON prac.id_pracownika = wyn.id_pracownika
JOIN ksiegowosc.pensja pen
ON pen.id_pensji = wyn.id_pensji
JOIN ksiegowosc.premia pre
ON pre.id_premii = wyn.id_premii
ORDER BY pen.kwota+pre.kwota DESC;

-- k)
SELECT pen.stanowisko, COUNT(prac.nazwisko) AS ilość_pracowników
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenia wyn
ON wyn.id_pracownika = prac.id_pracownika
JOIN ksiegowosc.pensja pen
ON pen.id_pensji = wyn.id_pensji
GROUP BY pen.stanowisko;

-- l)
SELECT
stanowisko = 'kierownik',
AVG(kwota) AS średnia_pensji, 
MIN(kwota) AS minimalna_pensja, 
MAX(kwota) AS maksymalna_pensja
FROM ksiegowosc.pensja
WHERE pensja.stanowisko = 'kierownik';

-- m)
SELECT SUM(pen.kwota + pre.kwota)
FROM ksiegowosc.wynagrodzenia wyn
JOIN ksiegowosc.pensja pen
ON pen.id_pensji = wyn.id_pensji
JOIN ksiegowosc.premia pre
ON pre.id_premii = wyn.id_premii;

-- f)
SELECT pen.stanowisko, 
SUM(pen.kwota + pre.kwota) AS Suma_wynagrodzeń
FROM ksiegowosc.pensja pen
JOIN ksiegowosc.wynagrodzenia wyn
ON wyn.id_pensji = pen.id_pensji
JOIN ksiegowosc.premia pre
ON pre.id_premii = wyn.id_premii
GROUP BY pen.stanowisko;

-- g)
SELECT pen.stanowisko, 
COUNT(pre.kwota) AS ilość_premii
FROM ksiegowosc.pensja pen
JOIN ksiegowosc.wynagrodzenia wyn
ON pen.id_pensji = wyn.id_pensji
JOIN ksiegowosc.premia pre
ON pre.id_premii = wyn.id_premii
GROUP BY pen.stanowisko;

-- h)
DELETE prac 
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenia wyn
ON wyn.id_pracownika = prac.id_pracownika
JOIN ksiegowosc.pensja pen
ON pen.id_pensji = wyn.id_pensji
WHERE pen.kwota < 1200;

--select * from ksiegowosc.pracownicy