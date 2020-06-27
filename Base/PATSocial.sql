use BDCVFormal
go
--------------------------------------------------------------Prcedimiento listar Red Social----------------------------------------------------------------
if OBJECT_ID('spListarSocial') is not null
	drop proc spListarSocial 
go
create proc spListarSocial
@CodCuenta		int 
as
	begin 
	if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
begin
	select  CodSocial, Vision, Tipo Ruta ,CodCuenta from TSocial where CodCuenta=@CodCuenta
end
	else select CodError = 1, Mensaje = 'Error:  Codigo Cuenta no existe'
end
go

execute spListarSocial 1
go
-------------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------procedimiento almacenado agregar Red Social---------------------------------------------------------------------
if OBJECT_ID('spAgregarSocial') is not null
	drop proc spAgregarSocial
go
create proc spAgregarSocial
    @Vision 	char(1) ,
	@Tipo 	varchar(100),
	@Ruta	varchar(100),
	@CodCuenta		int 
	as
begin
             
				-- no debe agragarse en este es campo
					if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
		   begin
			insert into TSocial values(@Vision,@Tipo,@Ruta,@CodCuenta)
				select CodError = 0, Mensaje = 'Red social insertado correctamente'
			end
				else select CodError = 1, Mensaje = 'Error:  Codigo Cuenta no existe'
			
end
go
exec spAgregarSocial 'V','instagran','www.instgran',3
select *from TSocial
-------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------Eliminar Red Social-----------------------------------------------------------------------
if OBJECT_ID('spEliminarSocial') is not null
	drop proc spEliminarSocial
go
create proc spEliminarSocial
@CodSocial int
as
begin
	-- Verificar que el Codigo exista
	if exists(select CodSocial from TSocial where CodSocial=@CodSocial)
	 
		begin
			delete from TSocial where CodSocial = @CodSocial
			select CodError = 0, Mensaje = 'Red social eliminada correctamente'
		end
	 else select CodError = 1, Mensaje = 'Error: Codigo no existe'
end
go

select * from TSocial
exec spEliminarSocial 2
--go
------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------actualizar Fono-----------------------------------------------------------------------------
if OBJECT_ID('spActualizarSocial') is not null
	drop proc spActualizarSocial
go
create proc spActualizarSocial
	@CodSocial	int ,
	@Vision 	char(1) ,
	@Tipo 		varchar(100),
	@Ruta		varchar(100),
	@CodCuenta	int
                                     
	as
begin
	-- CodCarrera debe existir
	if exists (select CodSocial from TSocial where CodSocial=@CodSocial and CodCuenta=@CodCuenta)
		-- no debe actualizarse
		if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
		begin
			update TSocial set Vision=@Vision, Tipo=@Tipo,Ruta=@Ruta  where CodSocial=@CodSocial and CodCuenta=@CodCuenta
			select CodError = 0, Mensaje = 'Red social actualizada'
		end
		else select CodError = 1, Mensaje = 'Error: esta cuenta  no se debe actualizarse'
		else select CodError = 1, Mensaje = 'Error: Codigo Red social no existe'
	end
go

exec spActualizarSocial '3','P','twiter','ww',2
select * from TSocial
