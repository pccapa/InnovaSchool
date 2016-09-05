using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GAA.Entity;
using GAA.DataAccess.Persistencia;

namespace GAA.Business
{
    public class BPostulante
    {
        private PostulanteDAO postulanteDAO = null;
        private PostulanteDAO PostulanteDAO
        {
            get
            {
                if (postulanteDAO == null)
                {
                    postulanteDAO = new PostulanteDAO();
                }

                return postulanteDAO;
            }
        }

        public List<Postulante> ListarTodo()
        {
            try
            {
                return PostulanteDAO.ListarTodos().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Postulante Crear(Postulante postulanteAcrear)
        {
            try
            {
                return PostulanteDAO.Crear(postulanteAcrear);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Postulante Modificar(Postulante postulanteAmodificar)
        {
            try
            {
                return PostulanteDAO.Modificar(postulanteAmodificar);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
