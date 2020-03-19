use [AdventureWorks2014]
select * from [Production].[UnitMeasure]

/*Insertar un registro*/

INSERT INTO [Production].[UnitMeasure](UnitMeasureCode,Name,ModifiedDate)
VALUES ('JEM','Jemis','20191011');

/* Si no se especifican los campos, los valores se deben colocar en el orden estricto de los mismos*/
INSERT INTO [Production].[UnitMeasure]
VALUES ('CUA','Cuarta','20191011');

/* Insertar varios registros*/
INSERT INTO [Production].[UnitMeasure]
VALUES ('VAR','Vara','20191012'),('CUJ','Cuarta y Jeminis','20190912'),('PP','Pico y Pala','20190816');

/*Insertar los registros cuando los campos no están en el mismo orden Getdate (fecha de hoy)*/
INSERT INTO [Production].[UnitMeasure](Name,UnitMeasureCode,ModifiedDate)
VALUES ('Aire','AAA',getdate());