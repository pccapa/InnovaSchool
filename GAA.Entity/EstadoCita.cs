using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GAA.Entity
{
    public class EstadoCita
    {
        private int idEstadoCita;

        public int IdEstadoCita
        {
            get { return idEstadoCita; }
            set { idEstadoCita = value; }
        }
        private string descripcion;

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }
    }
}
