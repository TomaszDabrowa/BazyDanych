-- Zad. 1. 
-- Napisz procedurę wypisującą do konsoli ciąg Fibonacciego.
-- Procedura musi przyjmować jako argument wejściowy liczbę n.
-- Generowanie ciągu Fibonacciego musi zostać zaimplementowane jako osobna funkcja,
-- wywoływana przez procedurę.

-- napisanie funkcji

--przelacz się na LT
CREATE OR ALTER FUNCTION dbo.fib(@nMinusJeden INT, @nMinusDwa INT)
RETURNS INT
AS
BEGIN
	RETURN @nMinusJeden + @nMinusDwa;
END;

select dbo.fib(2,3)
 
-- napisanie procedury

CREATE OR ALTER PROCEDURE fibProc @n INT
AS
BEGIN
	DECLARE @i INT
	DECLARE @f1 INT
	DECLARE @f0 INT
	DECLARE @tmp0 INT
	DECLARE @tmp1 INT
	SET @f0 = 0
	SET @f1 = 1
	SET @i = 1
	PRINT 0
	PRINT 1
	WHILE ( @i < @n )
	BEGIN
		SET @tmp0 = @f0
		SET @tmp1 = @f1
		SET @f0 = @tmp1
		SET @f1 = dbo.fib(@tmp0,@tmp1)
		PRINT @f1
		SET @i = @i + 1
	END
	
END

DROP PROCEDURE test
EXEC fibProc @n = 15

-- Zad. 2.
-- Napisz trigger DML, który po wprowadzeniu danych do tabeli Persons
-- zmodyfikuje nazwisko tak, aby było napisane dużymi literami. 

USE AdventureWorks2019;

CREATE TRIGGER DuzeLitery
ON Person.Person
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE Person.Person
    SET LastName = UPPER(LastName)
    FROM Person.Person
END
select * from Person.Person

INSERT INTO Person.BusinessEntity(rowguid)
VALUES(newid())

INSERT INTO Person.Person (BusinessEntityID,PersonType,FirstName,MiddleName,LastName) 
VALUES (20779,'EM','Jerzy','T','Machowski')
GO

SELECT * FROM Person.Person WHERE BusinessEntityID = 20779;

UPDATE Person.Person 
SET PersonType = 'EM'
Where BusinessEntityID = 20779;

-- Zad. 3.
-- Przygotuj trigger ‘taxRateMonitoring’, który wyświetli komunikat o błędzie, 
-- jeżeli nastąpi zmiana wartości w polu ‘TaxRate’o więcej niż 30%.

select * from Sales.SalesTaxRate

CREATE TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate
AFTER INSERT ,UPDATE , DELETE
AS
BEGIN
DECLARE @NowyTaxRate FLOAT
DECLARE @StaryTaxRate FLOAT
SELECT @NowyTaxRate = TaxRate FROM inserted
SELECT @StaryTaxRate = TaxRate FROM deleted
IF @NowyTaxRate > 1.3 * @StaryTaxRate
PRINT 'Nowy TaxRate jest o 30 procent wiekszy od poprzedniego'
END

UPDATE Sales.SalesTaxRate 
SET TaxRate =  25
WHERE SalesTaxRateID = 1;