using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GAA.Entity
{
    public class EstadoExpediente
    {
        private int idEstadoExpediente;

        public int IdEstadoExpediente
        {
            get { return idEstadoExpediente; }
            set { idEstadoExpediente = value; }
        }
        private string descripcion;

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }
    }
}
