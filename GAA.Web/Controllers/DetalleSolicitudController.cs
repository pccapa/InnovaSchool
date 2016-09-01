using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GAA.Entity;
using GAA.Business;


namespace GAA.Web.Controllers
{
    public class DetalleSolicitudController : Controller
    {
        


        public ActionResult DetalleSolicitud(int id)
        {
            try
            {
                BSolicitudAdmision objSocilitud = new BSolicitudAdmision();
                SolicitudAdmision solicitud = objSocilitud.ListarTodo().Where(x => x.IdSolicitudAdmision == id).FirstOrDefault();
                return View(solicitud);
            }
            catch (Exception ex)
            {                
                throw ex;
            }

            
        }

    }
}
