select * from HumanResources.EmployeePayHistory
select * from HumanResources.Employee
--Zad. 1.
--Wykorzystując wyrażenie CTE zbuduj zapytanie, które znajdzie informacje na temat stawki 
--pracownika oraz jego danych, a następnie zapisze je do tabeli tymczasowej 
--TempEmployeeInfo. Rozwiąż w oparciu o AdventureWorks
--ZMIEŃ BAZĘ NA TĄ BEZ LT

WITH zad1_CTE(NationalIDNumber,LoginID,JobTitle,BirthDate,MaritalStatus,Gender,HireDate,VacationHours,SickLeaveHours)
AS
(
	SELECT NationalIDNumber,LoginID,JobTitle,BirthDate,MaritalStatus,Gender,HireDate,VacationHours,SickLeaveHours
	FROM HumanResources.Employee pracownicy
	JOIN HumanResources.EmployeePayHistory wyplaty
	ON pracownicy.BusinessEntityID = wyplaty.BusinessEntityID
)

SELECT * INTO #TempEmployeeInfo FROM zad1_CTE;

SELECT * FROM #TempEmployeeInfo;

-- Zad. 2.
--Uzyskaj informacje na temat przychodów ze sprzedaży według firmy i kontaktu (za pomocą 
--CTE i bazy AdventureWorksL)
--ZMIEŃ BAZĘ NA LT

select * from SalesLT.Customer
select * from SalesLT.SalesOrderHeader

WITH zad2_CTE(CompanyContact,Revenue)
AS
(
	SELECT CONCAT(CompanyName, ' (', FirstName, LastName, ')') AS CompanyContact, TotalDue AS Revenue 
	FROM SalesLT.Customer AS klient
	JOIN SalesLT.SalesOrderHeader AS head
	ON klient.CustomerID = head.CustomerID
)
SELECT * FROM zad2_CTE ORDER BY Revenue DESC;

-- Zad. 3.
-- Napisz zapytanie, które zwróci wartość sprzedaży dla poszczególnych kategorii produktów
--ZMIEŃ BAZĘ NA LT
select * from SalesLT.ProductCategory
select * from SalesLT.Product

WITH zad3_CTE (Category, SalesValue)
AS
(
	SELECT kategoria.Name AS Category, ROUND(UnitPrice, 2) * OrderQty AS SalesValue 
	FROM SalesLT.Product AS produkt
	JOIN SalesLT.ProductCategory AS kategoria
	ON produkt.ProductCategoryID = kategoria.ProductCategoryID
	JOIN SalesLT.SalesOrderDetail AS detal
	ON produkt.ProductID = detal.ProductID
)
SELECT Category, SUM(SalesValue) AS SalesValue FROM zad3_CTE
GROUP BY Category;