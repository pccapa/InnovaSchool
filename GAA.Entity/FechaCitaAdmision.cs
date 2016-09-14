using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GAA.Entity
{
    public class FechaCitaAdmision
    {
        private int idFechaCitaAdmision;

        public int IdFechaCitaAdmision
        {
            get { return idFechaCitaAdmision; }
            set { idFechaCitaAdmision = value; }
        }

        private DateTime fechaCita;

        public DateTime FechaCita
        {
            get { return fechaCita; }
            set { fechaCita = value; }
        }
        private int estado;

        public int Estado
        {
            get { return estado; }
            set { estado = value; }
        }

      

        

    }
}
