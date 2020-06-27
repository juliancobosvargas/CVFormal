using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Runtime.Serialization;

namespace CapaEntidades
{
    [DataContract]
    public class Cuenta
    {
        [DataMember]
        public int _CodCuenta
        { get; set; }
        [DataMember]
        public string _CorreoSeguro
        { get; set; }
        [DataMember]
        public string _Usuario
        { get; set; }
        [DataMember]
        public string _Contrasena
        { get; set; }
        [DataMember]
        public char _Estado
        { get; set; }
        [DataMember]
        public DateTime _Registro
        { get; set; }
        [DataMember]
        public string _Seudonimo
        { get; set; }
        [DataMember]
        public string _Privacidad
        { get; set; }
    }
}
