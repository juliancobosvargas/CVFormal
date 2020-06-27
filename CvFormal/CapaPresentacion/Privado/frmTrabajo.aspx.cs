using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion.Privado
{
    public partial class frmTrabajo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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