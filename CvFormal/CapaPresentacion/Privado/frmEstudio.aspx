﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmEstudio.aspx.cs" Inherits="CapaPresentacion.Privado.frmEstudio" %>

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
                        <asp:Button ID="btnCuenta" runat="server" Text="Cuenta" class="btn btn-secondary" OnClick="btnCuenta_Click"/>
                        <asp:Button ID="btnDato" runat="server" Text="Dato" class="btn btn-secondary" OnClick="btnDato_Click"/>
                        <asp:Button ID="btnEstudio" runat="server" Text="Estudio" class="btn btn-success" OnClick="btnEstudio_Click"/>
                        <asp:Button ID="btnTrabajo" runat="server" Text="Trabajo" class="btn btn-secondary" OnClick="btnTrabajo_Click"/>
                        <asp:Button ID="btnHabilidad" runat="server" Text="Habilidad" class="btn btn-secondary" OnClick="btnHabilidad_Click"/>
                        <asp:Button ID="btnTelefono" runat="server" Text="Telefono" class="btn btn-secondary" OnClick="btnTelefono_Click"/>
                        <asp:Button ID="btnCorreo" runat="server" Text="Correo" class="btn btn-secondary" OnClick="btnCorreo_Click"/>
                        <asp:Button ID="btnRedSocial" runat="server" Text="Red Social" class="btn btn-secondary" OnClick="btnRedSocial_Click"/>
                    </div>
                    <div class="col-md-1">
                        <!--Separacion-->
                    </div>
                    <div class="col-md-8">
                        <div id="fEstudio">
                            <h2>Estudio</h2>
                            <div class="form-group">
                                <label for="txtVision">Vision:</label>
                                <asp:TextBox runat="server" ID="txtVision" class="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtIntitucion">Intitucion:</label>
                                <asp:TextBox runat="server" ID="txtIntitucion" class="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtFacultad">Facultad:</label>
                                <asp:TextBox runat="server" ID="txtFacultad" class="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtCarrera">Carrera:</label>
                                <asp:TextBox runat="server" ID="txtCarrera" class="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtInicio">Inicio:</label>
                                <asp:TextBox runat="server" ID="txtInicio" class="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtFin">Fin:</label>
                                <asp:TextBox runat="server" ID="txtFin" class="form-control"></asp:TextBox>
                            </div>
                            <asp:Button ID="btnActualizarCuenta" runat="server" Text="Actualizar" class="btn btn-primary"/>
                        </div>
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
