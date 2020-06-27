<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmRegistro.aspx.cs" Inherits="CapaPresentacion.frmRegistro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>CVFormal</title>

    <meta name="description" content="Source code generated using layoutit.com"/>
    <meta name="author" content="LayoutIt!"/>

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/style.css" rel="stylesheet" />

    <link href="rojo/Forma.css" rel="stylesheet" />
</head>
<body>
    
    <div id="cabeza">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3 logo">
            CVFormal
          </div>
          <div class="col-md-9">
            <div class="row">
              <div class="col-md-4">
              </div>
              <div class="col-md-4">
                <a href="frmRegistro.aspx" class="btn">Registro</a>
              </div>
              <div class="col-md-4">
                <a href="frmIngreso.aspx" class="btn">Ingreso</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    
    
    <div id="cuerpo">
        <h1>Registro de Cuenta</h1>
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-4">
          </div>
          <div class="col-md-4">
            <form id="form1" runat="server" role="form">
                <div class="form-group">
                <label for="txtUsuario">usuario:</label>
                <asp:TextBox runat="server" ID="txtUsuario" class="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                <label for="txtCorreo">Correo Seguro:</label>
                <asp:TextBox runat="server" ID="txtCorreo" type="email" class="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtContrasena">Contraseña:</label>
                    <asp:TextBox runat="server" ID="txtContrasena" type="password" class="form-control" TextMode="Password"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtConfirma">confirma Contraseña:</label>
                    <asp:TextBox runat="server" ID="txtConfirma" type="password" class="form-control" TextMode="Password"></asp:TextBox>
                </div>
                <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" class="btn btn-primary" OnClick="btnRegistrar_Click"/>
                <div class="form-group">
                    <asp:Label runat="server" ID="lblFecha"></asp:Label>
                </div>
            </form>
          </div>
          <div class="col-md-4">
          </div>
        </div>
      </div>
    </div>

    

    <div id="derechos">
      © Todos los Derechos Reservados ®
    </div>
    <div id="autor" class="container-fluid">
      <div class="row">
        <div class="col-md-3 autor1">
          <p>Cobos Vargas</p>
          <p>Irvin Julian</p>
          <p>50 %</p>
        </div>
        <div class="col-md-3 autor2">
          <p>Cuadros Bolaños</p>
          <p>William Ronaldo</p>
            <p>30 %</p>
        </div>
        <div class="col-md-3 autor1">
          <p>Calvo Arteaga</p>
          <p>Carlos Antonio</p>
            <p>15 %</p>
        </div>
        <div class="col-md-3 autor2">
          <p>Romero Salas</p>
          <p>Jairo Dajik</p>
            <p>5 %</p>
        </div>
      </div>
    </div>
    <div id="pie">
      Grupo ROJO
    </div>
    <!--Del Layoutit-->
    <script src="Scripts/jquery.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/scripts.js"></script>
</body>
</html>
