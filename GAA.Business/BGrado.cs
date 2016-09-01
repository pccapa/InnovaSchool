using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GAA.Entity;
using GAA.DataAccess.Persistencia;

namespace GAA.Business
{
    public class BGrado
    {
        private GradoDAO gradoDAO = null;
        private GradoDAO GradoDAO
        {
            get
            {
                if (gradoDAO == null)
                {
                    gradoDAO = new GradoDAO();
                }

                return gradoDAO;
            }
        }

        public List<Grado> ListarTodo()
        {
            try
            {
                return GradoDAO.ListarTodos().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}
