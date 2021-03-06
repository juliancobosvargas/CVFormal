﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaEntidades;
using System.Data;

namespace CapaNegocios.Iterfaces
{
    interface ICuenta
    {
        bool Existe(string usu, string contra);
        DataRow Informacion(int codCuenta);
        bool Agregar(Cuenta cuenta);
        bool Eliminar(int codCuenta);
        bool Reactivar(int codCuenta);
        bool ActualizarContra(int codCuenta, string contra);
        bool ActualizarSeudo(int codCuenta, string seudo);
        bool ActualizarPriva(int codCuenta, string priva);
    }
}
