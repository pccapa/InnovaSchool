using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GAA.Entity;
using GAA.DataAccess.Persistencia;

namespace GAA.Business
{
    public class BTipoDocumento
    {
        private TipoDocumentoDAO tipoDocumentoDAO = null;
        private TipoDocumentoDAO TipoDocumentoDAO
        {
            get
            {
                if (tipoDocumentoDAO == null)
                {
                    tipoDocumentoDAO = new TipoDocumentoDAO();
                }

                return tipoDocumentoDAO;
            }
        }


        public List<TipoDocumento> ListarTodo()
        {
            try
            {
                return TipoDocumentoDAO.ListarTodos().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}
