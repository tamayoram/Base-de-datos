USE [master]

RESTORE DATABASE [AdventureWorks2016]

FROM disk = 'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\Backup\AdventureWorks2016.bak'

WITH MOVE 'AdventureWorks2016_data'

TO 'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\AdventureWorks2016.mdf',

MOVE 'AdventureWorks2016_Log'

TO 'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\AdventureWorks2016_log.ldf',

REPLACE


Transact-SQL DML
https://technet.microsoft.com/es-es/library/ms187731(v=sql.110).aspx