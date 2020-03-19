use master

/* operaciones DDL para base de datos*/
create database colegio

alter database colegio
modify name=institucion_educativa

/*drop database institucion_educativa (esta es la opción para borrar la base de datos)*/

/*operaciones DDL para tablas*/

use institucion_educativa

create table alumnos(
idA int Primary key,
nomA varchar(30) not null,
edadA int not null,
correoA Varchar(30)
)

create table materias(
idM int Primary key,
nomM varchar(30) not null,
horarioM varchar(20) not null,
idP int not null
)

create table profesor(
idP int Primary key,
nomP varchar(30) not null,
dirP varchar(50),
profP varchar(50) not null
)

/*otra forma de crear tablas*/

create table [dbo].[alumnos1](
[idA] [int] primary key,
[nomA] [varchar](30) not null,
[edadA] [int] not null,
[correoA] [nvarchar](30) null
)