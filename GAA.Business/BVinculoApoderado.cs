using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GAA.Entity;
using GAA.DataAccess.Persistencia;

namespace GAA.Business
{
    public class BVinculoApoderado
    {
        private VinculoApoderadoDAO vinculoApoderadoDAO = null;
        private VinculoApoderadoDAO VinculoApoderadoDAO
        {
            get
            {
                if (vinculoApoderadoDAO == null)
                {
                    vinculoApoderadoDAO = new VinculoApoderadoDAO();
                }

                return vinculoApoderadoDAO;
            }
        }

        public List<VinculoApoderado> ListarTodo()
        {
            try
            {
                return VinculoApoderadoDAO.ListarTodos().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}
