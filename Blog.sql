
use master
create database blog

use blog

create table usuarios(
usuarios_id int primary key,
loginU varchar(30) not null,
passwordU varchar(32) not null,
nickname varchar(40) not null,
email varchar(40) not null unique
)

create table comentarios(
comentarios_id int primary key,
comentario text,
usuarios_id int,
posts_id int

)

create table categorias(
categorias_id int primary key,
categoria varchar(30)

)

create table etiquetas(
etiquetas_id int primary key,
nombre_etiqueta varchar(30)

)

create table posts(
posts_id int primary key,
titulo varchar(150),
fecha_publicacion timestamp,
contenido text,
estatus char(8),
usuarios_id int,
categorias_id int
)