use BDCVFormal
go
--------------------------------------------------------------------
if OBJECT_ID('spExisteCuenta') is not null
	drop proc spExisteCuenta
go
create proc spExisteCuenta
	@Usuario_o_Correo	varchar(100),
	@Contrasena	varchar(100)
as
begin
	declare @CodCuenta int
	if exists (select Usuario from TCuenta where Usuario=@Usuario_o_Correo)
		begin
		set @CodCuenta = (select CodCuenta from TCuenta where Usuario=@Usuario_o_Correo)
		end
	else if exists (select CorreoSeguro from TCuenta where CorreoSeguro=@Usuario_o_Correo)
		begin
		set @CodCuenta = (select CodCuenta from TCuenta where CorreoSeguro=@Usuario_o_Correo)
		end

--si existe Usuario:
	if @CodCuenta IS NOT NULL
		begin
			--desencripto contrasena
			declare @ContraDesencrip varchar(100)
			set @ContraDesencrip = (select CAST(DECRYPTBYPASSPHRASE('tokencovid19',Contrasena) as varchar(100)) from TCuenta where CodCuenta=@CodCuenta)
			if (@Contrasena = @ContraDesencrip)
				begin
					--estado Activo
					declare @Est char(1)
					set @Est = (select Estado from TCuenta where CodCuenta=@CodCuenta)
					if (@Est = 'A')
					begin
						declare @Cod int
						set @Cod = (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
						declare @Usu varchar(100)
						set @Usu = (select Usuario from TCuenta where CodCuenta=@CodCuenta)
						select Respuesta = 0, Usuario = @Usu, CodCuenta = @Cod
					end
					else select Respuesta = 2, Mensaje = 'Cuenta NO Activa', Estado = @Est
				end
			else select Respuesta = 1, Mensaje = 'Contraseña Incorrecta'
		end
	else select Respuesta = 1, Mensaje = 'Usuario o Correo No Existe'
end
go
--ejecutar con usuario
execute spExisteCuenta 'julian','j123'
go
--ejecutar con correo
execute spExisteCuenta 'julian@gmail','j123'
go
--ejecutar usuario Inactivo
execute spExisteCuenta 'Frank','nueva2'
go

--------------------------------------------------------------------
if OBJECT_ID('spInfoCuenta') is not null
	drop proc spInfoCuenta
go
create proc spInfoCuenta
	@CodCuenta int
as
begin
	if exists(select * from TCuenta where CodCuenta=@CodCuenta)
		begin
			select * from TCuenta where CodCuenta=@CodCuenta
		end
	else select Respuesta = 1, Mensaje = 'No Existe'
end
go
--ejecutar
execute spInfoCuenta 1
go
--si suenta esta inactiva
execute spInfoCuenta 8
go

-----------------------------------------------------------------
if OBJECT_ID('spAgregarCuenta') is not null
	drop proc spAgregarCuenta
go
create proc spAgregarCuenta
	@CorreoSeguro 	varchar(100),
	@Usuario 		varchar(100),
	@Contrasena		varchar(100),
	@Registro		Date
as
begin
	if not exists (select CorreoSeguro from TCuenta where CorreoSeguro = @CorreoSeguro)
		if not exists (select Usuario from TCuenta where Usuario = @Usuario)
		   begin
				insert into TCuenta values(@CorreoSeguro,@Usuario,ENCRYPTBYPASSPHRASE('tokencovid19',@Contrasena),'A',@Registro,null,null)
				select Respuesta = 0, Mensaje = 'Cuenta insertada correctamente'
			end
		else select Respuesta = 1, Mensaje = 'Error: Usuario duplicada'
	else select Respuesta = 1, Mensaje = 'Error: Correo duplicado'
end
go
--ejecutar
select *from TCuenta
exec spAgregarCuenta 'Eva@gmail','Eva','e123','18/6/2020'
go
select *from TCuenta

------------------------------------------------------------------------------------------

if OBJECT_ID('spEliminarCuenta') is not null
	drop proc spEliminarCuenta
go
create proc spEliminarCuenta
@CodCuenta int
as
begin
	-- Verificar que el Codigo exista
	if exists(select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
		--una cuenta nunca se Elimina solo Cambia su Estado
		begin
			declare @Estado char(1) = 'I'
			update TCuenta set Estado = @Estado where CodCuenta=@CodCuenta
			select Respuesta = 0, Mensaje = 'Cuenta eliminada correctamente'
		end
	 else select Respuesta = 1, Mensaje = 'Error: CodCuenta NO Encontrada'
end
go
--Ejecuta
select * from TCuenta
exec spEliminarCuenta 3
go
select * from TCuenta

-------------------------------------------
if OBJECT_ID('spReaActivarCuenta') is not null
	drop proc spReaActivarCuenta
go
create proc spReaActivarCuenta
@CodCuenta int
as
begin
	-- Verificar que el Codigo exista
	if exists(select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
		--una cuenta nunca se Elimina solo Cambia su Estado
		begin
			declare @Estado char(1) = 'A'
			update TCuenta set Estado = @Estado where CodCuenta=@CodCuenta
			select Respuesta = 0, Mensaje = 'Cuenta ReaActivada correctamente'
		end
	 else select Respuesta = 1, Mensaje = 'Error: CodCuenta NO Encontrada'
end
go
--Ejecuta
select * from TCuenta
exec spReaActivarCuenta 3
go
select * from TCuenta

--------------------------------------------
--desencriptar contrasena
if OBJECT_ID('spDesencriptarCuenta') is not null
	drop proc spDesencriptarCuenta
go
create proc spDesencriptarCuenta
@CodCuenta int
as
begin
	-- Verificar que el Codigo exista
	if exists(select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
		begin
			declare @ContraDesencrip varchar(100)
			set @ContraDesencrip = (select CAST(DECRYPTBYPASSPHRASE('tokencovid19',Contrasena) as varchar(100)) from TCuenta where CodCuenta=@CodCuenta)
			declare @Encripto varbinary(200) = ENCRYPTBYPASSPHRASE('tokencovid19',@ContraDesencrip)

			select Respuesta = 0, Mensaje = @ContraDesencrip, Encrip = @Encripto
		end
	 else select Respuesta = 1, Mensaje = 'Error: CodCuenta NO Encontrada'
end
go
--Ejecuta
select * from TCuenta
exec spDesencriptarCuenta 1
go
select * from TCuenta
--Un detalle cuando Encriptas se genera un codigo diferente cada vez
--Entonces para hacer comparaciones no puedo comparar dos encriptados
--primero debo desencriptarlos y luego compararlos


------------------------------------------------------------------------------
if OBJECT_ID('spActualizarCuentaContra') is not null
	drop proc spActualizarCuentaContra
go
create proc spActualizarCuentaContra
	@CodCuenta 			int ,
	@ContrasenaNueva	varchar(100)
as
begin
	-- CodCuenta debe existir
	if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
		begin
			update TCuenta set Contrasena = ENCRYPTBYPASSPHRASE('tokencovid19',@ContrasenaNueva) where CodCuenta=@CodCuenta
			select Respuesta = 0, Mensaje = 'Contraseña actualizada'
		end
	else select Respuesta = 1, Mensaje = 'Error: CodCuenta no existe'
end
go
--ejecutar
select *from TCuenta
exec spActualizarCuentaContra 2,'nueva2'
go
select *from TCuenta

------------------------------------------------------------------------------
if OBJECT_ID('spActualizarCuentaSeudo') is not null
	drop proc spActualizarCuentaSeudo
go
create proc spActualizarCuentaSeudo
	@CodCuenta 		int ,
	@Seudonimo		varchar(100)
as
begin
	-- CodCuenta debe existir
	if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
		-- Seudonimo NO debe repetir
		if not exists (select Seudonimo from TCuenta where Seudonimo=@Seudonimo)
			begin
				update TCuenta set Seudonimo = @Seudonimo where CodCuenta=@CodCuenta
				select Respuesta = 0, Mensaje = 'Seudonimo actualizado'
			end
		else select Respuesta = 1, Mensaje = 'Error: Seudonimo YA existe'
	else select Respuesta = 1, Mensaje = 'Error: CodCuenta no existe'
end
go
--ejecutar
select *from TCuenta
exec spActualizarCuentaSeudo 1,'Seudo2'
go
select *from TCuenta

------------------------------------------------------------------------------
if OBJECT_ID('spActualizarCuentaPriva') is not null
	drop proc spActualizarCuentaPriva
go
create proc spActualizarCuentaPriva
	@CodCuenta 		int ,
	@Privacidad		varchar(100)
as
begin
	-- CodCuenta debe existir
	if exists (select CodCuenta from TCuenta where CodCuenta=@CodCuenta)
		begin
			update TCuenta set Privacidad = @Privacidad where CodCuenta=@CodCuenta
			select Respuesta = 0, Mensaje = 'Codigo de Privacidad actualizado'
		end
	else select Respuesta = 1, Mensaje = 'Error: CodCuenta no existe'
end
go
--ejecutar
select *from TCuenta
exec spActualizarCuentaPriva 2,'Priv'
go
select *from TCuenta


