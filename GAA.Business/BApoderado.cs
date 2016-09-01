using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GAA.Entity;
using GAA.DataAccess.Persistencia;

namespace GAA.Business
{
    public   class BApoderado
    {
        private ApoderadoDAO apoderadoDAO = null;
        private ApoderadoDAO ApoderadoDAO
        {
            get
            {
                if (apoderadoDAO == null)
                {
                    apoderadoDAO = new ApoderadoDAO();
                }

                return apoderadoDAO;
            }
        }

        public List<Apoderado> ListarTodo()
        {
            try
            {
                return ApoderadoDAO.ListarTodos().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Apoderado Crear(Apoderado apoderadoAcrear)
        {
            try
            {
                return ApoderadoDAO.Crear(apoderadoAcrear);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
