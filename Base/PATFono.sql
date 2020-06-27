use BDCVFormal
go
--------------------------------------------------------------Prcedimiento listar Fono----------------------------------------------------------------
if OBJECT_ID('spListarFono') is not null
	drop proc spListarFono 
go
create proc spListarFono
	@CodCuenta		int 
as
	begin
	if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
	begin
	select  CodFono, Vision, Tipo ,Numero ,CodCuenta from TFono where CodCuenta=@CodCuenta
	end
	else select CodError = 1, Mensaje = 'Error:  Codigo Cuenta no existe'
	end
go

execute spListarFono 1
go
-------------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------procedimiento almacenado agregar Fono---------------------------------------------------------------------
if OBJECT_ID('spAgregarFono') is not null
	drop proc spAgregarFono
go
create proc spAgregarFono
    @Vision 	char(1) ,
	@Tipo 	varchar(20),
	@Numero	varchar(20),
	@CodCuenta		int 
	as
begin
             
				-- no debe agragarse en este es campo
					if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
		   begin
			insert into TFono values(@Vision,@Tipo,@Numero,@CodCuenta)
				select CodError = 0, Mensaje = 'Telefono insertado correctamente'
			end
				else select CodError = 1, Mensaje = 'Error:  Codigo Cuenta no existe'
			
end
go
exec spAgregarFono 'P','celular','942239758',3
select *from TFono
-------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------Eliminar Fono-----------------------------------------------------------------------
if OBJECT_ID('spEliminarFono') is not null
	drop proc spEliminarFono
go
create proc spEliminarFono
@CodFono int
as
begin
	-- Verificar que el Codigo exista
	if exists(select CodFono from TFono where CodFono=@CodFono)
	 
		begin
			delete from TFono where CodFono = @CodFono
			select CodError = 0, Mensaje = 'Fono eliminada correctamente'
		end
	 else select CodError = 1, Mensaje = 'Error: Codigo no existe'
end
go

select * from TFono
exec spEliminarFono 4

------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------actualizar Fono-----------------------------------------------------------------------------
if OBJECT_ID('spActualizarFono') is not null
	drop proc spActualizarFono
go
create proc spActualizarFono
	@CodFono 	int ,
	@Vision 	char(1) ,
	@Tipo 	varchar(20),
	@Numero	varchar(20),
	@CodCuenta int                               
	as
begin
	-- CodCarrera debe existir
	if exists (select CodFono from TFono where CodFono=@CodFono and CodCuenta=@CodCuenta)
			-- no debe actualizarse
		if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
		begin
			update TFono set Vision=@Vision, Tipo=@Tipo,Numero=@Numero  where CodFono=@CodFono and CodCuenta=@CodCuenta
			select CodError = 0, Mensaje = 'Fono actualizada'
		end
		else select CodError = 1, Mensaje = 'Error: esta cuenta  no se debe actualizarse'
		else select CodError = 1, Mensaje = 'Error: Codigo Fono no existe'
	end
go

exec spActualizarFono '2','P','fijo','1434354',2
select * from TFono
