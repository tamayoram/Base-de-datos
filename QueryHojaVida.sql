use master

create database HojaVida
use HojaVida

/* tabla formación*/
create table formacion (
[id_form] [int] identity(1,1) not null,
[us_id] [int] not null,
[tipo_formacion] [tinyint] not null constraint [DF_Formacion_Tipo] default ((1)),
[entidad] [varchar](100) not null,
[titulo] [varchar](50) not null,
[Fecha] [varchar](10) not null,
[Descripcion] [text] null,
constraint [PK_formacion] primary key clustered --Indice agrupado a nivel lógico y físico
(
	[id_form] asc --asc es para que sea ascendente
) 
)

/* tabla experiencia*/
create table experiencia (
[id_exp] [int] identity(1,1) not null,
[us_id] [int] not null,
[empresa] [varchar](50) not null,
[sector_empresa] [varchar](50) not null,
[cargo] [varchar](50) not null,
[jefe_inmediato] [varchar](50) not null,
[telefono] [varchar](10) not null,
[desde] [varchar](10) not null,
[hasta] [varchar](10) not null,
[desc_funciones] [text] null,
constraint [PK_experiencia] primary key clustered --Indice agrupado a nivel lógico y físico
(
	[id_exp] asc --asc es para que sea ascendente
) 
)

/* tabla habilidades*/
create table habilidad (
[id_hab] [int] identity(1,1) not null,
[us_id] [int] not null,
[nombre_hab] [varchar](50) not null,
[dominio_hab] [tinyint] not null constraint [def_habilidad_dominio] default((0)),
constraint [PK_hab] primary key clustered --Indice agrupado a nivel lógico y físico
(
	[id_hab] asc --asc es para que sea ascendente
) 
)

/* tabla recomendaciones*/
create table recomendacion(
[id_rec] [int] identity(1,1) not null,
[us_id] [int] not null,
[nombre_ref] [varchar](50) not null, 
[comentario] [varchar](50) not null,
[fecha] [varchar](10) not null,
[telefono_ref] [varchar](10) not null,
constraint [PK_recomendacion] primary key clustered --Indice agrupado a nivel lógico y físico
(
	[id_rec] asc --asc es para que sea ascendente
) 
)

create table usuario (
[us_id] [int] identity(1,1) not null,
[nombre_us] [varchar](50) not null,
[apellido_us] [varchar](50) not null,
[fecha_nac] [varchar](10) not null,
[lugar_nac] [varchar](50) null,
[doc_identidad] [varchar](10) not null,
[perfil_prof] [text] not null,
[dir_us] [varchar](50) not null, 
[tel_us] [varchar](10) not null,
[foto] [varchar](50) null,
constraint [PK_usuario] primary key clustered --Indice agrupado a nivel lógico y físico
(
	[us_id] asc --asc es para que sea ascendente
) 
)
/*tabla datos comunes*/
create table datosComunes (
[relacion] [varchar](20) not null,
[valor] [varchar](10) not null,
[descripcion] [varchar](50) not null,
[orden] [int] not null constraint [def_Datos_Comunes] default ((1)),

constraint [PK_dat_comun] primary key clustered --Indice agrupado a nivel lógico y físico
(
	[relacion] asc, --asc es para que sea ascendente
	[valor] asc
) 
)

/*crear las relaciones*/

/*Relación formacion usuario*/

alter table formacion with check add constraint [FK_formacion_usuario] foreign key ([us_id]) references usuario([us_id])
alter table formacion check constraint [FK_formacion_usuario] 

/*Relación experiencia usuario*/

alter table experiencia with check add constraint [FK_experiencia_usuario] foreign key ([us_id]) references usuario([us_id])
alter table experiencia check constraint [FK_experiencia_usuario] 

/*Relación habilidad usuario*/

alter table habilidad with check add constraint [FK_habilidad_usuario] foreign key ([us_id]) references usuario([us_id])
alter table habilidad check constraint [FK_habilidad_usuario] 

/*Relación recomendacion usuario*/

alter table recomendacion with check add constraint [FK_recomendacion_usuario] foreign key ([us_id]) references usuario([us_id])
alter table recomendacion check constraint [FK_recomendacion_usuario] 