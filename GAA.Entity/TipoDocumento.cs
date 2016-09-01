using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GAA.Entity
{
    public class TipoDocumento
    {
        private int idTipoDocumento;
        private string descripcion;

        public int IdTipoDocumento
        {
            get { return idTipoDocumento; }
            set { idTipoDocumento = value; }
        }
        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }

        

    }
}
