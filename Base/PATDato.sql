use BDCVFormal
go
--------------------------------------------------------------Prcedimiento listar Dato----------------------------------------------------------------

if OBJECT_ID('spListarDato') is not null
	drop proc spListarDato 
go
create proc spListarDato
@CodCuenta		int
as
begin
	if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
begin
	select  CodDato, Apellidos, Nombres ,Nacimiento,Dni,Direccion,Informacion,CodCuenta from TDato where CodCuenta=@CodCuenta
end
	else select CodError = 1, Mensaje = 'Error:  Codigo Cuenta no existe'
end
go

execute spListarDato 2
go
-------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------agragar procedimiento almacenado Dato---------------------------------------------------------------------------
if OBJECT_ID('spAgregarDato') is not null
	drop proc spAgregarDato
go
create proc spAgregarDato
    @Apellidos 	varchar(100) ,
	@Nombres	varchar(100) ,
	@Nacimiento	date,
	@Dni        varchar(20),
	@Direccion	varchar(100),
	@Informacion 	varchar(500),
	@CodCuenta int
	
	as
begin
             -- CodFono no se duplica
	        
				-- CodFono no se duplica
				if not exists(select @Apellidos from TDato where Apellidos=@Apellidos)
					-- CodFono no se duplica
					if not exists(select @Nombres from TDato where Nombres=@Nombres)
							-- CodFono no se duplica
							if not exists(select @Dni from TDato where Dni=@Dni)
																						        
				
		   begin
			insert into TDato values(@Apellidos,@Nombres,@Nacimiento,@Dni,@Direccion,@Informacion,@CodCuenta)
				select CodError = 0, Mensaje = 'Dato insertado correctamente'
			end
				
			else select CodError = 1, Mensaje = 'Error: Solo se puede registrar una cuenta'
			else select CodError = 1, Mensaje = 'Error: Solo se puede registrar una cuenta'
			else select CodError = 1, Mensaje = 'Error: Solo se puede registrar una cuenta'
			
			
end
go

exec spAgregarDato 'Calvo','Carlos Antonio','14/4/2020','7456323','Cusco','trabajar',2
--go
select * from TDato
select *from TCuenta

-------------------------------------------------------------------------------------------------------------------------------------------------------





---------------------------------------------------------------------------actualizar Fono------------------------------------------------------------
if OBJECT_ID('spActualizarDato') is not null
	drop proc spActualizarDato
go
create proc spActualizarDato
	@CodDato int,
	@Apellidos 	varchar(100) ,
	@Nombres	varchar(100) ,
	@Nacimiento	date,
	@Dni        varchar(20),
	@Direccion	varchar(100),
	@Informacion 	varchar(500),
	@CodCuenta int
	                          
	as
begin
	-- CodDAto debe existir
		if exists (select CodDato from TDato where CodDato=@CodDato and CodCuenta=@CodCuenta)
				
		-- no debe actualizarse
		if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
		begin
			update TDato set Apellidos=@Apellidos, Nombres=@Nombres,Nacimiento=Nacimiento, Dni=@Dni, Direccion=@Direccion,Informacion=Informacion where CodCuenta=@CodCuenta and CodCuenta=@CodCuenta
			select CodError = 0, Mensaje = 'Dato actualizado'
		end
		else select CodError = 1, Mensaje = 'Error: esta cuenta no se debe actualizar'

	else select CodError = 1, Mensaje = 'Error: Codigo trabajo no existe'
			
	end
go

exec spActualizarDato 2,'Calv','Carlo','14/4/2020','3243543','arequipa','busca',2
select * from TDato
----------------------------------------------------------------------------------------