use AdventureWorks2016

select * from Production.UnitMeasure

/*Insertar un registro indicando los campos*/
INSERT INTO Production.UnitMeasure (UnitMeasureCode, Name, ModifiedDate)
 VALUES ('JEM', 'Jemis', '20191011')

/*Insertar un registro sin indicar los campos*/
INSERT INTO Production.UnitMeasure
VALUES ('CUA', 'Cuarta', '20191011')

/*Insetar varios registros*/
INSERT INTO Production.UnitMeasure
VALUES ('VAR', 'Vara', '20191010'),
 ('CUJ', 'Cuarta y Jemis', '20191010'),
 ('PP', 'Pico y Pala', '20191010'),
 ('VEL', 'Velocidad', '20191010')

 /*Insertar registro cuando los campos 
 no estan en el mismo orden*/
 INSERT INTO Production.UnitMeasure
 (Name, UnitMeasureCode, ModifiedDate)
 values ('Aire', 'AAA', GETDATE())


/*Ejemplos instruccion update*/
use AdventureWorks2016
select * from Person.Address

/*Altualizacion de un valor de columna para todas las filas (registros)*/
UPDATE Person.Address
SET ModifiedDate = GETDATE()

/*Altualizacion de un valor de varias columnas para todas las filas (registros)*/
select * from Sales.SalesPerson

UPDATE Sales.SalesPerson
SET Bonus=6000, CommissionPct=.10, SalesQuota=NULL

/*Actualizar filas con condiciones en en los registros de varias columnas*/
select * from Production.Product

UPDATE Production.Product
SET Color = 'Metallic Red'
WHERE Name LIKE 'Road-250%' AND Color = 'Red'

/*Actualizacion aleatoria a 10 registros realizando un calculo en una columna*/
select * from HumanResources.Employee

UPDATE TOP(10) HumanResources.Employee
set VacationHours = VacationHours * 1.25

/*Actualizacion de las horas de vacaciones de los 10 empleados mas antiguos*/
UPDATE HumanResources.Employee
SET VacationHours = VacationHours + 8
FROM (SELECT TOP 10 BusinessEntityID from
	  HumanResources.Employee ORDER BY HireDate ASC)
	   AS th
WHERE
HumanResources.Employee.BusinessEntityID = th.BusinessEntityID

select * from HumanResources.Employee
order by HireDate ASC

/*Duplicar el valor de la columna ListPrice
para las filas de la tabla Product*/

UPDATE Production.Product
SET ListPrice=ListPrice*2

/*Incrementar el valor de una columna para todos los registros que cumplen una condicion*/
select * from Production.Product

DECLARE @NewPrice int = 500;
UPDATE Production.Product
SET ListPrice += @NewPrice
WHERE Color = 'Red'

select * from Production.Product where Color='Red'


/*Adicionar informacion en una columna para los registros que cumplen una condicion*/
select * from Production.ScrapReason
UPDATE Production.ScrapReason
SET Name += 'mantenimiento'  /*Analisar error cuando solo es =*/
WHERE ScrapReasonID BETWEEN 10 and 12

select * from Production.ScrapReason
where ScrapReasonID BETWEEN 10 and 12

/**/
select * from Production.Location
UPDATE Production.Location
SET CostRate = DEFAULT
WHERE CostRate > 20.00

/**/
SELECT * FROM Sales.SalesPerson
SELECT * FROM Sales.SalesOrderHeader
UPDATE Sales.SalesPerson
SET SalesYTD = SalesYTD + 
    (SELECT SUM(so.SubTotal) 
     FROM Sales.SalesOrderHeader AS so
     WHERE so.OrderDate = (SELECT MAX(OrderDate)
                           FROM Sales.SalesOrderHeader AS so2
                           WHERE so2.SalesPersonID = so.SalesPersonID)
     AND Sales.SalesPerson.BusinessEntityID = so.SalesPersonID
     GROUP BY so.SalesPersonID);

/*Eliminar registros*/
/*
Utilizar DELETE en un conjunto de filas. Se eliminan todas las filas de la tabla ProductCostHistory en las que el valor de la columna StandardCost
es superior a 1000.00.
*/
SELECT * FROM Production.ProductCostHistory

DELETE FROM Production.ProductCostHistory
WHERE StandardCost > 1000.00;
GO

/*
Utilizar la instrucción DELETE basada en una subconsulta y utilizar la extensión de Transact-SQL
Se muestra la extensión de Transact-SQL que se utiliza para eliminar registros de una tabla base que se basa
en una combinación o subconsulta correlacionada. La primera instrucción DELETE muestra la solución de subconsulta compatible
con ISO y la segunda instrucción DELETE muestra la extensión de Transact-SQL. Ambas consultas quitan filas de la
tabla SalesPersonQuotaHistory basándose en las ventas del año hasta la fecha almacenadas en la tabla SalesPerson.
*/
SELECT * FROM Sales.SalesPersonQuotaHistory

DELETE FROM Sales.SalesPersonQuotaHistory 
WHERE BusinessEntityID IN 
    (SELECT BusinessEntityID 
     FROM Sales.SalesPerson 
     WHERE SalesYTD > 2500000.00);
GO

/*
Utilizar DELETE sin la cláusula WHERE
Se eliminan todas las filas de la tabla SalesPersonQuotaHistory porque no se utiliza una cláusula WHERE
para limitar el número de filas eliminadas.
*/
SELECT * FROM Sales.SalesPersonQuotaHistory

DELETE FROM Sales.SalesPersonQuotaHistory;
GO

/*SELECT*/
SELECT *
FROM Production.Product
ORDER BY Name DESC

/**/
SELECT p.*
FROM Production.Product AS p
ORDER BY Name ASC

/**/
select * from Production.Product;
SELECT Name, ProductNumber, ListPrice AS Precio
FROM Production.Product
WHERE ProductLine = 'R'
AND DaysToManufacture < 4
ORDER BY Name ASC;

/**/
SELECT * FROM HumanResources.Employee;
SELECT DISTINCT JobTitle
FROM HumanResources.Employee
ORDER BY JobTitle;

/**/
SELECT * FROM Sales.SalesOrderDetail;
SELECT SalesOrderID, SUM(LineTotal) FROM Sales.SalesOrderDetail
WHERE SalesOrderID = '43659'
GROUP BY SalesOrderID;
SELECT SalesOrderID, SUM(LineTotal) As SubTotal
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY SalesOrderID;

/**/
SELECT * FROM Sales.SalesOrderDetail;
SELECT ProductID, SpecialOfferID,
	   AVG(UnitPrice) AS [Promedio Precio],
	   SUM(LineTotal) AS SubTotal
FROM Sales.SalesOrderDetail
GROUP BY ProductID, SpecialOfferID
ORDER BY ProductID;

/**/
SELECT * FROM Production.Product;
SELECT ProductModelID, AVG(ListPrice) AS SubTotal
FROM Production.Product
WHERE ListPrice > $1000
GROUP BY ProductModelID
ORDER BY ProductModelID;

/**/
SELECT * FROM Sales.SalesOrderDetail;
SELECT AVG(OrderQty) AS Cantidad,
	TotalCantVentas = (OrderQty * UnitPrice)
FROM Sales.SalesOrderDetail
GROUP BY (OrderQty * UnitPrice)
ORDER BY (OrderQty * UnitPrice) DESC;

/**/
SELECT * FROM Sales.SalesOrderDetail;
SELECT ProductID, AVG(OrderQty) as promedio
FROM Sales.SalesOrderDetail
GROUP BY ProductID
/*HAVING AVG(OrderQty) > 5 */
ORDER BY ProductID;

/**/
SELECT * FROM Sales.SalesOrderDetail;
SELECT SalesOrderID, CarrierTrackingNumber
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID, CarrierTrackingNumber
HAVING CarrierTrackingNumber LIKE '4BD%'
ORDER BY SalesOrderID;

/**/
SELECT * FROM Production.Product;
SELECT ProductID, Name, Color
FROM Production.Product
WHERE Name LIKE ('%Frame%')
AND Name LIKE ('HL%')
AND Color = 'Red';

/**/
SELECT * FROM Production.Product;
SELECT Name, Weight, Color
FROM Production.Product
WHERE Weight < 10.00 OR Color IS NULL
ORDER BY Name;

/**/
SELECT * FROM Sales.Customer;
SELECT CustomerID, AccountNumber, TerritoryID
FROM Sales.Customer
WHERE TerritoryID IN (1, 2, 3)
	OR TerritoryID IS NULL;

/**/
SELECT * FROM Sales.SalesOrderDetail, Production.Product;
SELECT DISTINCT p.ProductID, p.Name, sd.UnitPrice, p.ListPrice AS Precio
FROM Sales.SalesOrderDetail AS sd
JOIN Production.Product AS p
ON sd.ProductID = p.ProductID AND sd.UnitPrice < p.ListPrice
WHERE p.ProductID = 718;

/**/
