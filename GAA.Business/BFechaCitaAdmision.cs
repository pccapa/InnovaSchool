using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GAA.Entity;
using GAA.DataAccess.Persistencia;

namespace GAA.Business
{
    public class BFechaCitaAdmision
    {
        private FechaCitaAdmisionDAO fechaCitaDAO = null;
        private FechaCitaAdmisionDAO FechaCitaDAO
        {
            get
            {
                if (fechaCitaDAO == null)
                {
                    fechaCitaDAO = new FechaCitaAdmisionDAO();
                }

                return fechaCitaDAO;
            }
        }

        public List<FechaCitaAdmision> ListarTodo()
        {
            try
            {
                return FechaCitaDAO.ListarTodos().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}
