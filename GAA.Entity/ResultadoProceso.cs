using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GAA.Entity
{
    public class ResultadoProceso
    {
        private int idResultadoProceso;

        public int IdResultadoProceso
        {
            get { return idResultadoProceso; }
            set { idResultadoProceso = value; }
        }
        private Expediente expediente;

        public Expediente Expediente
        {
            get { return expediente; }
            set { expediente = value; }
        }
        private string fechaResultado;

        public string FechaResultado
        {
            get { return fechaResultado; }
            set { fechaResultado = value; }
        }

        private string resultado;

        public string Resultado
        {
            get { return resultado; }
            set { resultado = value; }
        }

        private string observacionResultado;

        public string ObservacionResultado
        {
            get { return observacionResultado; }
            set { observacionResultado = value; }
        }

     
    }
}
