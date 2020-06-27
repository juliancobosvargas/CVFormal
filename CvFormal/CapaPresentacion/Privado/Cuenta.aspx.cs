using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion.Privado
{
    public partial class Cuenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCuenta_Click(object sender, EventArgs e)
        {
            mvSectores.ActiveViewIndex = 0;
        }

        protected void btnDato_Click(object sender, EventArgs e)
        {
            mvSectores.ActiveViewIndex = 1;
        }

        protected void btnEstudio_Click(object sender, EventArgs e)
        {
            mvSectores.ActiveViewIndex = 2;
        }

        protected void btnTrabajo_Click(object sender, EventArgs e)
        {
            mvSectores.ActiveViewIndex = 3;
        }

        protected void btnHabilidad_Click(object sender, EventArgs e)
        {
            mvSectores.ActiveViewIndex = 4;
        }

        protected void btnTelefono_Click(object sender, EventArgs e)
        {
            mvSectores.ActiveViewIndex = 5;
        }

        protected void btnCorreo_Click(object sender, EventArgs e)
        {
            mvSectores.ActiveViewIndex = 6;
        }

        protected void btnRedSocial_Click(object sender, EventArgs e)
        {
            mvSectores.ActiveViewIndex = 7;
        }
    }
}