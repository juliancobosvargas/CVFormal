use BDCVFormal
go
--------------------------------------------------------------Prcedimiento listar Habilidad----------------------------------------------------------------
if OBJECT_ID('spListarHabilidad') is not null
	drop proc spListarHabilidad
go
create proc spListarHabilidad
	@CodCuenta		int 
as
	begin
	if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
begin
	select  CodHabilidad, Vision, Nombre ,Nivel,CodCuenta from THabilidad where  CodCuenta=@CodCuenta
end
	else select CodError = 1, Mensaje = 'Error:  Codigo Cuenta no existe'
end
go

execute spListarHabilidad 1
select * from THabilidad
--go

-------------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------procedimiento almacenado agregar Habilidad---------------------------------------------------------------------
if OBJECT_ID('spAgregarHabilidad') is not null
	drop proc spAgregarHabilidad
go
create proc spAgregarHabilidad
    @Vision 	char(1) ,
	@Nombre  	varchar(100),
	@Nivel		int,
	@CodCuenta	int 
	as
begin
			-- no debe agragarse en este es campo
					if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)        
				
		   begin
			insert into THabilidad values(@Vision,@Nombre,@Nivel,@CodCuenta)
				select CodError = 0, Mensaje = 'Habilidad insertado correctamente'
			end
			else select CodError = 1, Mensaje = 'Error: Error: Codigo Cuenta no existe'
				
			
end
go
exec spAgregarHabilidad 'P','word','10',2
select *from THabilidad
-------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------Eliminar Habilidad-----------------------------------------------------------------------
if OBJECT_ID('spEliminarHabilidad') is not null
	drop proc spEliminarHabilidad
go
create proc spEliminarHabilidad
@CodHabilidad int
as
begin
	-- Verificar que el Codigo exista
	if exists(select CodHabilidad from THabilidad where CodHabilidad=@CodHabilidad)
	 
		begin
			delete from THabilidad where CodHabilidad = @CodHabilidad
			select CodError = 0, Mensaje = 'Habilidad eliminada correctamente'
		end
	 else select CodError = 1, Mensaje = 'Error: Codigo no existe'
end
go
select * from THabilidad
exec spEliminarhabilidad 3
--go
------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------actualizar Fono-----------------------------------------------------------------------------
if OBJECT_ID('spActualizarHabilidad') is not null
	drop proc spActualizarHabilidad
go
create proc spActualizarHabilidad
	@CodHabilidad 	int ,
	@Vision 	char(1) ,
	@Nombre 	varchar(100),
	@Nivel	int,
	@CodCuenta int
                                     
	as
begin
	-- CodCarrera debe existir
	if exists (select CodHabilidad from THabilidad where CodHabilidad=@CodHabilidad and CodCuenta=@CodCuenta)
		-- no debe actualizarse
		if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
		begin
			update THabilidad set Vision=@Vision, Nombre=@Nombre,Nivel=@Nivel  where CodHabilidad=@CodHabilidad and CodCuenta=@CodCuenta
			select CodError = 0, Mensaje = 'Habilidad actualizada'
		end
		else select CodError = 1, Mensaje = 'Error: esta cuenta  no se debe actualizarse'
		else select CodError = 1, Mensaje = 'Error: Codigo habilidad no existe'
	end
go

exec spActualizarHabilidad 3,'P','excel','18',1
select * from Thabilidad
