using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Runtime.Serialization;

namespace CapaEntidades
{
    [DataContract]
    public class Dato
    {
        [DataMember]
        public int _CodDatos
        { get; set; }

        [DataMember]
        public string _Apellidos
        { get; set; }

        [DataMember]
        public string _Nombres
        { get; set; }

        [DataMember]
        public DateTime _Nacimiento
        { get; set; }

        [DataMember]
        public string _Dni
        { get; set; }

        [DataMember]
        public string _Direccion
        { get; set; }

        [DataMember]
        public string _Informacion
        { get; set; }

        [DataMember]
        public int _CodCuenta
        { get; set; }
 
    }
}
