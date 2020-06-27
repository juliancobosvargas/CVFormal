use BDCVFormal
go
--------------------------------------------------------------Prcedimiento listar Trabajo----------------------------------------------------------------
if OBJECT_ID('spListarTrabajo') is not null
	drop proc spListarTrabajo
	go
create proc spListarTrabajo
	@CodCuenta		int 
	
as
begin
	if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
begin
	
	select   Vision, Empresa, Puesto,Supervisor,Inicio,Fin  from TTrabajo where CodCuenta=@CodCuenta
	end
		else select CodError = 1, Mensaje = 'Error:  Codigo Cuenta no existe'
end
go

execute spListarTrabajo 1

select * from TTrabajo
go
-------------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------procedimiento almacenado agregar Trabajo---------------------------------------------------------------------
if OBJECT_ID('spAgregarTrabajo') is not null
	drop proc spAgregarTrabajo
go
create proc spAgregarTrabajo
    @Vision 	char(1) ,
	@Empresa	varchar(100),
	@Puesto		varchar(100),
	@Supervisor	varchar(100),
	@Inicio		date,
	@Fin		date,
	@CodCuenta		int 
	as
begin
             
				-- no debe agragarse en este es campo
					if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
		   begin
			insert into TTrabajo values(@Vision,@Empresa,@Puesto,@Supervisor,@Inicio,@Fin,@CodCuenta)
				select CodError = 0, Mensaje = 'trabajo insertado correctamente'
			end
				else select CodError = 1, Mensaje = 'Error:  Codigo Cuenta no existe'
			
end
go
exec spAgregarTrabajo 'P','Santu','cajero','jalis','1999/9/14','',2
select *from TTrabajo
-------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------Eliminar Trabajo-----------------------------------------------------------------------
if OBJECT_ID('spEliminarTrabajo') is not null
	drop proc spEliminarTrabajo
go
create proc spEliminarTrabajo
@CodTrabajo int
as
begin
	-- Verificar que el Codigo exista
	if exists(select CodTrabajo from TTrabajo where CodTrabajo=@CodTrabajo)
	 
		begin
			delete from TTrabajo where CodTrabajo = @CodTrabajo
			select CodError = 0, Mensaje = 'Trabajo eliminado correctamente'
		end
	 else select CodError = 1, Mensaje = 'Error: Codigo no existe'
end
go

select * from TTrabajo
exec spEliminarTrabajo 3
--go
------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------actualizar Trabajo-----------------------------------------------------------------------------
if OBJECT_ID('spActualizarTrabajo') is not null
	drop proc spActualizarTrabajo
go
create proc spActualizarTrabajo
	@CodTrabajo	int ,	
	@Vision 	char(1) ,
	@Empresa	varchar(100),
	@Puesto		varchar(100),
	@Supervisor	varchar(100),
	@Inicio		date,
	@Fin		date,
	@CodCuenta	int                            
	as
begin
			-- CodTrabajo debe existir
			if exists (select CodTrabajo from TTrabajo where CodTrabajo=@CodTrabajo and CodCuenta=@CodCuenta)
				if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
		        -- no debe actualizarse
		begin
			update TTrabajo set Vision=@Vision, Empresa=@Empresa,Puesto=@Puesto,Supervisor=@Supervisor,Inicio=@Inicio,Fin=@Fin where CodTrabajo=@CodTrabajo and CodCuenta=@CodCuenta
			select CodError = 0, Mensaje = 'Trabajo actualizado'
		end
		else select CodError = 1, Mensaje = 'Error: esta cuenta  no se debe actualizarse'

		else select CodError = 1, Mensaje = 'Error: Codigo trabajo no existe'
	end
go

exec spActualizarTrabajo '1003','P','sol','profe','SR ','','',2
select * from TTrabajo
