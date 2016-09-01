using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GAA.Entity
{
    public class Sucursal
    {
        private int idSucursal;

        public int IdSucursal
        {
            get { return idSucursal; }
            set { idSucursal = value; }
        }
        private Ciudad ciudad;

        public Ciudad Ciudad
        {
            get { return ciudad; }
            set { ciudad = value; }
        }

        private string descripcion;

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }
    }
}
