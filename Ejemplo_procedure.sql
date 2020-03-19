use master
/*Crear la base de datos y las tablas*/
	
create database school;

use school;

/*Los nombres de las tablas se acostumbran en minuscula y plural*/

create table teachers (
id_teacher int primary key,
name_teacher varchar(30) not null,
avatar varchar(30) unique not null
)

/*Procedures. Los procedimientos almacenados son una serie de instrucciones agrupadas en una función o método*/
create procedure insert_teachers (
	@id_teacher int, 
	@name_teacher varchar(30),
	@avatar varchar(30)

) as insert into teachers values (@id_teacher,@name_teacher,@avatar)

select*from teachers

EXEC insert_teachers '01','Wilson','wcastro'
EXEC insert_teachers '02','Andrea','aramirez'
EXEC insert_teachers '03','Daniel','dvelez'