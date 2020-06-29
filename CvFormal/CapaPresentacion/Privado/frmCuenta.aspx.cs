using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//capas
using CapaNegocios;
using CapaEntidades;
using System.Data;

namespace CapaPresentacion.Privado
{
    public partial class frmCuenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) // Solo carga el listado la primera vez
            {
                if (Session["usuario"] != null && Session["codigo"] != null)
                {
                    txtUsuario.Text = (string)Session["usuario"];
                    CuentaBL cuentaBl = new CuentaBL();
                    int codigo = (int)Session["codigo"];
                    //info de la cuenta
                    DataRow fila = cuentaBl.Informacion(codigo);
                    if (fila.ItemArray.Length > 2)
                    {
                        txtCorreo.Text = fila["CorreoSeguro"].ToString();
                        txtSeudonimo.Text = fila["Seudonimo"].ToString();
                        txtPrivacidad.Text = fila["Privacidad"].ToString();
                    }
                }
                else
                {
                    Response.Redirect("../Default.aspx");
                }
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

        //cambio el seudonimo
        protected void btnActualizarSeudo_Click(object sender, EventArgs e)
        {
            String seudo = txtSeudonimo.Text.Trim();
            Response.Write("<script>alert('" + seudo + "');</script>");
            int codigo = (int)Session["codigo"];
            CuentaBL cuentaBl = new CuentaBL();
            cuentaBl.ActualizarSeudo(codigo, seudo);
            Response.Write("<script>alert('" + cuentaBl.Mensaje + "');</script>");
        }
        //cambio el Privacidad
        protected void btnActualizarPriva_Click(object sender, EventArgs e)
        {
            int codigo = (int)Session["codigo"];
            CuentaBL cuentaBl = new CuentaBL();
            cuentaBl.ActualizarPriva(codigo, txtPrivacidad.Text.Trim());
            Response.Write("<script>alert('" + cuentaBl.Mensaje + "');</script>");
        }
        //me voy al Formulario de Cambio de Contraseña
        protected void btnActualizarContra_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmActualizarContra.aspx");
        }
    }
}