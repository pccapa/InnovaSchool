using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GAA.Entity
{
    public class Postulante
    {
        private int idPostulante;

        public int IdPostulante
        {
            get { return idPostulante; }
            set { idPostulante = value; }
        }
        private Apoderado apoderado;

        public Apoderado Apoderado
        {
            get { return apoderado; }
            set { apoderado = value; }
        }

        

        private Genero genero;

        public Genero Genero
        {
            get { return genero; }
            set { genero = value; }
        }
        private TipoDocumento tipoDocumento;

        public TipoDocumento TipoDocumento
        {
            get { return tipoDocumento; }
            set { tipoDocumento = value; }
        }

        private Ciudad ciudad;

        public Ciudad Ciudad
        {
            get { return ciudad; }
            set { ciudad = value; }
        }
       
        private string nombre;

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        private string apellido;

        public string Apellido
        {
            get { return apellido; }
            set { apellido = value; }
        }
        private int numeroDocumento;

        public int NumeroDocumento
        {
            get { return numeroDocumento; }
            set { numeroDocumento = value; }
        }
        private DateTime fechaNacimiento;

        public DateTime FechaNacimiento
        {
            get { return fechaNacimiento; }
            set { fechaNacimiento = value; }
        }
        private string lugarNacimiento;                

        public string LugarNacimiento
        {
            get { return lugarNacimiento; }
            set { lugarNacimiento = value; }
        }

        public  string FullName
        {
            get { return nombre+ " "+apellido; }            
        }

    }
}
