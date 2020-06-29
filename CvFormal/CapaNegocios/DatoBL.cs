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
    public class DatoBL : Iterfaces.IDato
    {
        // Llamar a la capa Datos
        Datos datos = new DatosSQL();

        // Declarar una propiedad de lectura para el mensaje del PA
        private string mensaje;
        public string Mensaje
        {
            get { return mensaje; }
        }

        public DataRow Informacion(int codCuenta)
        {
            DataRow fila = datos.TraerDataRow("spInfoDato", codCuenta);
            if (fila.ItemArray.Length == 2)
            {
                mensaje = fila["Mensaje"].ToString();
            }
            return fila;
        }

        public bool AgregarActualizar(Dato dato)
        {
            DataRow fila = datos.TraerDataRow("spAgregarActualizarDato", dato._Apellidos, dato._Nombres, dato._Nacimiento, dato._Dni, dato._Direccion, dato._Informacion, dato._CodCuenta);
            mensaje = fila["Mensaje"].ToString();
            byte CodError = Convert.ToByte(fila["CodError"]);
            if (CodError == 0) return true;
            else return false;
        }
    }
}
