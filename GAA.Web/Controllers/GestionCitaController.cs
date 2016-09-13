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

        public ActionResult Programacion(int id)
        {
            BCitaAdmision objCitaAdmision = new BCitaAdmision();
            BFechaCitaAdmision objFechaCita = new BFechaCitaAdmision();
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

                var listfecha = (from c in objFechaCita.ListarTodo()
                                 select new
                                 {
                                     id = c.FechaCita.ToString("dd/MM/yyyy"),
                                     name = c.FechaCita.ToString("dd/MM/yyyy")
                                 }).Distinct().ToList();

                ViewBag.ListaFechaCita = new SelectList(listfecha, "id", "name", 0);

                return View(viewModel);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ActionResult Reprogramacion(int id)
        {
            BFechaCitaAdmision objFechaCita = new BFechaCitaAdmision();
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
                viewModel.FechaCitaAdmision = Convert.ToDateTime(cita.FechaCita).ToString("dd/MM/yyyy");
                viewModel.HoraCitaAdmision = Convert.ToDateTime(cita.FechaCita).ToString("HH:mm");

                var listfecha = (from c in objFechaCita.ListarTodo()
                                 select new
                                 {
                                     id = c.FechaCita.ToString("dd/MM/yyyy"),
                                     name = c.FechaCita.ToString("dd/MM/yyyy")
                                 }).Distinct().ToList();

                ViewBag.ListaFechaCita = new SelectList(listfecha, "id", "name", 0);

                return View(viewModel);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [HttpPost]
        public ActionResult Registro(FormCollection collection)
        {
            try
            {
                BCitaAdmision objCita = new BCitaAdmision();
                CitaAdmision cita = objCita.ListarTodo().Where(x => x.IdCitaAdmision == Convert.ToInt32(collection["CodCitaAdmision"])).FirstOrDefault();

                DateTime fecha = Convert.ToDateTime(collection["FechaCitaAdmision"]);
                cita.FechaCita = new DateTime(fecha.Year, fecha.Month, fecha.Day, Convert.ToInt32(collection["HoraCitaAdmision"].Substring(0, 2)), 0, 0);
                cita.EstadoCita = new EstadoCita() { IdEstadoCita = 2 };

                cita = objCita.Modificar(cita);

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

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult CancelarCita(int codCitaAdmision)
        {
            try
            {
                BCitaAdmision objCita = new BCitaAdmision();
                CitaAdmision cita = new CitaAdmision();

                cita = objCita.ListarTodo().Where(x => x.IdCitaAdmision == codCitaAdmision).FirstOrDefault();
                cita.EstadoCita = new EstadoCita() { IdEstadoCita = 1 };//pendiente

                cita = objCita.Modificar(cita);

                if (cita.IdCitaAdmision > 0)
                    return Json(new { success = true, responseText = "OK" }, JsonRequestBehavior.AllowGet);
                else
                    return Json(new { success = true, responseText = "Ocurrió un incoveniente con el registro" }, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                return Json(new { success = false, responseText = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult GetHoraCita(string fechaCita)
        {
            BFechaCitaAdmision objFechaCita = new BFechaCitaAdmision();
            try
            {
                List<FechaCitaAdmision> listfecha = new List<FechaCitaAdmision>();

                listfecha = objFechaCita.ListarTodo().Where(x => x.FechaCita.ToString("dd/MM/yyyy") == fechaCita).ToList();
                var lista = (from c in listfecha
                             select new
                             {
                                 id = c.FechaCita.ToString("HH:mm"),
                                 name = c.FechaCita.ToString("HH:mm"),
                             }).ToList();

                return Json(lista, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                return Json(new { success = false, responseText = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

    }
}
