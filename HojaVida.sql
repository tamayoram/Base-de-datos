use master

/* Creación de la base de datos solicitada*/
create database HojaVida

use HojaVida

/*Creación de las tablas*/

create table persona(
Id_persona varchar(10) primary key,
Correo varchar(15) not null,
Dirección varchar(30) not null,
Teléfono varchar(30) not null,
Primer_nombre text not null,
Segundo_nombre text not null,
Apellido text not null,
)

create table Experiencia(
Id_exp int primary key,
Empresa text not null,
Duración int not null,
Descripción text not null,
)

/*creación de la FK en la tabla Experiencia*/
alter table Experiencia
add Id_persona Varchar(10) not null

alter table Experiencia
add constraint FKpersona_Experiencia foreign key(Id_persona) references persona(Id_persona)

create table Ref_laboral(
Id_reflab int primary key,
Certificación char(8),
Descripción text not null,
)

/*otra forma de crear la FK*/
alter table Ref_laboral
add Id_exp int not null foreign key references Experiencia(Id_exp);

create table Competencia(
Id_comp int primary key,
Nombre text not null,
Nivel text not null,
)

create table Competencia_persona(
Id_comp_persona int primary key,
)

/*creación de FK para tabla Competencia_persona*/
alter table Competencia_persona
add Id_comp int not null foreign key references Competencia(Id_comp);

alter table Competencia_persona
add Id_persona varchar(10) not null foreign key references persona(Id_persona);

create table Prof_persona(
Id_prof_persona int primary key,
)

create table Profesion(
Id_prof int primary key,
Nombre text not null,
)

/*creación de FK para tabla Prof_persona*/
alter table Prof_persona
add Id_prof int not null foreign key references Profesion(Id_prof);

alter table Prof_persona
add Id_persona varchar(10) not null foreign key references persona(Id_persona);

create table Estudios_adicionales(
Id_estud_ad int primary key,
Nombre text not null,
Grado text not null,
)

create table Estudad_persona(
Id_estudad_persona int primary key,
)

/*creación de FK para tabla Estudad_persona*/
alter table Estudad_persona
add Id_estud_ad int not null foreign key references Estudios_adicionales(Id_estud_ad);

alter table Estudad_persona
add Id_persona varchar(10) not null foreign key references persona(Id_persona);

/*Eliminar la columna teléfono de la tabla persona*/
alter table persona
drop column Teléfono;

/*Adicionar la columna contactos a la tabla persona*/
alter table persona
add contactos varchar(50) not null;

/*Modificar la columna Certificación en la tabla Ref_laboral*/
alter table Ref_laboral
alter column Certificación varchar(50);

/*Adicionar la columna validados en la tabla Estudios_adicionales con un check para ingresar estudios mayores o iguales a 1 año*/
alter table Estudios_adicionales
add validados int not null check(validados>=1);



