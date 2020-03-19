use HojaVida
select*from [dbo].[usuario]

insert into [dbo].[usuario] (nombre_us,apellido_us,fecha_nac,lugar_nac,doc_identidad,perfil_prof,dir_us,tel_us)
values('Camilo','Tamayo','19820422','Medellín','3482226','Profesional','Calle 46 28-62','2218144');

insert into [dbo].[usuario] (nombre_us,apellido_us,fecha_nac,lugar_nac,doc_identidad,perfil_prof,dir_us,tel_us)
values('Juan','Ramírez','19800422','Medellín','4234234','Profesional','Transv 5 20-62','324323445');

insert into [dbo].[usuario] (nombre_us,apellido_us,fecha_nac,lugar_nac,doc_identidad,perfil_prof,dir_us,tel_us)
values('Jhon','Perez','19790114','Pereira','23424234','Técnico','Carrera 14 56-54','34242342');

insert into [dbo].[usuario] (nombre_us,apellido_us,fecha_nac,lugar_nac,doc_identidad,perfil_prof,dir_us,tel_us)
values('Pedro','Zapata','19870928','Bogotá','712345','Estudiante','Diagonal 4 45-56','2212342');

insert into [dbo].[usuario] (nombre_us,apellido_us,fecha_nac,lugar_nac,doc_identidad,perfil_prof,dir_us,tel_us)
values('Julio','Suarez','198702222','Cali','323222','Tecnológo','Calle 5 56-24','32343523');

select*from [dbo].[formacion]

insert into [dbo].[formacion] (fecha,titulo,entidad,tipo_formacion,us_id)
values('19980815','Economia','Universidad Nacional','2','2');

insert into [dbo].[formacion] (fecha,titulo,entidad,tipo_formacion,us_id,Descripcion)
values('20000815','Ingeniería','Universidad Andes','2','3','Profesional universitario de alta calidad');

insert into [dbo].[formacion] (fecha,titulo,entidad,tipo_formacion,us_id,Descripcion)
values('20151011','Ciencia','Tecnico Sena','3','4','Técnico con un nivel de conocimiento alto');

insert into [dbo].[formacion] (fecha,titulo,entidad,tipo_formacion,us_id,Descripcion)
values('20120315','Ciencia','Tecnología CEDECO','2','1','Tecnología de alto nivel');

insert into [dbo].[formacion] (fecha,titulo,entidad,tipo_formacion,us_id,Descripcion)
values('20010619','Sociales','Universidad de Antioquia','4','5','Profesional con alto conocimiento en Ciencias Sociales');

select*from [dbo].[experiencia]

insert into [dbo].[experiencia] (us_id,empresa,sector_empresa,cargo,jefe_inmediato,telefono,desde,hasta)
values('2','EPM','Energía','Profesional','Pablo','222342342','20010409','20071115');

insert into [dbo].[experiencia] (us_id,empresa,sector_empresa,cargo,jefe_inmediato,telefono,desde,hasta)
values('3','UNE','Telecomunicaciones','Técnico','Jhon','222333323','20010409','20070815');

insert into [dbo].[experiencia] (us_id,empresa,sector_empresa,cargo,jefe_inmediato,telefono,desde,hasta)
values('4','Exito','Comida','Asesor','Paula','2224445454','20110709','20171115');

insert into [dbo].[experiencia] (us_id,empresa,sector_empresa,cargo,jefe_inmediato,telefono,desde,hasta)
values('5','Argos','Construcción','Profesional','Daniela','22444444','20020408','20071224');

insert into [dbo].[experiencia] (us_id,empresa,sector_empresa,cargo,jefe_inmediato,telefono,desde,hasta)
values('1','UdeA','Educación','Profesional','Jose','222342342','20041030','20071015');


select*from [dbo].[habilidad]

insert into [dbo].[habilidad] (us_id,nombre_hab,dominio_hab)
values('2','electronica','5');

insert into [dbo].[habilidad] (us_id,nombre_hab,dominio_hab)
values('3','Análisis de datos','2');

insert into [dbo].[habilidad] (us_id,nombre_hab,dominio_hab)
values('4','Gestión','3');

insert into [dbo].[habilidad] (us_id,nombre_hab,dominio_hab)
values('5','Educación','7');

insert into [dbo].[habilidad] (us_id,nombre_hab,dominio_hab)
values('1','construcción','9');

select*from [dbo].[recomendacion]

insert into [dbo].[recomendacion]
values('2','EPM','Buen trabajo','20091009','2228244');

insert into [dbo].[recomendacion]
values('3','Argos','Regular','20011009','2238545');

insert into [dbo].[recomendacion]
values('4','Nutresa','Promedio','20051009','2238545');

insert into [dbo].[recomendacion]
values('5','UNE','Excelente','20060709','2238445');

insert into [dbo].[recomendacion]
values('1','EPM','Óptimo','20030405','2218344');

select*from [dbo].[datosComunes]

insert into [dbo].[datosComunes] (relacion,valor,descripcion,orden)
values('1','1.1','Medellín','1');

insert into [dbo].[datosComunes] (relacion,valor,descripcion,orden)
values('2','2.1','Cali','2');

insert into [dbo].[datosComunes] (relacion,valor,descripcion,orden)
values('3','3.1','Bogotá','3');

insert into [dbo].[datosComunes] (relacion,valor,descripcion,orden)
values('4','4.1','Manizales','4');

insert into [dbo].[datosComunes] (relacion,valor,descripcion,orden)
values('5','5.1','Cartagena','5');


/*EJERCICIOS CON LA INSTRUCCIÓN UPDATE*/

select*from [dbo].[usuario]

/*Actualizar la tabla usuario para que todos los perfiles sean Profesional*/

update [dbo].[usuario]
set perfil_prof='Profesional'

select*from [dbo].[experiencia]

/*Actualizar la tabla experiencia para que todos los trabajadores se encuentra trabajando hasta la fecha actual*/

update [dbo].[experiencia]
set hasta=GETDATE()

select*from [dbo].[recomendacion]

/*Actualización de los valores de las recomendaciones entregadas por EPM*/

update [dbo].[recomendacion]
set comentario='Maravilloso trabajador'
where nombre_ref='EPM'

select*from [dbo].[datosComunes]

/*Multiplicar por 10 los valores que se encuentran en la columna relación condicionado a los tres primeros valores que se encuentran en descripcion*/
update [dbo].[datosComunes]
set relacion=relacion*10
from (select top 3 descripcion from [dbo].[datosComunes] order by [orden] asc) as des
where [dbo].[datosComunes].[descripcion]=des.[descripcion]

select*from [dbo].[usuario]

/* Actualizar la columna foto para las personas cuyo nombre empieza con J y el apellido empieza con R o S*/
update [dbo].[usuario]
set foto='No hay foto disponible'
where nombre_us like 'J%' and apellido_us like 'R%' or apellido_us like 'S%'

select*from [dbo].[datosComunes]

/* Se suma 10 a los valores que en la columna relacion se encuentran entre 4 y 5*/
update [dbo].[datosComunes]
set [orden]+=10
where relacion between 4 and 5

