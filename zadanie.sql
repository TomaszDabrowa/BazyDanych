-- Zad. 1. 
-- Napisz zapytanie, które wykorzystuje transakcję (zaczyna ją), a następnie
-- aktualizuje cenę produktu o ProductID równym 680 w tabeli Production.Product
-- o 10% i następnie zatwierdza transakcję.
select * from Production.Product WHERE ProductID = 680

BEGIN TRANSACTION

	UPDATE Production.Product
	SET ListPrice = 1.1*ListPrice
	WHERE ProductID = 680;

COMMIT TRANSACTION

-- Zad. 2.
-- Napisz zapytanie, które zaczyna transakcję, usuwa produkt o ProductID równym
-- 707 z tabeli Production.Product, ale następnie wycofuje transakcję.
SELECT * FROM Production.Product WHERE ProductID = 707;

EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all";
BEGIN TRANSACTION

	DELETE FROM Production.Product
	WHERE ProductID = 707;

ROLLBACK TRANSACTION

-- Zad. 3. 
-- Napisz zapytanie, które zaczyna transakcję, dodaje nowy produkt do tabeli
-- Production.Product, a następnie zatwierdza transakcję.

select * from Production.Product

BEGIN TRANSACTION
	
	SET IDENTITY_INSERT Production.Product ON;
	INSERT INTO Production.Product(ProductID,Name,ProductNumber,MakeFlag,
	FinishedGoodsFlag,SafetyStockLevel,ReorderPoint,StandardCost,ListPrice,DaysToManufacture,
	SellStartDate)
	VALUES (1000,'Tester','HL-errewr',0,1,4,3,15,35,0,
	'2011-05-31 00:00:00.000');
	SET IDENTITY_INSERT Production.Product OFF;

COMMIT TRANSACTION

-- Zad.4.
-- Napisz zapytanie, które zaczyna transakcję i aktualizuje StandardCost wszystkich
-- produktów w tabeli Production.Product o 10%, jeżeli suma wszystkich
-- StandardCost po aktualizacji nie przekracza 50000. W przeciwnym razie zapytanie
-- powinno wycofać transakcję.

BEGIN TRANSACTION
	
	DECLARE @suma FLOAT;
	UPDATE Production.Product SET StandardCost = 1.1*StandardCost;
	SELECT @suma = SUM(StandardCost) FROM Production.Product;

	IF (@suma <= 50000)
	BEGIN
		PRINT 'ZATWIERDZONO';
		COMMIT;
	END
	ELSE
	BEGIN
		PRINT 'NIE ZATWIERDZONO';
		ROLLBACK;
	END

-- Zad. 5. 
-- Napisz zapytanie SQL, które zaczyna transakcję i próbuje dodać nowy produkt do
-- tabeli Production.Product. Jeśli ProductNumber już istnieje w tabeli, zapytanie
-- powinno wycofać transakcję.

select * from Production.Product;

BEGIN TRANSACTION

	IF EXISTS(SELECT 1 FROM Production.Product WHERE ProductNumber = 'SY-11111')
	BEGIN
		PRINT 'ODRZUCONO'
		ROLLBACK
	END
	ELSE
	BEGIN
		SET IDENTITY_INSERT Production.Product ON;
		INSERT INTO Production.Product(ProductID,Name,ProductNumber,MakeFlag,
		FinishedGoodsFlag,SafetyStockLevel,ReorderPoint,StandardCost,ListPrice,DaysToManufacture,
		SellStartDate)
		VALUES (1001,'Tester2','SY-11111',0,1,4,3,15,35,0,
		'2011-05-31 00:00:00.000');
		SET IDENTITY_INSERT Production.Product OFF;
		PRINT 'ZATWIERDZONO';
		COMMIT
	END

-- Zad. 6.
-- Napisz zapytanie SQL, które zaczyna transakcję i aktualizuje wartość OrderQty
-- dla każdego zamówienia w tabeli Sales.SalesOrderDetail. Jeżeli którykolwiek z
-- zamówień ma OrderQty równą 0, zapytanie powinno wycofać transakcję.

select * from Sales.SalesOrderDetail;

BEGIN TRANSACTION
	IF ( (SELECT MIN(SalesOrderDetailID) FROM Sales.SalesOrderDetail) = 0 )
	BEGIN
		PRINT 'ODRZUCONO';
		ROLLBACK;
	END
	ELSE
	BEGIN
		PRINT 'ZATWIERDZONO';
		UPDATE Sales.SalesOrderDetail SET OrderQty = OrderQty + 1;
		COMMIT;
	END

-- Zad. 7.
-- Napisz zapytanie SQL, które zaczyna transakcję i usuwa wszystkie produkty,
-- których StandardCost jest wyższy niż średni koszt wszystkich produktów w tabeli
-- Production.Product. Jeżeli liczba produktów do usunięcia przekracza 10,
-- zapytanie powinno wycofać transakcję

select * from Production.Product 

BEGIN TRANSACTION
	DECLARE @avgStandardCost FLOAT;
	DECLARE @iloscUsunietych INT;
	SELECT @avgStandardCost = (SELECT AVG(StandardCost) FROM Production.Product);
	SELECT @iloscUsunietych = (SELECT COUNT(*) FROM Production.Product WHERE StandardCost > @avgStandardCost);
	DELETE FROM Production.Product
	WHERE StandardCost > @avgStandardCost;
	IF ( @iloscUsunietych > 10 )
	BEGIN
		PRINT 'ODRZUCONO';
		ROLLBACK;
	END
	ELSE
	BEGIN
		PRINT 'ZATWIERDZONO';
		COMMIT;
	END

	