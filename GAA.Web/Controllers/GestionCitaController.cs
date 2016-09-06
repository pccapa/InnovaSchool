using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GAA.Business;
using GAA.Entity;
using GAA.Web.ViewModels;

namespace GAA.Web.Controllers
{
    public class GestionCitaController : Controller
    {
        //
        // GET: /GestionCita/

        public ActionResult Programacion( int id)
        {
            BCitaAdmision objCitaAdmision = new BCitaAdmision();
            CitaAdmision cita = new CitaAdmision();
            GestionAdmisionViewModel viewModel = new GestionAdmisionViewModel();
            try
            {
                cita = objCitaAdmision.ListarTodo().Where(x => x.IdCitaAdmision == id).FirstOrDefault();
                viewModel.CodCitaAdmision = cita.IdCitaAdmision;
                viewModel.NombresPostulante = cita.SolicitudAdmision.Postulante.FullName;
                viewModel.GradoDescripcion = cita.SolicitudAdmision.Grado.Descripcion;
                viewModel.SucursalDescripcion = cita.SolicitudAdmision.Sucursal.Descripcion;
                viewModel.EstadoDescripcion = cita.EstadoCita.Descripcion;

                return View(viewModel);
            }
            catch (Exception ex)
            {
                
                throw ex;
            }           
        }

    }
}
