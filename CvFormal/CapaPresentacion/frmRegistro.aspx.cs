using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using CapaNegocios;
using CapaEntidades;

namespace CapaPresentacion
{
    public partial class frmRegistro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime localDate = DateTime.Now;
            lblFecha.Text = localDate.ToString();
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Cuenta nuevaCuenta = new Cuenta();
            CuentaBL cuentaBl = new CuentaBL();
            nuevaCuenta._Usuario = txtUsuario.Text.Trim();
            nuevaCuenta._CorreoSeguro = txtCorreo.Text.Trim();
            nuevaCuenta._Contrasena = txtContrasena.Text;
            //fecha de registro:
            DateTime localDate = DateTime.Now;
            nuevaCuenta._Registro = localDate;
            if (cuentaBl.Agregar(nuevaCuenta))
            {
                Response.Write("<script>alert('" + cuentaBl.Mensaje + "');</script>");
                Response.Redirect("frmIngreso.aspx");
            }
            Response.Write("<script>alert('" + cuentaBl.Mensaje + "');</script>");

        }
    }
}