using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GAA.Entity
{
    public class DocumentosExpediente
    {
        private int idDocumentosExpediente;

        public int IdDocumentosExpediente
        {
            get { return idDocumentosExpediente; }
            set { idDocumentosExpediente = value; }
        }
        private Expediente expediente;

        public Expediente Expediente
        {
            get { return expediente; }
            set { expediente = value; }
        }
        private DateTime fechaDocumento;

        public DateTime FechaDocumento
        {
            get { return fechaDocumento; }
            set { fechaDocumento = value; }
        }
        private string observacion;

        public string Observacion
        {
            get { return observacion; }
            set { observacion = value; }
        }
        private string ruta;

        public string Ruta
        {
            get { return ruta; }
            set { ruta = value; }
        }

        private int tipo;

        public int Tipo
        {
            get { return tipo; }
            set { tipo = value; }
        }

    }
}
