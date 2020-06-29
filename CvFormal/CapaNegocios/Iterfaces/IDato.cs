using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaEntidades;
using System.Data;

namespace CapaNegocios.Iterfaces
{
    interface IDato
    {
        DataRow Informacion(int codCuenta);
        bool AgregarActualizar(Dato dato);
    }
}
