use BDCVFormal
go
--------------------------------------------------------------Prcedimiento correo Fono----------------------------------------------------------------
if OBJECT_ID('spListarCorreo') is not null
	drop proc spListarCorreo 
go
create proc spListarCorreo
	@CodCuenta int
as
begin
	if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
begin
	select  CodCorreo,Vision,Tipo,Correo ,CodCuenta from TCorreo where CodCuenta=@CodCuenta
	end
	else select CodError = 1, Mensaje = 'Error:  Codigo Cuenta no existe'
end
go

execute spListarCorreo 1
--go
-------------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------procedimiento almacenado agregar Fono---------------------------------------------------------------------
if OBJECT_ID('spAgregarCorreo') is not null
	drop proc spAgregarCorreo
go
create proc spAgregarCorreo
	@Vision 	char(1) ,
	@Tipo 	varchar(100),
	@Correo	varchar(100),
	@CodCuenta		int 
	as
begin
             
				-- no debe agragarse en este es campo
					if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
		   begin
			insert into TCorreo values(@Vision,@Tipo,@Correo,@CodCuenta)
				select CodError = 0, Mensaje = 'Correo insertado correctamente'
			end
				else select CodError = 1, Mensaje = 'Error: Codigo Cuenta no existe'
			
end
go

 
exec spAgregarCorreo 'P','trabajo','jairo@gmail',2
select *from TCorreo
SELECT* FROM TCuenta
-------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------Eliminar Correo-----------------------------------------------------------------------
if OBJECT_ID('spEliminarCorreo') is not null
	drop proc spEliminarCorreo
go
create proc spEliminarCorreo
@CodCorreo int
as
begin
	-- Verificar que el Codigo exista
	if exists(select CodCorreo from TCorreo where CodCorreo=@CodCorreo)
	 
		begin
			delete from TCorreo where CodCorreo = @CodCorreo
			select CodError = 0, Mensaje = 'Correo eliminado correctamente'
		end
	 else select CodError = 1, Mensaje = 'Error: Codigo no existe'
end
go
select * from TCorreo

exec spEliminarCorreo 2
go
------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------actualizar Fono-----------------------------------------------------------------------------
if OBJECT_ID('spActualizarCorreo') is not null
	drop proc spActualizarCorreo
go
create proc spActualizarCorreo
	@CodCorreo 	int ,
	@Vision 	char(1) ,
	@Tipo 	varchar(100),
	@Correo	varchar(100),
	@CodCuenta int
                                     
	as
begin
	-- CodCarrera debe existir
	if exists (select @CodCorreo from TCorreo where CodCorreo=@CodCorreo and CodCuenta=@CodCuenta)
		-- no debe actualizarse
		if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
		begin
			update TCorreo set Vision=@Vision, Tipo=@Tipo,Correo=@Correo  where CodCorreo=@CodCorreo and CodCuenta=@CodCuenta
			select CodError = 0, Mensaje = 'Correo actualizado'
		end
		else select CodError = 1, Mensaje = 'Error: esta cuenta  no se debe actualizarse'
		else select CodError = 1, Mensaje = 'Error: Codigo Correo no existe'
	end
go

exec spActualizarCorreo '3','P','Trabajo','Carlos@gmail.com',1
select * from TCorreo
go