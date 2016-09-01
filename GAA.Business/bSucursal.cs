using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GAA.Entity;
using GAA.DataAccess.Persistencia;

namespace GAA.Business
{
    public class BSucursal
    {
        private SucursalDAO sucursalDAO = null;
        private SucursalDAO SucursalDAO
        {
            get
            {
                if (sucursalDAO == null)
                {
                    sucursalDAO = new SucursalDAO();
                }

                return sucursalDAO;
            }
        }

        public List<Sucursal> ListarTodo()
        {
            try
            {
                return SucursalDAO.ListarTodos().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}
