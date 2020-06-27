use BDCVFormal
go
--------------------------------------------------------------Prcedimiento listar Estudio----------------------------------------------------------------
if OBJECT_ID('spListarEstudio') is not null
	drop proc spListarEstudio 
go
create proc spListarEstudio
	@CodCuenta		int 
as
begin
	if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
begin
	select  CodEstudio, Vision, Intitucion ,Facultad,Carrera,Inicio,Fin,CodCuenta from TEstudio where CodCuenta=@CodCuenta
end
	else select CodError = 1, Mensaje = 'Error:  Codigo Cuenta no existe'
end
go

execute spListarEstudio 1

------------------------------------------------------------ procedimiento Agregar Estudio-------------------------------------------------------------------
if OBJECT_ID('spAgregarEstudios') is not null
	drop proc spAgregarEstudios
go
-- cdigo esxiten de t principal
create proc spAgregarEstudios   
	@Vision 	char(1) ,
	@Intitucion	varchar(100) ,
	@Facultad	varchar(100),
	@Carrera	varchar(100),
	@Inicio 	date,
	@Fin		date ,
	@CodCuenta	int 
	as
begin
            
				-- no debe agragarse en este es campo
					if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
				
		   begin
			insert into TEstudio values(@Vision,@Intitucion,@Facultad,@Carrera,@Inicio,@Fin,@CodCuenta)
				select CodError = 0, Mensaje = 'Estudios insertado correctamente'
			end
					else select CodError = 1, Mensaje = 'Error: no existe Codigo cuenta'
			
end
go

exec spAgregarEstudios 'P','sistemas','Ingenieria','Ambiental','14/4/2020','15/8/1948',3
select *from TEstudio
-------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------Eliminar Estudio------------------------------------------------------------------------
if OBJECT_ID('spEliminarEstudios') is not null
	drop proc spEliminarEstudios
go
create proc spEliminarEstudios
@CodEstudio int
as
begin
	-- Verificar que el Codigo exista
	if exists(select CodEstudio from TEstudio where CodEstudio=@CodEstudio)
	 
		begin
			delete from TEstudio where CodEstudio = @CodEstudio
			select CodError = 0, Mensaje = 'Estudio eliminado correctamente'
		end
	 else select CodError = 1, Mensaje = 'Error: Codigo Cuenta no existe'
end
go
select * from TEstudio
exec spEliminarEstudios 2

-------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------actualizar Estudio------------------------------------------------------------------
if OBJECT_ID('spActualizarEstudio') is not null
	drop proc spActualizarEstudio
go
create proc spActualizarEstudio
	@CodEstudio	int ,
	@Vision 	char(1) ,
	@Intitucion	varchar(100) ,
	@Facultad	varchar(100),
	@Carrera	varchar(100),
	@Inicio 	date,
	@Fin		date, 
	@CodCuenta int
	                              
	as
begin
	-- CodEstudio debe existir
	if exists (select CodEstudio from TEstudio where CodEstudio=@CodEstudio and CodCuenta=@CodCuenta)

	    -- no debe actualizarse
		if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
		begin
			update TEstudio set Vision=@Vision, Intitucion=@Intitucion,Facultad=@Facultad, Carrera=@Carrera, Inicio=@Inicio,Fin=@Fin where CodEstudio=@CodEstudio and CodCuenta=@CodCuenta 
			select CodError = 0, Mensaje = 'Estudio actualizado'
		end
		
		else select CodError = 1, Mensaje = 'Error: esta cuenta no se debe actualizarse'
	else select CodError = 1, Mensaje = 'Error: cod de Cuenta no existe'
	end
go

exec spActualizarEstudio 3,'P','LIR','mec','enfermera','14/4/2020','14/4/2020',2
select * from TEstudio

