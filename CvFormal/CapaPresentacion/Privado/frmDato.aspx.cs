﻿using System;
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
    public partial class frmDato : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) // Solo carga el listado la primera vez
            {
                if (Session["usuario"] != null && Session["codigo"] != null)
                {
                    //codcuenta:
                    int codigo = (int)Session["codigo"];
                    DatoBL datoBl = new DatoBL();
                    DataRow fila = datoBl.Informacion(codigo);
                    if (fila.ItemArray.Length > 2)
                    {
                        txtApellidos.Text = fila["Apellidos"].ToString();
                        txtNombres.Text = fila["Nombres"].ToString();
                        txtDNI.Text = fila["Dni"].ToString();
                        txtDireccion.Text = fila["Direccion"].ToString();
                        txtInformacion.Text = fila["Informacion"].ToString();

                        //nacimiento
                        Calendario.SelectedDate = Convert.ToDateTime(fila["Nacimiento"]);
                        txtNacimiento.Text = fila["Nacimiento"].ToString();
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

        //calendario
        protected void DateChange(object sender, EventArgs e)
        {
            txtNacimiento.Text = Calendario.SelectedDate.ToShortDateString();
        }

        //Agregar o Actualizar Dato
        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            int codigo = (int)Session["codigo"];
            DatoBL datoBl = new DatoBL();
            Dato nuevoDato = new Dato();
            nuevoDato._Apellidos = txtApellidos.Text.Trim();
            nuevoDato._Nombres = txtNombres.Text.Trim();
            try
            {
                String fecha = txtNacimiento.Text.Trim();
                nuevoDato._Nacimiento = Convert.ToDateTime(fecha);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            nuevoDato._Dni = txtDNI.Text.Trim();
            nuevoDato._Direccion = txtDireccion.Text.Trim();
            nuevoDato._Informacion = txtInformacion.Text.Trim();
            //debo darle el CodCuenta que tiene como ForenKey
            nuevoDato._CodCuenta = codigo;
            datoBl.AgregarActualizar(nuevoDato);
            Response.Write("<script>alert('" + datoBl.Mensaje + "');</script>");
        }


    }
}