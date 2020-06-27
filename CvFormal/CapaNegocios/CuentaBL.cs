using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaDatos;
using CapaEntidades;
using System.Data;

namespace CapaNegocios
{
    public class CuentaBL : CapaNegocios.Iterfaces.ICuenta
    {
        // Llamar a la capa Datos
        Datos datos = new DatosSQL();

        // Declarar una propiedad de lectura para el mensaje del PA
        private string mensaje;
        public string Mensaje
        {
            get { return mensaje; }
        }

        // Declarar una propiedad de lectura para CodCuenta Int
        private int codigoCuenta;
        public int CodigoCuenta
        {
            get { return codigoCuenta; }
        }

        public bool Existe(string usu, string contra)
        {
            DataRow fila = datos.TraerDataRow("spExisteCuenta", usu, contra);
            int Respuesta = Convert.ToInt32(fila["Respuesta"]);
            if (Respuesta == 0)
            {
                codigoCuenta = Convert.ToInt32(fila["CodCuenta"]);
                mensaje = fila["Usuario"].ToString();
                return true;
            }
            else
            {
                mensaje = fila["Mensaje"].ToString();
                return false;
            }
        }



        // Declarar una propiedad de lectura para miCuenta
        private Cuenta miCuenta;
        public Cuenta MiCuenta
        {
            get { return miCuenta; }
        }

        // Declarar una Lista
        private List<string> listaCuenta;
        public List<string> ListaCuenta
        {
            get { return listaCuenta; }
        }


        public bool leerCuenta(int codCuenta)
        {
            DataRow fila = datos.TraerDataRow("spInfoCuenta", codCuenta);
            if (fila.ItemArray.Length == 2)
            {
                return false;
            }
            else
            {
                //esto no me deja mandar
                miCuenta = new Cuenta();
                miCuenta._CodCuenta = Convert.ToInt32(fila["CodCuenta"]);
                miCuenta._CorreoSeguro = fila["CorreoSeguro"].ToString();
                miCuenta._Usuario = fila["Usuario"].ToString();
                //miCuenta._Contrasena = fila["Contrasena"].ToString();
                miCuenta._Estado = Convert.ToChar(fila["Estado"]);
                miCuenta._Registro = Convert.ToDateTime(fila["Registro"]);
                miCuenta._Seudonimo = fila["Seudonimo"].ToString();
                miCuenta._Privacidad = fila["Privacidad"].ToString();

                //mando por variables en una lista
                listaCuenta = new List<string>();
                listaCuenta.Add(fila["CorreoSeguro"].ToString());
                listaCuenta.Add(fila["Seudonimo"].ToString());
                listaCuenta.Add(fila["Privacidad"].ToString());
                return true;
            }
        }

        public DataTable Listar(int codCuenta)
        {
            DataTable tabla = datos.TraerDataTable("spListarCuenta", codCuenta);
            /*codigoCuenta = 0;
            if (tabla != null)
            {
                if (tabla.Rows.Count > 0)
                {
                    DataRow fila = tabla.Rows.Find(0);
                    codigoCuenta = Convert.ToInt32(fila["CodCuenta"]);
                }
            }*/
            return tabla;
        }

        public bool Agregar(Cuenta cuenta)
        {
            DataRow fila = datos.TraerDataRow("spAgregarCuenta", cuenta._CorreoSeguro, cuenta._Usuario, cuenta._Contrasena, cuenta._Registro);
            mensaje = fila["Mensaje"].ToString();
            byte Respuesta = Convert.ToByte(fila["Respuesta"]);
            if (Respuesta == 0) return true;
            else return false;
        }

        public bool Eliminar(int codCuenta)
        {
            DataRow fila = datos.TraerDataRow("spEliminarCuenta", codCuenta);
            mensaje = fila["Mensaje"].ToString();
            byte Respuesta = Convert.ToByte(fila["Respuesta"]);
            if (Respuesta == 0) return true;
            else return false;
        }

        public bool ActualizarContra(int codCuenta, string contra)
        {
            DataRow fila = datos.TraerDataRow("spActualizarContra", codCuenta, contra);
            mensaje = fila["Mensaje"].ToString();
            byte Respuesta = Convert.ToByte(fila["Respuesta"]);
            if (Respuesta == 0) return true;
            else return false;
        }

        public bool ActualizarSeudo(int codCuenta, string seudo)
        {
            DataRow fila = datos.TraerDataRow("spActualizarSeudo", codCuenta, seudo);
            mensaje = fila["Mensaje"].ToString();
            byte Respuesta = Convert.ToByte(fila["Respuesta"]);
            if (Respuesta == 0) return true;
            else return false;
        }

        public bool ActualizarPriva(int codCuenta, string priva)
        {
            DataRow fila = datos.TraerDataRow("spActualizarPriva", codCuenta, priva);
            mensaje = fila["Mensaje"].ToString();
            byte Respuesta = Convert.ToByte(fila["Respuesta"]);
            if (Respuesta == 0) return true;
            else return false;
        }





        
    }
}
