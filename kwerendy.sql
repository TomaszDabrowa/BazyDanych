-- a)
select * from ksiegowosc.pracownicy
ALTER TABLE ksiegowosc.pracownicy ALTER COLUMN telefon VARCHAR(12);
UPDATE ksiegowosc.pracownicy SET telefon = CONCAT('+48',telefon);

-- b)
SELECT 
CONCAT
(
	SUBSTRING(telefon,4,3),
	'-',
	SUBSTRING(telefon,7,3),
	'-',
	SUBSTRING(telefon,10,3)
)
AS telefon 
FROM ksiegowosc.pracownicy;

-- c)
SELECT TOP 1 UPPER(pracownicy.nazwisko) AS nazwisko, dlugoscNazwiska = LEN(nazwisko)
FROM ksiegowosc.pracownicy
ORDER BY dlugoscNazwiska DESC;

-- d)
SELECT 
HASHBYTES('MD5',imie) AS imie, 
HASHBYTES('MD5',nazwisko) AS nazwisko, 
HASHBYTES('MD5',adres) AS adres, 
HASHBYTES('MD5',telefon) AS telefon,
HASHBYTES('MD5',CAST(kwota AS VARCHAR(12))) AS kwota 
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenia wyn
ON wyn.id_pracownika = prac.id_pracownika
JOIN ksiegowosc.pensja pen
ON wyn.id_pensji = pen.id_pensji;

-- f)
SELECT prac.imie, prac.nazwisko, pen.kwota AS pensja,  pre.kwota AS premia
FROM ksiegowosc.pracownicy prac
LEFT OUTER JOIN ksiegowosc.wynagrodzenia wyn
ON wyn.id_pracownika = prac.id_pracownika
LEFT OUTER JOIN ksiegowosc.pensja pen
ON pen.id_pensji = wyn.id_pensji
LEFT OUTER JOIN ksiegowosc.premia pre
ON pre.id_premii = wyn.id_premii;

-- g)
SELECT
CONCAT
(
	'Pracownik ', prac.imie,' ',prac.nazwisko,
	', w dniu ', DATEPART(day,godz._data),'.',DATEPART(month,godz._data),'.',DATEPART(year,godz._data),
	' otrzymał pensję całkowitą na kwotę ',
	pen.kwota+pre.kwota, ' zł, gdzie wynagrodzenie zasadnicze wynosiło: ',
	pen.kwota, ' zł, premia: ', pre.kwota, ' zł, nadgodziny: ',
	20*(30*godz.liczba_godzin - 160), ' zł'
)
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenia wyn
ON wyn.id_pracownika = prac.id_pracownika
JOIN ksiegowosc.pensja pen
ON pen.id_pensji = wyn.id_pensji
JOIN ksiegowosc.premia pre
ON pre.id_premii = wyn.id_premii
JOIN ksiegowosc.godziny godz
ON godz.id_pracownika = wyn.id_pracownika;
