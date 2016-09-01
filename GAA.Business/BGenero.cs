using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GAA.Entity;
using GAA.DataAccess.Persistencia;

namespace GAA.Business
{
    public class BGenero
    {
        private GeneroDAO generoDAO = null;
        private GeneroDAO GeneroDAO
        {
            get
            {
                if (generoDAO == null)
                {
                    generoDAO = new GeneroDAO();
                }

                return generoDAO;
            }
        }

        public List<Genero> ListarTodo()
        {
            try
            {
                return GeneroDAO.ListarTodos().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}
