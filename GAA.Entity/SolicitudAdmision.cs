using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GAA.Entity
{
    public class SolicitudAdmision
    {
        private int idSolicitudAdmision;

        public int IdSolicitudAdmision
        {
            get { return idSolicitudAdmision; }
            set { idSolicitudAdmision = value; }
        }
        private Postulante postulante;

        public Postulante Postulante
        {
            get { return postulante; }
            set { postulante = value; }
        }
        private Grado grado;

        public Grado Grado
        {
            get { return grado; }
            set { grado = value; }
        }
        private Sucursal sucursal;

        public Sucursal Sucursal
        {
            get { return sucursal; }
            set { sucursal = value; }
        }
        private DateTime fechaSolicitud;

        public DateTime FechaSolicitud
        {
            get { return fechaSolicitud; }
            set { fechaSolicitud = value; }
        }

        public string Fecha
        {
            get { return fechaSolicitud.ToString("dd/MM/yyyy") ; }            
        }
        public string Hora
        {
            get { return fechaSolicitud.ToString("HH:mm:ss"); }
        }
    }
}
