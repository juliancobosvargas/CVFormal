-- Base de Datos BDCVFormal
-- Hecho para SQL EXpress de Visual
-- Grupo Rojo

use master
go
--------------------------------------------------------------------------------------------
if DB_ID('BDCVFormal') is not null
   drop database BDCVFormal
go
create database BDCVFormal
go
--------------------------------------------------------------------------------------------
use BDCVFormal
go
--------------------------------------------------------------------------------------------
if OBJECT_ID('TCuenta','U') is not null
	drop table  TCuenta
go
create table TCuenta
(
	CodCuenta 		INT NOT NULL IDENTITY(1,1),
	CorreoSeguro 	varchar(100) NOT NULL,
	Usuario 		varchar(100) NOT NULL,
	Contrasena		varbinary(200) NOT NULL,
	Estado			char(1) NOT NULL, --A: activo, I: inactivo, S: Suspendido
	Registro		Date NOT NULL,
	Seudonimo		varchar(100),
	Privacidad		varchar(100),
	
	primary key(CodCuenta)
)
select Contrasena from TCuenta
select * from TCuenta
insert into TCuenta Values ('julian@gmail','julian',ENCRYPTBYPASSPHRASE('tokencovid19','j123'),'A','18/6/2020','JulianCobos','privado1')


-----------------------------------------------

if OBJECT_ID('TDato','U') is not null
	drop table  TDato
go 
create table TDato
(
	CodDato		INT NOT NULL IDENTITY(1,1),
	Apellidos 	varchar(100) NOT NULL,
	Nombres 	varchar(100) NOT NULL,
	Nacimiento	Date,
	Dni			varchar(20) NOT NULL,
	Direccion 	varchar(100),
	Informacion varchar(500),
	CodCuenta	INT NOT NULL
	primary key(CodDato)
	foreign key (CodCuenta) references TCuenta
)  
go

select * from TCuenta
select * from TDato
insert into TDato Values ('Cobos','julian','11/07/1988','45784578','casa','info',1)

--------------------------------------------------------------------------------------------
if OBJECT_ID('TEstudio','U') is not null
	drop table  TEstudio
go 
create table TEstudio
(
	CodEstudio	INT NOT NULL IDENTITY(1,1),
	Vision		char(1) check(Vision in('V','O','P')),
	Intitucion 	varchar(100) NOT NULL,
	Facultad	varchar(100),
	Carrera 	varchar(100) NOT NULL,
	Inicio		Date,
	Fin			Date,
	CodCuenta	INT NOT NULL
	primary key (CodEstudio),
	foreign key (CodCuenta) references TCuenta
)  
go

select * from TCuenta
select * from TEstudio
insert into TEstudio Values ('V','Andina','ing y arqui','ing de Sistemas','1/7/2016',null,1)

--------------------------------------------------------------------------------------------
if OBJECT_ID('TTrabajo','U') is not null
	drop table  TTrabajo
go 
create table TTrabajo
(
	CodTrabajo	INT NOT NULL IDENTITY(1,1),
	Vision		char(1) check(Vision in('V','O','P')),
	Empresa 	varchar(100) NOT NULL,
	Puesto 		varchar(100) NOT NULL,
	Supervisor 	varchar(100),
	Inicio		Date,
	Fin			Date,
	CodCuenta	INT NOT NULL
	primary key (CodTrabajo),
	foreign key (CodCuenta) references TCuenta
)
go

select * from TCuenta
select * from TTrabajo
insert into TTrabajo Values ('V','PubliBar','Programador','Sr Luna','1/7/2015',null,1)

--------------------------------------------------------------------------------------------
if OBJECT_ID('THabilidad','U') is not null
	drop table  THabilidad
go 
create table THabilidad(
	CodHabilidad	INT NOT NULL IDENTITY(1,1),
	Vision		char(1)check(Vision in('V','O','P')),
	Nombre 		varchar(100) NOT NULL,
	Nivel 		INT NOT NULL,
	CodCuenta	INT NOT NULL
	primary key (CodHabilidad),
	foreign key (CodCuenta) references TCuenta
)
go
--insercion
select * from TCuenta
select * from THabilidad
insert into THabilidad Values ('V','Excel','90',1)

--------------------------------------------------------------------------------------------
if OBJECT_ID('TFono','U') is not null
	drop table  TFono
go 
create table TFono(
	CodFono 	INT NOT NULL IDENTITY(1,1),
	Vision		char(1) check(Vision in('V','O','P')),
	Tipo 		varchar(20) NOT NULL,
	Numero 		varchar(20) NOT NULL,
	CodCuenta	INT NOT NULL
	primary key (CodFono),
	foreign key (CodCuenta) references TCuenta
)
go
--insercion
select * from TCuenta
select * from TFono
insert into TFono Values ('V','cel personal','95829',1)

----------------------------------------------------------------------------------
if OBJECT_ID('TCorreo','U') is not null
	drop table  TCorreo
go 
create table TCorreo(
	CodCorreo 		INT NOT NULL IDENTITY(1,1),
	Vision		char(1)check(Vision in('V','O','P')),
	Tipo 		varchar(100) NOT NULL,
	Correo 		varchar(100) NOT NULL,
	CodCuenta	INT NOT NULL
	primary key (CodCorreo),
	foreign key (CodCuenta) references TCuenta
	)
go
--insercion
select * from TCuenta
select * from TCorreo
insert into TCorreo Values ('V','trabajo','julian@trabajo',1)

--------------------------------------------------------------------------------------------
if OBJECT_ID('TRed','U') is not null
	drop table  TSocial
go
create table TSocial
(
	CodSocial		INT NOT NULL IDENTITY(1,1),
	Vision		char(1)check(Vision in('V','O','P')),
	Tipo 		varchar(100) NOT NULL,
	Ruta 		varchar(100) NOT NULL,
	CodCuenta	INT NOT NULL
	primary key (CodSocial),
	foreign key (CodCuenta) references TCuenta
)
go
--insercion
select * from TCuenta
select * from TSocial
insert into TSocial Values ('V','Face','fb/julian',1)


-------------------------------------------------------------------
select * from TCuenta where Usuario = 'julian' and Contrasena = 'j123'


