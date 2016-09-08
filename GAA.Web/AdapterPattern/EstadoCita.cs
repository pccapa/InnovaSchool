using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GAA.Web.AdapterPattern
{
    public abstract class EstadoCita
    {

        public abstract void ValidarCita();
        public abstract void RegistrarCita();
        public abstract void MostrarCita();
    }
}