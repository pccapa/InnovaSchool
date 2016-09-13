using System;
using System.Collections.Generic;
using System.Linq;
using GAA.Entity;
using GAA.DataAccess.Persistencia;

namespace GAA.Business
{
    public class BDocumentosExpediente
    {
        private DocumentosExpedienteDAO documentosExpedienteDAO = null;
        private DocumentosExpedienteDAO DocumentosExpedienteDAO
        {
            get
            {
                if (documentosExpedienteDAO == null)
                {
                    documentosExpedienteDAO = new DocumentosExpedienteDAO();
                }

                return documentosExpedienteDAO;
            }
        }

        public List<DocumentosExpediente> ListarTodo()
        {
            try
            {
                return DocumentosExpedienteDAO.ListarTodos().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DocumentosExpediente Crear(DocumentosExpediente documentoAcrear)
        {
            try
            {
                return DocumentosExpedienteDAO.Crear(documentoAcrear);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DocumentosExpediente Modificar(DocumentosExpediente documentoAmodificar)
        {
            try
            {
                return DocumentosExpedienteDAO.Modificar(documentoAmodificar);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void Eliminar(DocumentosExpediente documentoAeliminar)
        {
            try
            {
                DocumentosExpedienteDAO.Eliminar(documentoAeliminar);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
