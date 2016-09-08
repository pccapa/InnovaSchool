using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GAA.Web.BuilderPattern
{
    public abstract class FichaBuilder
    {
        protected Ficha ficha;

        public Ficha Ficha
        {
            get { return ficha; }
        }


        public abstract void General();
        public abstract void Documentacion();
        public abstract void ResultadoEvaluacion();
        public abstract void ResultadoProceso();

    }
}