using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GAA.Web.AdapterPattern
{
    public class EstadoAdapter:EstadoCita
    {
        public Rechazado Rechazado{ get; set; }
        public Aprobado Aprobado { get; set; }

        public override void ValidarCita()
        {
            throw new NotImplementedException();
        }

        public override void RegistrarCita()
        {
            throw new NotImplementedException();
        }

        public override void MostrarCita()
        {
            throw new NotImplementedException();
        }
    }
}