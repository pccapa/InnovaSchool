using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GAA.Entity;
using GAA.DataAccess.Persistencia;

namespace GAA.Business
{
    public class BResultadoEvaluacion
    {
        private ResultadoEvaluacionDAO resultadoEvaluacionDAO = null;
        private ResultadoEvaluacionDAO ResultadoEvaluacionDAO
        {
            get
            {
                if (resultadoEvaluacionDAO == null)
                {
                    resultadoEvaluacionDAO = new ResultadoEvaluacionDAO();
                }

                return resultadoEvaluacionDAO;
            }
        }

        public List<ResultadoEvaluacion> ListarTodo()
        {
            try
            {
                return ResultadoEvaluacionDAO.ListarTodos().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public ResultadoEvaluacion Crear(ResultadoEvaluacion resultadoEvaluacionAcrear)
        {
            try
            {
                return ResultadoEvaluacionDAO.Crear(resultadoEvaluacionAcrear);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


      

    }
}
