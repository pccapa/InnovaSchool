using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GAA.Entity;
using GAA.DataAccess.Persistencia;

namespace GAA.Business
{
    public class BCiudad
    {
        private CiudadDAO ciudadDAO = null;
        private CiudadDAO CiudadDAO
        {
            get
            {
                if (ciudadDAO == null)
                {
                    ciudadDAO = new CiudadDAO();
                }

                return ciudadDAO;
            }
        }

        public List<Ciudad> ListarTodo()
        {
            try
            {
                return CiudadDAO.ListarTodos().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}
