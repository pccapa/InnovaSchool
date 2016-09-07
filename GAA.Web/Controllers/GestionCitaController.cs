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

        public ActionResult Programacion(int id)
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

                DateTime fechainicio = new DateTime(2016, 010, 01, 9, 00, 00);
                DateTime fechafin = new DateTime(2016, 010, 01, 18, 00, 00);
                List<HorarioHora> lista = new List<HorarioHora>();

                for (int t = 0; fechainicio <= fechafin; t++)
                {
                    lista.Add(new HorarioHora() { Codigo = fechainicio.AddHours(1).ToString("HH:mm"), Valor = fechainicio.AddHours(1).ToString("HH:mm") });
                    fechainicio = fechainicio.AddHours(1);
                }

                ViewBag.ListaHora = new SelectList(lista, "Codigo", "Valor", 0);

                return View(viewModel);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public ActionResult Reprogramacion(int id)
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
                viewModel.FechaCitaAdmision = ((DateTime) cita.FechaCita);                

                DateTime fechainicio = new DateTime(2016, 010, 01, 9, 00, 00);
                DateTime fechafin = new DateTime(2016, 010, 01, 18, 00, 00);
                List<HorarioHora> lista = new List<HorarioHora>();

                for (int t = 0; fechainicio <= fechafin; t++)
                {
                    lista.Add(new HorarioHora() { Codigo = fechainicio.AddHours(1).ToString("HH:mm"), Valor = fechainicio.AddHours(1).ToString("HH:mm") });
                    fechainicio = fechainicio.AddHours(1);
                }

                ViewBag.ListaHora = new SelectList(lista, "Codigo", "Valor", 0);

                return View(viewModel);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [HttpPost]
        public ActionResult Registro(FormCollection collection) {
            try
            {
                BCitaAdmision objCita = new BCitaAdmision();
                CitaAdmision cita= objCita.ListarTodo().Where(x=>x.IdCitaAdmision==Convert.ToInt32( collection["CodCitaAdmision"]) ).FirstOrDefault() ;

                DateTime fecha= Convert.ToDateTime(collection["FechaCitaAdmision"]);
                cita.FechaCita = new DateTime(fecha.Year, fecha.Month, fecha.Day, Convert.ToInt32(collection["HoraCitaAdmision"].Substring(0, 2)), 0, 0);
                cita.EstadoCita=new EstadoCita(){IdEstadoCita=2};

                cita=objCita.Modificar(cita);

                if (cita.IdCitaAdmision > 0)
                    return Json(new { success = true, responseText = "OK" }, JsonRequestBehavior.AllowGet);
                else
                    return Json(new { success = true, responseText = "Ocurrió un incoveniente al registrar la cita" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, responseText = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }




    }
}
