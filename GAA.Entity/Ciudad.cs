using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GAA.Entity
{
    public class Ciudad
    {
        private int idCiudad;

        public int IdCiudad
        {
            get { return idCiudad; }
            set { idCiudad = value; }
        }
        private IList<Sucursal> sucursal;

        public IList<Sucursal> Sucursal
        {
            get { return sucursal; }
            set { sucursal = value; }
        }

        private Departamento departamento;

        public Departamento Departamento
        {
            get { return departamento; }
            set { departamento = value; }
        }
        private string descripcion;

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }

    }
}
