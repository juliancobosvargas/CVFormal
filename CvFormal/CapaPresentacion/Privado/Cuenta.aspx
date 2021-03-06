﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cuenta.aspx.cs" Inherits="CapaPresentacion.Privado.Cuenta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>CVFormal</title>

    <meta name="description" content="Source code generated using layoutit.com"/>
    <meta name="author" content="LayoutIt!"/>

    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/style.css" rel="stylesheet" />

    <link href="../rojo/Forma.css" rel="stylesheet" />
</head>
<body>

    <form id="form1" runat="server">

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
                      <p><asp:LoginName ID="LoginName2" runat="server" /></p>
                  </div>
                  <div class="col-md-4">
                    <asp:LoginStatus ID="LoginStatus2" runat="server" />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        
    
        <div id="cuerpo">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">
              <asp:Button ID="btnCuenta" runat="server" Text="Cuenta" class="btn btn-success" OnClick="btnCuenta_Click"/>
              <asp:Button ID="btnDato" runat="server" Text="Dato" class="btn btn-secondary" OnClick="btnDato_Click"/>
              <asp:Button ID="btnEstudio" runat="server" Text="Estudio" class="btn btn-secondary" OnClick="btnEstudio_Click"/>
              <asp:Button ID="btnTrabajo" runat="server" Text="Trabajo" class="btn btn-secondary" OnClick="btnTrabajo_Click"/>
              <asp:Button ID="btnHabilidad" runat="server" Text="Habilidad" class="btn btn-secondary" OnClick="btnHabilidad_Click"/>
              <asp:Button ID="btnTelefono" runat="server" Text="Telefono" class="btn btn-secondary" OnClick="btnTelefono_Click"/>
              <asp:Button ID="btnCorreo" runat="server" Text="Correo" class="btn btn-secondary" OnClick="btnCorreo_Click"/>
              <asp:Button ID="btnRedSocial" runat="server" Text="Red Social" class="btn btn-secondary" OnClick="btnRedSocial_Click"/>
          </div>
          <div class="col-md-1">
          </div>
          <div class="col-md-8">
            <asp:MultiView ActiveViewIndex ="0" runat="server" ID="mvSectores">
                <asp:View runat="server" ID="vCuenta">
                    <div id="fCuenta">
                        <h2>Cuenta</h2>
                        <div class="form-group">
                            <label for="txtUsuario">Usuario:</label>
                            <asp:TextBox runat="server" ID="txtUsuario" class="form-control" ReadOnly="True"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtCorreo">Correo Seguro:</label>
                            <asp:TextBox runat="server" ID="txtCorreo" type="email" class="form-control" ReadOnly="True"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtSeudonimo">Seudonimo:</label>
                            <asp:TextBox runat="server" ID="txtSeudonimo" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtPrivacidad">Privacidad:</label>
                            <asp:TextBox runat="server" ID="txtPrivacidad" type="password" class="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnActualizarCuenta" runat="server" Text="Actualizar" class="btn btn-primary"/>
                    </div>
                </asp:View>
                <asp:View runat="server" ID="vDato">
                    <div id="fDato">
                        <h2>Dato</h2>
                        <div class="form-group">
                            <label for="txtApellidos">Apellidos:</label>
                            <asp:TextBox runat="server" ID="txtApellidos" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtNombres">Nombres:</label>
                            <asp:TextBox runat="server" ID="txtNombres" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtNacimiento">Nacimiento:</label>
                            <asp:TextBox runat="server" ID="txtNacimiento" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtDNI">DNI:</label>
                            <asp:TextBox runat="server" ID="txtDNI" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtInformacion">Informacion:</label>
                            <asp:TextBox runat="server" ID="txtInformacion" class="form-control" TextMode="MultiLine"></asp:TextBox>

                        </div>
                        <asp:Button ID="Button1" runat="server" Text="Actualizar" class="btn btn-primary"/>
                    </div>
                </asp:View>
                <asp:View runat="server" ID="vEstudio">
                    <h2>vEstudio</h2>
                    <p>informacion de vEstudio</p>
                </asp:View>
                <asp:View runat="server" ID="vTrabajo">
                    <h2>vTrabajo</h2>
                    <p>informacion de vTrabajo</p>
                </asp:View>
                <asp:View runat="server" ID="vHabilidad">
                    <h2>vHabilidad</h2>
                    <p>informacion de vHabilidad</p>
                </asp:View>
                <asp:View runat="server" ID="vTelefono">
                    <h2>vTelefono</h2>
                    <p>informacion de vTelefono</p>
                </asp:View>
                <asp:View runat="server" ID="vCorreo">
                    <h2>vCorreo</h2>
                    <p>informacion de vCorreo</p>
                </asp:View>
                <asp:View runat="server" ID="vRedSocial">
                    <h2>vRedSocial</h2>
                    <p>informacion de vRedSocial</p>
                </asp:View>
            </asp:MultiView>
          </div>
        </div>
      </div>
    </div>


    </form>

    

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
