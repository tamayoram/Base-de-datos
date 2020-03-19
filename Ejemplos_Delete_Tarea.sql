use AdventureWorks2014

/* Ejemplos instrucci�n update*/ /*value, from, into, set, where, son clausulas*/

select * from [Person].[Address]

/*Actualizaci�n masiva de una columna (todos los registros)*/
update [Person].[Address]
set [ModifiedDate]=getdate()

/*Actualizaci�n de varios valores (todos los registros)*/
select * from [Sales].[SalesPerson]

update [Sales].[SalesPerson]
set [Bonus]=6000,[CommissionPct]=0.1,[SalesQuota]=NULL

/*Actualizaci�n de algunos valores espec�ficos*/
select * from [Production].[Product]

/*Actualizaci�n de valores espec�ficos*//* El like significa que "comienza con".El s�mbolo de porcentaje es para informar que de ah� en adelante no importa el texto que se tenga*/
update [Production].[Product]
set [Color]='Metallic Red'
where [Name] like 'Road-250%' and [Color]='Red'

/*Actualizaci�n aleatoria de valores*/ /* Con el top (10) se seleccionan aleatoriamente 10 registros*/
select * from [HumanResources].[Employee]
update top(10) [HumanResources].[Employee]
set [VacationHours]=[VacationHours]*1.25

/* Actualizaci�n de los valores que corresponden con los 10 empleados m�s antiguos*//*order by es para ordenar, asc es ascedente, as es para nombrar de forma resumida toda la consulta*/
update [HumanResources].[Employee]
set [VacationHours]=[VacationHours]+8, [ModifiedDate]=GETDATE()
from (select top 10 [BusinessEntityID] from [HumanResources].[Employee] order by [HireDate] ASC) as th
where [HumanResources].[Employee].[BusinessEntityID]=th.BusinessEntityID

select * from [HumanResources].[Employee]
order by [HireDate] asc 

/* Selecci�n de los registros que corresponden con los 10 empleados m�s antiguos*/
Select top 10 [BusinessEntityID],[JobTitle] from [HumanResources].[Employee] order by [HireDate] ASC

/*Duplicar el valor de la columna listprice para las filas de la tabla product*/
select * from [Production].[Product]
update [Production].[Product]
set [ListPrice]=[ListPrice]*2

/* el @ es para indicar que no es una columna sino una variable*/
select * from [Production].[Product]

declare @NewPrice int=500;

update [Production].[Product]
set [ListPrice]+=@NewPrice
where [Color]='Black'

select * from [Production].[Product]
where [Color]='Black'


select * from [Production].[ScrapReason]

/*Adicionar informaci�n en una columna para los registro que cumplan una condici�n*/
update [Production].[ScrapReason]
set [Name] += 'Ausencia'
where [ScrapReasonID] between 10 and 12

select * from [Production].[ScrapReason]
where [ScrapReasonID] between 10 and 12

select * from [Production].[Location]


update [Production].[Location]
set [CostRate]=DEFAULT 
where [CostRate]>20.00


/* RESPUESTA A LA TAREA:
1. Las dos instrucciones select muestran la informaci�n de las tablas SalesPerson y SalesOrderHeader.
2. La instrucci�n update se utiliza para actualizar la tabla SalesPerson.
3. La actualizaci�n se va a realizar en la columna SalesYTD.
4. La actualizaci�n corresponde a la suma de la columna SubTotal que se encuentra en la tabla SalesOrderHeader.
5. La suma esta condicionada a la OrderDate. En este caso, se va a escoger la fecha m�xima de la columna OrderDate en la tabla SalesOrderHeader
pero teniendo en cuenta que se escoge para los casos donde las columnas BusinessEntityID y SalesPersonID son iguales.

El query verifica los valores donde tanto BusinessEntityID como SalesPersonID son iguales. Teniendo esos valores como referencia,
selecciona la fecha m�xima correspondiente al OrderRate. Esa fecha sirve de referencia para sumar la columna Subtotal, y ese valor 
se suma a la columna SalesYTD en la tabla SalesPerson. Esto se realiza para 17 valores.

*/

select * from [Sales].[SalesPerson]
select * from [Sales].[SalesOrderHeader]

update [Sales].[SalesPerson]
set [SalesYTD]=[SalesYTD]+
	(select sum(so.SubTotal)
	from [Sales].[SalesOrderHeader] as so
	where so.[OrderDate]= (select max([OrderDate])
						from [Sales].[SalesOrderHeader] as so2
						where so2.[SalesPersonID]=so.[SalesPersonID])
	and [Sales].[SalesPerson].[BusinessEntityID]=so.[SalesPersonID]
	group by so.[SalesPersonID]);
	
/* Utilizaci�n de la instrucci�n Delete*/ 

/*Eliminar de la tabla person.address el postalcode correspondiente a 98011. Para realizar eso, es necesario borrar varias dependencias en otras tablas*/

SELECT * FROM [Person].[Address];

DELETE FROM [Person].[BusinessEntityAddress]
WHERE AddressID IN 
    (SELECT AddressID 
     FROM [Person].[Address]
     where PostalCode='98011');
GO

DELETE FROM [Sales].[SalesOrderHeader]
WHERE ShipToAddressID IN 
    (SELECT AddressID 
     FROM [Person].[Address]
     where PostalCode='98011');
GO

delete from [Person].[Address]
where PostalCode='98011';
go

/*Eliminar de la tabla sales.customer aquellos registros en TerritoryID son iguales a 4. Sin embargo, la misma condici�n
se debe aplicar previamente en la tabla sales.orderheader
*/

SELECT * FROM [Sales].[Customer];

DELETE FROM [Sales].[SalesOrderHeader]
WHERE TerritoryID= 4;
GO

select*from [Sales].[SalesOrderHeader]

delete from [Sales].[Customer]
where TerritoryID=4;
go



/* Eliminar todos los registro de la tabla production.productcosthistory*/

select * from [Production].[ProductCostHistory];

delete from [Production].[ProductCostHistory];