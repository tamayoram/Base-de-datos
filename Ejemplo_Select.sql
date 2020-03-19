use AdventureWorks2014

select*from [Production].[Product]
order by [Name]  desc


/** todos los registros de la tabla production.product utilizando el alias **/

select p.*
from  [Production].[Product] as p
order by [Name] asc


select * from production.Product;

/** selección de tres variables que cumplen las condiciones de ser de línea de producción R y menos de 4 días de manufactura**/
select name,productnumber,listprice as precio
from  [Production].[Product]
where ProductLine='R' and DaysToManufacture<4
order by name asc;


/** El distinct permite traer datos no repetidos**/
select * from HumanResources.Employee;
select distinct JobTitle
from HumanResources.Employee
order by JobTitle;

/* consulta consolidada por SalesOrderID agrupada y ordenada**/
select * from sales.SalesOrderDetail;

select SalesOrderID,sum(LineTotal) as subtotal
from sales.SalesOrderDetail
group by SalesOrderID
order by SalesOrderID;

/*consolidar por SalesOrderID para la referencia 43659*/
select SalesOrderID,sum(LineTotal) as subtotal
from sales.SalesOrderDetail
where SalesOrderID='43659'
group by SalesOrderID;

/** se usa corchete cuando queremos textos separados sin caracter especial en el medio*/
/** Calcular promedio y total consolidado por productID y SpecialOffer **/

select ProductID, SpecialOfferID, 
	   AVG(UnitPrice) as [Promedio Precio],
	   sum (LineTotal) as SubTotal
from sales.SalesOrderDetail
group by ProductID, SpecialOfferID
order by ProductID;


select * from Production.Product;
select ProductModelID, AVG(ListPrice) as promedio
from Production.Product
where ListPrice>$1000
group by ProductModelID
order by ProductModelID;


select * from sales.SalesOrderDetail;

select AVG(OrderQty) as cantidad, 
TotalCantVentas=(OrderQty*UnitPrice)
from sales.SalesOrderDetail
group by (OrderQty*UnitPrice)
order by (OrderQty*UnitPrice) desc


/** having cumple la misma función de where pero having es para funciones sum, avg, max, min**/
select ProductID,avg(OrderQty) as Promedio
from Sales.SalesOrderDetail
group by ProductID
having AVG(OrderQty)>5
order by ProductID;


select SalesOrderID,CarrierTrackingNumber
from Sales.SalesOrderDetail
group by SalesOrderID,CarrierTrackingNumber
having CarrierTrackingNumber like '4BD%' 
order by SalesOrderID

select * from Production.Product;

select ProductID,name,Color
from Production.Product
where name like ('%Frame%') and name like ('HL%')
and color='Red';

select Name,Weight,Color
from Production.Product
where weight <10.00 or color is null
order by Name asc;

select * from Sales.Customer;

/** In es para seleccionar condiciones de una variable**/
select CustomerID,AccountNumber,TerritoryID
from sales.Customer
where TerritoryID in (1,2,3)
	  or TerritoryID is null;


select * from sales.SalesOrderDetail;
select * from Production.Product;

/** join es para combinar tablas y poder realizar consulta tomando variables de ambas. La clausula on es para definir las condiciones**/

select distinct p.ProductID,p.Name,p.ListPrice, sd.UnitPrice
from sales.SalesOrderDetail as sd
join Production.Product as p
on sd.ProductID=p.ProductID and sd.UnitPrice < p.ListPrice
where p.ProductID= 718;