using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GAA.Entity
{
    public class Expediente
    {
        private int idExpediente;

        public int IdExpediente
        {
            get { return idExpediente; }
            set { idExpediente = value; }
        }
        private CitaAdmision citaAdmision;

        public CitaAdmision CitaAdmision
        {
            get { return citaAdmision; }
            set { citaAdmision = value; }
        }
    }
}
