using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GAA.Entity
{
    public class CitaAdmision
    {
        private int idCitaAdmision;

        public int IdCitaAdmision
        {
            get { return idCitaAdmision; }
            set { idCitaAdmision = value; }
        }
        private SolicitudAdmision solicitudAdmision;

        public SolicitudAdmision SolicitudAdmision
        {
            get { return solicitudAdmision; }
            set { solicitudAdmision = value; }
        }
        private DateTime fechaCita;

        public DateTime FechaCita
        {
            get { return fechaCita; }
            set { fechaCita = value; }
        }
        private int numeroIntento;

        public int NumeroIntento
        {
            get { return numeroIntento; }
            set { numeroIntento = value; }
        }
    }
}
