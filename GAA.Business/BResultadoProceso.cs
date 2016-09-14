using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GAA.Entity;
using GAA.DataAccess.Persistencia;

namespace GAA.Business
{
    public class BResultadoProceso
    {
        private ResultadoProcesoDAO resultadoProcesoDAO = null;
        private ResultadoProcesoDAO ResultadoProcesoDAO
        {
            get
            {
                if (resultadoProcesoDAO == null)
                {
                    resultadoProcesoDAO = new ResultadoProcesoDAO();
                }

                return resultadoProcesoDAO;
            }
        }

        public List<ResultadoProceso> ListarTodo()
        {
            try
            {
                return ResultadoProcesoDAO.ListarTodos().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public ResultadoProceso Crear(ResultadoProceso resultadoProcesoAcrear)
        {
            try
            {
                return ResultadoProcesoDAO.Crear(resultadoProcesoAcrear);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

      

    }
}
