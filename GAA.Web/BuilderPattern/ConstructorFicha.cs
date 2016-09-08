using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GAA.Web.BuilderPattern
{
    public class ConstructorFicha
    {
        public void Constructor(FichaBuilder expedienteBuilder)
        {
            expedienteBuilder.General();
            expedienteBuilder.Documentacion();
            expedienteBuilder.ResultadoEvaluacion();
            expedienteBuilder.ResultadoProceso();
        }

    }
}