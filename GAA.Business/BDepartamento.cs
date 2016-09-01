using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GAA.Entity;
using GAA.DataAccess.Persistencia;

namespace GAA.Business
{
    public class BDepartamento
    {
        private DepartamentoDAO departamentoDAO = null;
        private DepartamentoDAO DepartamentoDAO
        {
            get
            {
                if (departamentoDAO == null)
                {
                    departamentoDAO = new DepartamentoDAO();
                }

                return departamentoDAO;
            }
        }

        public List<Departamento> ListarTodo()
        {
            try
            {
                return DepartamentoDAO.ListarTodos().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}
