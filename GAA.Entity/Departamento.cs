using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GAA.Entity
{
    public class Departamento
    {
        private int idDepartamento;

        public int IdDepartamento
        {
            get { return idDepartamento; }
            set { idDepartamento = value; }
        }
        private IList<Ciudad> ciudad;

        public IList<Ciudad> Ciudad
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
