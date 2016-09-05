using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GAA.Entity
{
    public class Apoderado
    {
        private int idApoderado;

        public int IdApoderado
        {
            get { return idApoderado; }
            set { idApoderado = value; }
        }
        private TipoDocumento tipoDocumento;

        public TipoDocumento TipoDocumento
        {
            get { return tipoDocumento; }
            set { tipoDocumento = value; }
        }        
        private VinculoApoderado vinculoApoderado;

        public VinculoApoderado VinculoApoderado
        {
            get { return vinculoApoderado; }
            set { vinculoApoderado = value; }
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
        private string ocupacion;

        public string Ocupacion
        {
            get { return ocupacion; }
            set { ocupacion = value; }
        }
        private string email;

        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private string telefono;

        public string Telefono
        {
            get { return telefono; }
            set { telefono = value; }
        }
        private string direccion;

        public string Direccion
        {
            get { return direccion; }
            set { direccion = value; }
        }

        public  string FullName
        {
            get { return nombre + " " + apellido; }            
        }

    }
}
