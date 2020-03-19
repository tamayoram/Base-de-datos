use master

create database autopartes
use autopartes

/* Instrucciones DDL*/

create table car (
[id_car] [int] identity(1,1) not null,
[tipo_motor] [varchar](20)not null,
[cilindraje] [varchar](30) not null,
[potencia] [varchar](30) not null,
[transmision] [text] not null,
[seguridad] [text] not null,
[peso] [float] not null,
[capacidad_carga] [float] not null,
[color] [varchar](10) not null,
[capacidad_pasajeros] [int] not null,
[Combustible] [varchar](10) not null,
[equipamento] [text] null,
constraint [PK_car] primary key clustered
(
[id_car] asc
)
)

create table bill (
[id_bill] [int] identity(1,1) not null,
[id_car] [int] not null,
[cantidad] [int] not null,
[concepto] [text] not null,
[pbruto] [float] not null,
[iva] [float] not null,
[pneto] [float] not null,
[forma_pago] [varchar](20) not null,
[fecha] [date] not null,
constraint [PK_bill] primary key clustered
(
[id_bill] asc
)
)

create table car_bill (
[id_car_bill] [int] identity(1,1) not null,
[id_car] [int] not null,
[id_bill] [int] not null,
constraint [PK_car_bill] primary key clustered
(
[id_car_bill] asc
)
)

alter table car_bill with check add constraint [FK_car_car_bill] foreign key ([id_car]) references car([id_car])
alter table car_bill check constraint [FK_car_car_bill]

alter table car_bill with check add constraint [FK_bill_car_bill] foreign key ([id_bill]) references bill([id_bill])
alter table car_bill check constraint [FK_bill_car_bill]

/*Instrucciones DML*/

insert into [dbo].[car] (tipo_motor,cilindraje,potencia,transmision,seguridad,peso,capacidad_carga,color,capacidad_pasajeros,Combustible,equipamento)
values('TechIII','1600','6000 rpm','transmisión de 5 velocidades','cinturones,airbag,sujeción','1092','393','amarillo','5','gasolina','bloqueo,radio,vidrios electricos')

insert into [dbo].[car] (tipo_motor,cilindraje,potencia,transmision,seguridad,peso,capacidad_carga,color,capacidad_pasajeros,Combustible,equipamento)
values('TechII','1200','4000 rpm','automatico 5 velocidades','cinturones,airbag,sujeción','1092','393','blanco','5','gasolina','bloqueo,radio,vidrios electricos,medidor digital')

insert into [dbo].[car] (tipo_motor,cilindraje,potencia,transmision,seguridad,peso,capacidad_carga,color,capacidad_pasajeros,Combustible,equipamento)
values('TechI','1200','4000 rpm','transmisión manual de 5 velocidades','cinturones,airbag,sujeción, carrocería BodyFrame','1092','393','blanco','5','gasolina','bloqueo,radio,vidrios electricos,tacometro')

insert into [dbo].[car] (tipo_motor,cilindraje,potencia,transmision,seguridad,peso,capacidad_carga,color,capacidad_pasajeros,Combustible,equipamento)
values('TechIII','1600','6000 rpm','automatico 5 velocidades','cinturones,airbag,sujeción','1092','393','amarillo','5','gasolina','bloqueo,radio,vidrios electricos,USB,tacometro')

insert into [dbo].[car] (tipo_motor,cilindraje,potencia,transmision,seguridad,peso,capacidad_carga,color,capacidad_pasajeros,Combustible,equipamento)
values('TechII','1200','6000 rpm','transmisión manual de 6 velocidades','cinturones,airbag,sujeción, carrocería BodyFrame','1092','393','verde','5','electrico','bloqueo,radio,vidrios electricos,medidor digital')

insert into [dbo].[car] (tipo_motor,cilindraje,potencia,transmision,seguridad,peso,capacidad_carga,color,capacidad_pasajeros,Combustible,equipamento)
values('TechII','1200','6000 rpm','transmisión manual de 6 velocidades','cinturones,airbag,sujeción, carrocería BodyFrame','1092','393','amarillo','5','hibrido','bloqueo,radio,vidrios electricos')

insert into [dbo].[car] (tipo_motor,cilindraje,potencia,transmision,seguridad,peso,capacidad_carga,color,capacidad_pasajeros,Combustible,equipamento)
values('TechII','1600','6000 rpm','transmisión manual de 5 velocidades','cinturones,airbag,sujeción','1092','393','amarillo','5','gas','bloqueo,radio,vidrios electricos')

select*from[dbo].[car]

insert into [dbo].[bill](id_car,cantidad,concepto,pbruto,iva,pneto,forma_pago,fecha)
values ('1','3','flota para cali','50000000','9500000','59500000','cheque','2019-10-12')

insert into [dbo].[bill](id_car,cantidad,concepto,pbruto,iva,pneto,forma_pago,fecha)
values ('2','1','flota para valle','50000000','9500000','59500000','cheque','2019-10-12')

insert into [dbo].[bill](id_car,cantidad,concepto,pbruto,iva,pneto,forma_pago,fecha)
values ('3','4','flota para Bogotá','50000000','9500000','59500000','cheque','2019-10-01')

insert into [dbo].[bill](id_car,cantidad,concepto,pbruto,iva,pneto,forma_pago,fecha)
values ('4','5','flota para Cartagena','50000000','9500000','59500000','efectivo','2019-03-22')

insert into [dbo].[bill](id_car,cantidad,concepto,pbruto,iva,pneto,forma_pago,fecha)
values ('5','3','flota para Planeta Rica','50000000','9500000','59500000','cheque','2019-09-12')

insert into [dbo].[bill](id_car,cantidad,concepto,pbruto,iva,pneto,forma_pago,fecha)
values ('6','1','flota para Bucaramanga','50000000','9500000','59500000','transferencia','2019-10-12')

insert into [dbo].[bill](id_car,cantidad,concepto,pbruto,iva,pneto,forma_pago,fecha)
values ('7','1','flota para Amazonas','50000000','9500000','59500000','efectivo','2019-10-13')

select*from[dbo].[bill]

insert into [dbo].[car_bill] (id_car,id_bill)
values('1','1')

insert into [dbo].[car_bill] (id_car,id_bill)
values('1','1')

insert into [dbo].[car_bill] (id_car,id_bill)
values('1','2')

insert into [dbo].[car_bill] (id_car,id_bill)
values('2','1')

insert into [dbo].[car_bill] (id_car,id_bill)
values('2','2')

insert into [dbo].[car_bill] (id_car,id_bill)
values('3','3')

insert into [dbo].[car_bill] (id_car,id_bill)
values('4','4')

select*from[dbo].[car_bill]

update [dbo].[bill]
set [fecha]=GETDATE()

update [dbo].[car]
set [cilindraje]='1600',[peso]='1092'

update [dbo].[car]
set [Color]='negro'
where [tipo_motor]='TechII' and [potencia]='4000 rpm'

Select top 3 [id_car],[concepto] from [dbo].[bill] order by [id_bill] DESC

update [dbo].[bill]
set [pbruto]='70000000'
where [id_bill] between 5 and 8

update [dbo].[bill]
set iva=[pbruto]*0.19,pneto=[pbruto]+[iva]

SELECT MIN([iva]) AS menorIVA
FROM [dbo].[bill];

SELECT MAX([iva]) AS mayorIVA
FROM [dbo].[bill];

SELECT SUM([pneto])
FROM [dbo].[bill]
WHERE [id_bill]>=6;

select [id_car]from[dbo].[car]
where [Combustible]='gas'

DELETE FROM [dbo].[bill] WHERE [id_car]='7';

DELETE FROM [dbo].[car] WHERE [Combustible]='gas';

select * from [dbo].[car]
where [potencia] like '4000%' 

select * from [dbo].[bill]
where cantidad >=3 and iva <10000000

declare @aumentoprecio int=10000000;

update [dbo].[bill]
set pneto+=@aumentoprecio
where pbruto<70000000;

update [dbo].[bill]
set pneto-=5000000
from (select id_car from bill where forma_pago='cheque') as ch 
where [dbo].[bill].id_car=ch.id_car