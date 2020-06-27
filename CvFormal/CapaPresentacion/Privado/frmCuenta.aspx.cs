using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//capas
using CapaNegocios;
using CapaEntidades;

namespace CapaPresentacion.Privado
{
    public partial class frmCuenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null && Session["codigo"] != null)
            {
                txtUsuario.Text = (string)Session["usuario"];
                CuentaBL cuentaBl = new CuentaBL();
                int codigo = (int)Session["codigo"];
                //String scod = Convert.ToString(codigo);
                //txtCorreo.Text = scod;
                if (cuentaBl.leerCuenta(codigo))
                {
                    //no se puede convertir Implicitamente el Tipo
                    //capaEntidades.Cuenta en CapaPresentacion.Privado.Cuenta
                    //Cuenta xCuenta = cuentaBl.MiCuenta;
                    
                    txtCorreo.Text = cuentaBl.ListaCuenta[0]; //correoSeguro
                    txtSeudonimo.Text = cuentaBl.ListaCuenta[1]; //Seudonimo
                    txtPrivacidad.Text = cuentaBl.ListaCuenta[2]; //Seudonimo

                    //Cuenta xCuenta = new Cuenta();
                    //txtCorreo.Text = (string)Session["codigo"];
                    //Cuenta cuenta = cuentaBl.laCuenta((int)Session["codigo"]);
                    //txtCorreo.Text = cuenta.
                }

            }
            else
            {
                Response.Redirect("../Default.aspx");
            }
        }

        protected void btnCuenta_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmCuenta.aspx");
        }

        protected void btnDato_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmDato.aspx");
        }

        protected void btnEstudio_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmEstudio.aspx");
        }

        protected void btnTrabajo_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmTrabajo.aspx");
        }

        protected void btnHabilidad_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmHabilidad.aspx");
        }

        protected void btnTelefono_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmTelefono.aspx");
        }

        protected void btnCorreo_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmCorreo.aspx");
        }

        protected void btnRedSocial_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmRedSocial.aspx");
        }
    }
}