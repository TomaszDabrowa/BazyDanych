CREATE DATABASE	firma;
CREATE SCHEMA  rozliczenia;

--Tworzenie tabel

CREATE TABLE rozliczenia.pracownicy (
id_pracownika INT PRIMARY KEY,
imie VARCHAR(50),
nazwisko VARCHAR(70),
adres VARCHAR(120),
telefon INT,
);

ALTER TABLE rozliczenia.pracownicy
ALTER COLUMN nazwisko VARCHAR(70) NOT NULL;

CREATE TABLE rozliczenia.godziny (
id_godziny INT PRIMARY KEY,
_data DATE,
liczba_godzin INT NOT NULL,
id_pracownika INT NOT NULL,
CONSTRAINT id_pracownika_fk FOREIGN KEY (id_pracownika) 
REFERENCES rozliczenia.pracownicy (id_pracownika)
);


CREATE TABLE rozliczenia.pensje (
id_pensji INT PRIMARY KEY,
stanowisko VARCHAR(70),
kwota FLOAT NOT NULL,
id_premii INT NOT NULL,
CONSTRAINT id_premii_FK FOREIGN KEY (id_premii) 
REFERENCES rozliczenia.premie (id_premii)
);

CREATE TABLE rozliczenia.premie (
id_premii INT PRIMARY KEY,
rodzaj VARCHAR(70),
kwota FLOAT NOT NULL,
);

--Wypełnianie tabel rekordami

INSERT INTO rozliczenia.pracownicy VALUES
(
10,
'Grzegorz',
'Dąbrowski',
'ul. Łotewska 50 25-116 Kielce',
664628170
);

Select * FROM rozliczenia.pracownicy

INSERT INTO rozliczenia.premie VALUES
(
10,
'motywacyjna',
500
);

select * from rozliczenia.premie

INSERT INTO rozliczenia.pensje VALUES
(
10,
'prezes',
9500,
10
);

select * from rozliczenia.pensje;

INSERT INTO rozliczenia.godziny VALUES
(
10,
'2020-03-01',
9,
10
);

select * from rozliczenia.godziny;

-- Zad 5 Wyświetlanie nazwisk i adresów pracowników

SELECT pracownicy.nazwisko, pracownicy.adres FROM rozliczenia.pracownicy;

-- Zad 6 rozdzielenie daty 

SELECT godziny.id_godziny, DATEPART(weekday,[_data]) AS DzienTygodnia, 
DATEPART(month,[_data]) AS Miesiac,
godziny.liczba_godzin, godziny.id_pracownika 
FROM rozliczenia.godziny;

-- Zad 7 
SELECT pensje.id_pensji, pensje.stanowisko, id_premii,
pensje.kwota AS kwota_brutto, kwota_netto = 0.732*[kwota]
FROM rozliczenia.pensje;