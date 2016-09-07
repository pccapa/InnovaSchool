using System;
using System.Collections.Generic;
using System.Linq;
using GAA.Entity;
using GAA.DataAccess.Persistencia;

namespace GAA.Business
{
    public class BCitaAdmision
    {
        private CitaAdmisionDAO citaAdmisionDAO = null;
        private CitaAdmisionDAO CitaAdmisionDAO
        {
            get
            {
                if (citaAdmisionDAO == null)
                {
                    citaAdmisionDAO = new CitaAdmisionDAO();
                }

                return citaAdmisionDAO;
            }
        }

        public List<CitaAdmision> ListarTodo()
        {
            try
            {
                return CitaAdmisionDAO.ListarTodos().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public CitaAdmision Crear(CitaAdmision citaAcrear)
        {
            try
            {
                return CitaAdmisionDAO.Crear(citaAcrear);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public CitaAdmision Modificar(CitaAdmision citaAmodificar)
        {
            try
            {
                return CitaAdmisionDAO.Modificar(citaAmodificar);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
