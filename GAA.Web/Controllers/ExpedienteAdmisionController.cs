using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GAA.Business;
using GAA.Entity;
using System.Text;
using GAA.Web.ViewModels;
using System.IO;
using GAA.Web.BuilderPattern;

namespace GAA.Web.Controllers
{
    public class ExpedienteAdmisionController : Controller
    {
        #region Consulta Expediente

        public ActionResult Consulta()
        {
            //FichaBuilder builder;
            //ConstructorFicha constructor=new ConstructorFicha();
            //builder = new ExpedienteBuilder();
            //constructor.Constructor(builder);
            //builder.Ficha.Show();
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult GetExpedientes(int numeroDocumento)
        {
            StringBuilder htmlText = new StringBuilder();
            BExpediente objExpediente = new BExpediente();
            BCitaAdmision objcita = new BCitaAdmision();

            try
            {
                List<Expediente> listExpediente = objExpediente.ListarTodo().ToList();
                List<CitaAdmision> listCita = objcita.ListarTodo().Where(x => Convert.ToInt32( x.SolicitudAdmision.Postulante.NumeroDocumento) == numeroDocumento).ToList();

                foreach (CitaAdmision cita in listCita)
                {
                    string strEstado;
                    htmlText.Append("<tr>");


                    if (listExpediente.Any(x => x.CitaAdmision.IdCitaAdmision == cita.IdCitaAdmision))
                    {
                        int idexp = listExpediente.Where(c => c.CitaAdmision.IdCitaAdmision == cita.IdCitaAdmision).FirstOrDefault().IdExpediente;
                        htmlText.Append("<td> <a href='/ExpedienteAdmision/Ficha/" + idexp + "'>" + idexp + "</a> </td>");
                        strEstado = "<td> Pendiente </td>";
                    }
                    else
                    {
                        htmlText.Append("<td> -- </td>");
                        strEstado = "<td> Pendiente </td>";
                    }
                    htmlText.Append("<td> " + cita.SolicitudAdmision.Grado.Descripcion + " </td>");
                    htmlText.Append("<td> " + cita.SolicitudAdmision.Postulante.FullName + " </td>");
                    htmlText.Append("<td> " + cita.SolicitudAdmision.Sucursal.Descripcion + " </td>");
                    htmlText.Append("<td> " + cita.SolicitudAdmision.FechaSolicitud.Year + " </td>");
                    htmlText.Append(strEstado);

                    htmlText.Append("</tr>");
                }

                return Json(new { success = true, responseText = "OK", cadena = htmlText.ToString() }, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                return Json(new { success = false, responseText = ex.Message, cadena = "" }, JsonRequestBehavior.AllowGet);
            }



        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult CrearExpediente(int numeroDocumento)
        {
            BExpediente objExpediente = new BExpediente();
            BCitaAdmision objCita = new BCitaAdmision();

            try
            {
                Expediente expediente = new Expediente()
                {
                    CitaAdmision = objCita.ListarTodo().Where(x => Convert.ToInt32( x.SolicitudAdmision.Postulante.NumeroDocumento) == numeroDocumento).FirstOrDefault()
                };
                expediente = objExpediente.Crear(expediente);

                if (expediente.IdExpediente > 0)
                    return Json(new { success = true, responseText = "OK" }, JsonRequestBehavior.AllowGet);
                else
                    return Json(new { success = true, responseText = "Ocurrió un incoveniente al crear el expediente", }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = true, responseText = ex.Message, }, JsonRequestBehavior.AllowGet);
            }
        }

        #endregion


        public ActionResult Ficha(int id)
        {
            try
            {
                BExpediente objExpediente = new BExpediente();
                Expediente expediente = new Expediente();
                GestionAdmisionViewModel viewmodel = new GestionAdmisionViewModel();

                expediente = objExpediente.ListarTodo().Where(x => x.IdExpediente == id).FirstOrDefault();
                viewmodel.CodExpediente = expediente.IdExpediente;
                viewmodel.NombresApoderado = expediente.CitaAdmision.SolicitudAdmision.Postulante.Apoderado.FullName;
                viewmodel.NombresPostulante = expediente.CitaAdmision.SolicitudAdmision.Postulante.FullName;
                viewmodel.NumDocumentoApoderado = expediente.CitaAdmision.SolicitudAdmision.Postulante.Apoderado.NumeroDocumento;
                viewmodel.NumDocumentoPostulante = expediente.CitaAdmision.SolicitudAdmision.Postulante.NumeroDocumento;
                viewmodel.FechaNacimientoPostulante = expediente.CitaAdmision.SolicitudAdmision.Postulante.FechaNacimiento.ToString("dd/MM/yyyy");
                viewmodel.FechaSolicitudAdmision = expediente.CitaAdmision.SolicitudAdmision.FechaSolicitud;
                viewmodel.GradoDescripcion = expediente.CitaAdmision.SolicitudAdmision.Grado.Descripcion;
                viewmodel.SucursalDescripcion = expediente.CitaAdmision.SolicitudAdmision.Sucursal.Descripcion;
                viewmodel.CodSolicitudAdmision = expediente.CitaAdmision.SolicitudAdmision.IdSolicitudAdmision;
                viewmodel.FechaSolicitudAdmision = expediente.CitaAdmision.SolicitudAdmision.FechaSolicitud;
                return View(viewmodel);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        [HttpPost]
        public ActionResult Ficha(FormCollection collection)
        {
            try
            {
                if (Request != null)
                {
                    HttpPostedFileBase upObservacionActaNacimiento = Request.Files["UpObservacionActaNacimiento"];
                    HttpPostedFileBase upObservacionCertificadoEstudios = Request.Files["UpObservacionCertificadoEstudios"];
                    HttpPostedFileBase upObservacionConstanciaHomologacion = Request.Files["UpObservacionConstanciaHomologacion"];
                    HttpPostedFileBase upObservacionCopiaDocumentacionApoderado = Request.Files["UpObservacionCopiaDocumentacionApoderado"];

                    string uploadDir = "~/Uploads";
                    BDocumentosExpediente objDocumento = new BDocumentosExpediente();

                    ////////////////////////////////////////////////////////////////////
                    if ((upObservacionActaNacimiento != null) &&
                        (upObservacionActaNacimiento.ContentLength > 0)
                        && !string.IsNullOrEmpty(upObservacionActaNacimiento.FileName))
                    {

                        string imagePath = Path.Combine(Server.MapPath(uploadDir), collection["CodExpediente"] + upObservacionActaNacimiento.FileName);
                        upObservacionActaNacimiento.SaveAs(imagePath);

                        DocumentosExpediente documento = new DocumentosExpediente()
                        {
                            Expediente = new Expediente() { IdExpediente = Convert.ToInt32(collection["CodExpediente"]) },
                            FechaDocumento = Convert.ToDateTime(collection["FechaActaNacimiento"]),
                            Observacion = collection["ObservacionActaNacimiento"],
                            Ruta = imagePath
                        };
                        objDocumento.Crear(documento);
                    }


                    ////////////////////////////////////////////////////////////////////
                    if ((upObservacionCertificadoEstudios != null) &&
                        (upObservacionCertificadoEstudios.ContentLength > 0)
                        && !string.IsNullOrEmpty(upObservacionCertificadoEstudios.FileName))
                    {

                        string imagePath = Path.Combine(Server.MapPath(uploadDir), collection["CodExpediente"] + upObservacionCertificadoEstudios.FileName);
                        upObservacionCertificadoEstudios.SaveAs(imagePath);

                        DocumentosExpediente documento = new DocumentosExpediente()
                        {
                            Expediente = new Expediente() { IdExpediente = Convert.ToInt32(collection["CodExpediente"]) },
                            FechaDocumento = Convert.ToDateTime(collection["FechaCertificadoEstudios"]),
                            Observacion = collection["ObservacionCertificadoEstudios"],
                            Ruta = imagePath
                        };
                        objDocumento.Crear(documento);
                    }



                    ////////////////////////////////////////////////////////////////////
                    if ((upObservacionConstanciaHomologacion != null) &&
                        (upObservacionConstanciaHomologacion.ContentLength > 0)
                        && !string.IsNullOrEmpty(upObservacionConstanciaHomologacion.FileName))
                    {

                        string imagePath = Path.Combine(Server.MapPath(uploadDir), collection["CodExpediente"] + upObservacionConstanciaHomologacion.FileName);
                        upObservacionConstanciaHomologacion.SaveAs(imagePath);

                        DocumentosExpediente documento = new DocumentosExpediente()
                        {
                            Expediente = new Expediente() { IdExpediente = Convert.ToInt32(collection["CodExpediente"]) },
                            FechaDocumento = Convert.ToDateTime(collection["FechaConstanciaHomologacion"]),
                            Observacion = collection["ObservacionConstanciaHomologacion"],
                            Ruta = imagePath
                        };
                        objDocumento.Crear(documento);
                    }




                    ////////////////////////////////////////////////////////////////////
                    if ((upObservacionCopiaDocumentacionApoderado != null) &&
                        (upObservacionCopiaDocumentacionApoderado.ContentLength > 0)
                        && !string.IsNullOrEmpty(upObservacionCopiaDocumentacionApoderado.FileName))
                    {

                        string imagePath = Path.Combine(Server.MapPath(uploadDir), collection["CodExpediente"] + upObservacionCopiaDocumentacionApoderado.FileName);
                        upObservacionCopiaDocumentacionApoderado.SaveAs(imagePath);

                        DocumentosExpediente documento = new DocumentosExpediente()
                        {
                            Expediente = new Expediente() { IdExpediente = Convert.ToInt32(collection["CodExpediente"]) },
                            FechaDocumento = Convert.ToDateTime(collection["FechaCopiaDocumentacionApoderado"]),
                            Observacion = collection["ObservacionCopiaDocumentacionApoderado"],
                            Ruta = imagePath
                        };
                        objDocumento.Crear(documento);
                    }                    
                }

                //return Json(new { success = true, responseText = "OK" }, JsonRequestBehavior.AllowGet);

                ////////////////////////////////////////////////////////////////////
                BExpediente objExpediente = new BExpediente();
                Expediente expediente = new Expediente();
                GestionAdmisionViewModel viewmodel = new GestionAdmisionViewModel();

                expediente = objExpediente.ListarTodo().Where(x => x.IdExpediente == Convert.ToInt32(collection["CodExpediente"])).FirstOrDefault();
                viewmodel.CodExpediente = expediente.IdExpediente;
                viewmodel.NombresApoderado = expediente.CitaAdmision.SolicitudAdmision.Postulante.Apoderado.FullName;
                viewmodel.NombresPostulante = expediente.CitaAdmision.SolicitudAdmision.Postulante.FullName;
                viewmodel.NumDocumentoApoderado = expediente.CitaAdmision.SolicitudAdmision.Postulante.Apoderado.NumeroDocumento;
                viewmodel.NumDocumentoPostulante = expediente.CitaAdmision.SolicitudAdmision.Postulante.NumeroDocumento;
                viewmodel.FechaNacimientoPostulante = expediente.CitaAdmision.SolicitudAdmision.Postulante.FechaNacimiento.ToString("dd/MM/yyyy");
                viewmodel.FechaSolicitudAdmision = expediente.CitaAdmision.SolicitudAdmision.FechaSolicitud;
                viewmodel.GradoDescripcion = expediente.CitaAdmision.SolicitudAdmision.Grado.Descripcion;
                viewmodel.SucursalDescripcion = expediente.CitaAdmision.SolicitudAdmision.Sucursal.Descripcion;
                viewmodel.CodSolicitudAdmision = expediente.CitaAdmision.SolicitudAdmision.IdSolicitudAdmision;
                viewmodel.FechaSolicitudAdmision = expediente.CitaAdmision.SolicitudAdmision.FechaSolicitud;
                
                TempData["message"] = "Se guardó satisfactoriamente";
                return View(viewmodel);

            }
            catch (Exception ex)
            {
                throw ex;
                //return Json(new { success = false, responseText = ex.Message }, JsonRequestBehavior.AllowGet);
            }

        }

    }
}
