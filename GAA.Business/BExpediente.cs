using System;
using System.Collections.Generic;
using System.Linq;
using GAA.Entity;
using GAA.DataAccess.Persistencia;

namespace GAA.Business
{
    public class BExpediente
    {
        private ExpedienteDAO expedienteDAO = null;
        private ExpedienteDAO ExpedienteDAO
        {
            get
            {
                if (expedienteDAO == null)
                {
                    expedienteDAO = new ExpedienteDAO();
                }

                return expedienteDAO;
            }
        }

        public List<Expediente> ListarTodo()
        {
            try
            {
                return ExpedienteDAO.ListarTodos().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Expediente Crear(Expediente expedienteAcrear)
        {
            try
            {
                return ExpedienteDAO.Crear(expedienteAcrear);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

      

    }
}
