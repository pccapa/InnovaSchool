using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GAA.Entity
{
    public class VinculoApoderado
    {
        private int idVinculoApoderado;

        public int IdVinculoApoderado
        {
            get { return idVinculoApoderado; }
            set { idVinculoApoderado = value; }
        }
        private string descripcion;

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }
    }
}
