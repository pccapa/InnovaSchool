using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GAA.Entity;
using GAA.DataAccess.Persistencia;

namespace GAA.Business
{
    public class BSolicitudAdmision
    {
        private SolicitudAdmisionDAO solicitudAdmisionDAO = null;
        private SolicitudAdmisionDAO SolicitudAdmisionDAO
        {
            get
            {
                if (solicitudAdmisionDAO == null)
                {
                    solicitudAdmisionDAO = new SolicitudAdmisionDAO();
                }

                return solicitudAdmisionDAO;
            }
        }

        public List<SolicitudAdmision> ListarTodo()
        {
            try
            {
                return SolicitudAdmisionDAO.ListarTodos().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public SolicitudAdmision Crear(SolicitudAdmision solicitudAcrear)
        {
            try
            {
                return SolicitudAdmisionDAO.Crear(solicitudAcrear) ;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
