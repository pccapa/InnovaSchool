using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GAA.Entity
{
    public class ResultadoEvaluacion
    {
        private int idResultadoEvaluacion;

        public int IdResultadoEvaluacion
        {
            get { return idResultadoEvaluacion; }
            set { idResultadoEvaluacion = value; }
        }
        private Expediente expediente;

        public Expediente Expediente
        {
            get { return expediente; }
            set { expediente = value; }
        }
        private string resultadoPrueba;

        public string ResultadoPrueba
        {
            get { return resultadoPrueba; }
            set { resultadoPrueba = value; }
        }
        private string tipoEvaluacion;

        public string TipoEvaluacion
        {
            get { return tipoEvaluacion; }
            set { tipoEvaluacion = value; }
        }
        private string evaluador;

        public string Evaluador
        {
            get { return evaluador; }
            set { evaluador = value; }
        }
        private string cargoEvaluador;

        public string CargoEvaluador
        {
            get { return cargoEvaluador; }
            set { cargoEvaluador = value; }
        }
        private string fechaEvaluacion;

        public string FechaEvaluacion
        {
            get { return fechaEvaluacion; }
            set { fechaEvaluacion = value; }
        }

       
    }
}
