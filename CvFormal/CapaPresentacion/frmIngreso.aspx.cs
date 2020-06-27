using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//capas
using CapaNegocios;
using CapaEntidades;
//para autenticar 
using System.Web.Security;
namespace CapaPresentacion
{
    public partial class frmIngreso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            //Autenticar sin base
            String usuario = Login1.UserName;
            String contras = Login1.Password;
            if (usuario != "" && contras != "")
            {
                CuentaBL cuentaBl = new CuentaBL();
                if (cuentaBl.Existe(usuario, contras))
                {
                    FormsAuthentication.RedirectFromLoginPage(usuario, false);
                    Session["codigo"] = cuentaBl.CodigoCuenta;
                    Session["usuario"] = cuentaBl.Mensaje;
                }
                Response.Write("<script>alert('" + cuentaBl.Mensaje + "');</script>");
            }
            else
            {
                Login1.FailureText = "Usuario y/o Contraseña Incorrecto";
            }
        }
    }
}