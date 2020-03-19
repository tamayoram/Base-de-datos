/*Ejemplos de vistas*/

/*Son tablas virtuales de una consulta. Nombrar una instrucción select para luego usarla mediante el nombre dado a la vista. */

/*crear una vista*/
create view v_Names
as
select Name,ListPrice
from Production.Product; 

select * from v_Names;

/*Modificar la estructura de una vista*/

alter view v_Names
as
select Name,ListPrice,ProductNumber
from Production.Product; 

/**/
create view v_dostablas
as
select p.FirstName,p.LastName,e.HireDate
from HumanResources.Employee as e
join Person.Person as p
on e.BusinessEntityID=p.BusinessEntityID;

select * from v_dostablas;

/** Vista 1. Tres variables que cumplen las condiciones de ser de línea de producción R y menos de 4 días de manufactura**/

select * from production.Product;

create view v_producR
as
select name,productnumber,listprice as precio
from  [Production].[Product]
where ProductLine='R' and DaysToManufacture<4;

select * from v_producR;

/** Vista 2. Ordenes de venta consolidadas **/

create view v_SubTotal
as
select SalesOrderID,sum(LineTotal) as subtotal
from sales.SalesOrderDetail
group by SalesOrderID;

select * from v_SubTotal;

/** Vista 3. Precio promedio y subtotal por producto **/

create view v_promedio
as
select ProductID, SpecialOfferID, 
	   AVG(UnitPrice) as [Promedio Precio],
	   sum (LineTotal) as SubTotal
from sales.SalesOrderDetail
group by ProductID, SpecialOfferID;

/** Vista 4. Promedio para el modelo del producto cuando el precio es superior a 1000**/

create view v_promedio1000
as
select ProductModelID, AVG(ListPrice) as promedio
from Production.Product
where ListPrice>$1000
group by ProductModelID;


/** Vista 5. Total ventas y cantidad de productos vendidos**/

create view v_totalventas
as
select AVG(OrderQty) as cantidad, 
TotalCantVentas=(OrderQty*UnitPrice)
from sales.SalesOrderDetail
group by (OrderQty*UnitPrice);

/** Vista 6. Productos, nombres y precios de dos tablas**/


create view v_Precios_tablas
as
select distinct p.ProductID,p.Name,p.ListPrice, sd.UnitPrice
from sales.SalesOrderDetail as sd
join Production.Product as p
on sd.ProductID=p.ProductID and sd.UnitPrice < p.ListPrice;

/** Vista 7. Productos que tienen una subcategoría de 15**/

create view v_sub15
as
select p.Name as Nombre_Producto,v.Name as Nombre_vendedor 
from Production.product as p
join Purchasing.ProductVendor as pv
on p.ProductID=pv.ProductID
join Purchasing.Vendor as v
on pv.BusinessEntityID=v.BusinessEntityID
where ProductSubcategoryID=15;

