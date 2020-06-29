use BDCVFormal
go
--------------------------------------------------------------Prcedimiento listar Dato----------------------------------------------------------------

if OBJECT_ID('spInfoDato') is not null
	drop proc spInfoDato 
go
create proc spInfoDato
	@CodCuenta	int
as
begin
	if exists (select * from TDato where CodCuenta=@CodCuenta)
	begin
		select * from TDato where CodCuenta=@CodCuenta
	end
	else select CodError = 1, Mensaje = 'no hay Datos'
end
go
--muestro una fila
execute spInfoDato 1
go
--si no hay fila
execute spInfoDato 3
go
--------------------------------------------------

if OBJECT_ID('spAgregarActualizarDato') is not null
	drop proc spAgregarActualizarDato
go
create proc spAgregarActualizarDato
    @Apellidos 		varchar(100) ,
	@Nombres		varchar(100) ,
	@Nacimiento		date,
	@Dni			varchar(20),
	@Direccion		varchar(100),
	@Informacion 	varchar(500),
	@CodCuenta		int
as
begin
	--si no existe cuenta no puede agregar Dato
	if exists(select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
		--si no existe dato lo agrega caso contrario lo actualiza
		if not exists(select CodCuenta from TDato where CodCuenta=@CodCuenta)
		begin
			insert into TDato values(@Apellidos,@Nombres,@Nacimiento,@Dni,@Direccion,@Informacion,@CodCuenta)
			select CodError = 0, Mensaje = 'Dato Agregado'
		end
		--si SI existe dato con esta cuenta entonces lo actualiza
		else
		begin
			--busco el codDato que pertenece a la codCuenta
			declare @CodDato int
			set @CodDato = (select CodDato from TDato where CodCuenta=@CodCuenta)
			--ubico el codDato y actualizo su fila
			update TDato set Apellidos=@Apellidos, Nombres=@Nombres,Nacimiento=Nacimiento, Dni=@Dni, Direccion=@Direccion,Informacion=Informacion where CodCuenta=@CodCuenta and CodCuenta=@CodCuenta
			select CodError = 0, Mensaje = 'Dato Actualizado'
		end
	else select CodError = 1, Mensaje = 'No Existe Cuenta'
end
go
--ejecutar
select *from TDato
exec spAgregarActualizarDato 'Cobos','Frank','14/4/2020','7456323','Cusco','trabajar',2
go
select * from TDato
select *from TCuenta

-------------------------------------------------------------------------------------------------------------------------------------------------------
