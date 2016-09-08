using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GAA.Web.AdapterPattern
{
    public class Pendiente : EstadoCita
    {
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