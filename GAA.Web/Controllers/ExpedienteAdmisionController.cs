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
                List<CitaAdmision> listCita = objcita.ListarTodo().Where(x => Convert.ToInt32(x.SolicitudAdmision.Postulante.NumeroDocumento) == numeroDocumento).ToList();

                foreach (CitaAdmision cita in listCita)
                {
                    string strEstado;
                    htmlText.Append("<tr>");


                    if (listExpediente.Any(x => x.CitaAdmision.IdCitaAdmision == cita.IdCitaAdmision && x.EstadoExpediente !=null  ))
                    {
                        int idexp = listExpediente.Where(c => c.CitaAdmision.IdCitaAdmision == cita.IdCitaAdmision).FirstOrDefault().IdExpediente;
                        htmlText.Append("<td> <a href='/ExpedienteAdmision/Ficha/" + idexp + "'>" + idexp + "</a> </td>");                        
                        strEstado = "<td> " + listExpediente.Where(x => x.CitaAdmision.IdCitaAdmision == cita.IdCitaAdmision).FirstOrDefault().EstadoExpediente.Descripcion + " </td>";
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
                if (!objCita.ListarTodo().Any(d => d.SolicitudAdmision.Postulante.NumeroDocumento == numeroDocumento.ToString()))
                {
                    return Json(new { success = true, responseText = "No existe el número de documento para crear el expediente.", }, JsonRequestBehavior.AllowGet);
                }               
                else if (objCita.ListarTodo().Any(x => x.FechaCita == null && Convert.ToInt32(x.SolicitudAdmision.Postulante.NumeroDocumento) == numeroDocumento))
                {
                    return Json(new { success = true, responseText = "No se puede crear el expediente, porque no tiene una cita registrada.", }, JsonRequestBehavior.AllowGet);
                }
                else if (objExpediente.ListarTodo().Any(d => d.CitaAdmision.SolicitudAdmision.Postulante.NumeroDocumento == numeroDocumento.ToString()))
                {
                    return Json(new { success = true, responseText = "No se puede crear el expediente porque ya existe uno activo.", }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    Expediente expediente = new Expediente()
                    {
                        CitaAdmision = objCita.ListarTodo().Where(x => Convert.ToInt32(x.SolicitudAdmision.Postulante.NumeroDocumento) == numeroDocumento).FirstOrDefault(),
                        EstadoExpediente = new EstadoExpediente() { IdEstadoExpediente = 1 }// Estado Pendiente
                    };
                    expediente = objExpediente.Crear(expediente);


                    ///////////////////////////////////////////////////////////////////////////////
                    BResultadoEvaluacion objResultadoEvaluacion = new BResultadoEvaluacion();
                    ResultadoEvaluacion resultadoevaluacion = new ResultadoEvaluacion()
                    {
                        Expediente = expediente,
                        ResultadoPrueba = "Pendiente",
                        TipoEvaluacion = "Pendiente",
                        Evaluador = "Pendiente",
                        CargoEvaluador = "Pendiente",
                        FechaEvaluacion = "Pendiente"
                    };
                    objResultadoEvaluacion.Crear(resultadoevaluacion);

                    BResultadoProceso objResultadoProceso = new BResultadoProceso();
                    ResultadoProceso resultadoproceso = new ResultadoProceso()
                    {
                        Expediente = expediente,
                        Resultado = "Pendiente",
                        FechaResultado = "Pendiente"
                    };
                    objResultadoProceso.Crear(resultadoproceso);

                    if (expediente.IdExpediente > 0)
                        return Json(new { success = true, responseText = "OK" }, JsonRequestBehavior.AllowGet);
                    else
                        return Json(new { success = true, responseText = "Ocurrió un incoveniente al crear el expediente.", }, JsonRequestBehavior.AllowGet);
                }


            }
            catch (Exception ex)
            {
                return Json(new { success = true, responseText = ex.Message, }, JsonRequestBehavior.AllowGet);
            }
        }

        #endregion

        #region Ficha Expediente
        public ActionResult Ficha(int id)
        {
            try
            {
                string uploadDir = "/Uploads";
                BExpediente objExpediente = new BExpediente();
                Expediente expediente = new Expediente();
                BDocumentosExpediente objDocumentoExpediente = new BDocumentosExpediente();
                List<DocumentosExpediente> documentosExpediente = new List<DocumentosExpediente>();
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


                documentosExpediente = objDocumentoExpediente.ListarTodo().Where(d => d.Expediente.IdExpediente == expediente.IdExpediente).ToList();

                if (documentosExpediente.Any(d => d.Tipo == 1))
                {
                    viewmodel.FechaActaNacimiento = documentosExpediente.Where(v => v.Tipo == 1).FirstOrDefault().FechaDocumento.ToString("dd/MM/yyyy");
                    viewmodel.ObservacionActaNacimiento = documentosExpediente.Where(v => v.Tipo == 1).FirstOrDefault().Observacion;
                    //viewmodel.TieneActaNacimiento = (documentosExpediente.Where(v => v.Tipo == 1).FirstOrDefault().Ruta != string.Empty ? true : false);
                    viewmodel.PathActaNacimiento = string.Format("{0}://{1}{2}", Request.Url.Scheme, Request.Url.Authority, Url.Content("~")) + uploadDir + "/" + documentosExpediente.Where(v => v.Tipo == 1).FirstOrDefault().Ruta;
                }

                if (documentosExpediente.Any(d => d.Tipo == 2))
                {
                    viewmodel.FechaCertificadoEstudios = documentosExpediente.Where(v => v.Tipo == 2).FirstOrDefault().FechaDocumento.ToString("dd/MM/yyyy");
                    viewmodel.ObservacionCertificadoEstudios = documentosExpediente.Where(v => v.Tipo == 2).FirstOrDefault().Observacion;
                    //viewmodel.TieneCertificadoEstudios = (documentosExpediente.Where(v => v.Tipo == 2).FirstOrDefault().Ruta != string.Empty ? true : false);
                    viewmodel.PathCertificadoEstudios = string.Format("{0}://{1}{2}", Request.Url.Scheme, Request.Url.Authority, Url.Content("~")) + uploadDir + "/" + documentosExpediente.Where(v => v.Tipo == 2).FirstOrDefault().Ruta;
                }

                if (documentosExpediente.Any(d => d.Tipo == 3))
                {
                    viewmodel.FechaConstanciaHomologacion = documentosExpediente.Where(v => v.Tipo == 3).FirstOrDefault().FechaDocumento.ToString("dd/MM/yyyy");
                    viewmodel.ObservacionConstanciaHomologacion = documentosExpediente.Where(v => v.Tipo == 3).FirstOrDefault().Observacion;
                    //viewmodel.TieneConstanciaHomologacion = (documentosExpediente.Where(v => v.Tipo == 3).FirstOrDefault().Ruta != string.Empty ? true : false);
                    viewmodel.PathConstanciaHomologacion = string.Format("{0}://{1}{2}", Request.Url.Scheme, Request.Url.Authority, Url.Content("~")) + uploadDir + "/" + documentosExpediente.Where(v => v.Tipo == 3).FirstOrDefault().Ruta;
                }

                if (documentosExpediente.Any(d => d.Tipo == 4))
                {
                    viewmodel.FechaCopiaDocumentacionApoderado = documentosExpediente.Where(v => v.Tipo == 4).FirstOrDefault().FechaDocumento.ToString("dd/MM/yyyy");
                    viewmodel.ObservacionCopiaDocumentacionApoderado = documentosExpediente.Where(v => v.Tipo == 4).FirstOrDefault().Observacion;
                    //viewmodel.TieneCopiaDocumentacionApoderado = (documentosExpediente.Where(v => v.Tipo == 4).FirstOrDefault().Ruta != string.Empty ? true : false);
                    viewmodel.PathCopiaDocumentacionApoderado = string.Format("{0}://{1}{2}", Request.Url.Scheme, Request.Url.Authority, Url.Content("~")) + uploadDir + "/" + documentosExpediente.Where(v => v.Tipo == 4).FirstOrDefault().Ruta;
                }


                ///////////////////////////////////////////////////////////////////////////////////////////////////////////
                BResultadoEvaluacion objResultadoEvaluacion = new BResultadoEvaluacion();
                ResultadoEvaluacion resultadoevaluacion = objResultadoEvaluacion.ListarTodo().Where(d => d.Expediente.IdExpediente == id).FirstOrDefault();
                viewmodel.ResultadoPrueba = resultadoevaluacion.ResultadoPrueba;
                viewmodel.TipoEvaluacion = resultadoevaluacion.TipoEvaluacion;
                viewmodel.Evaluador = resultadoevaluacion.Evaluador;
                viewmodel.CargoEvaluador = resultadoevaluacion.CargoEvaluador;
                viewmodel.FechaEvaluacion = resultadoevaluacion.FechaEvaluacion;

                BResultadoProceso objResultadoProceso = new BResultadoProceso();
                ResultadoProceso resultadoproceso = objResultadoProceso.ListarTodo().Where(h => h.Expediente.IdExpediente == id).FirstOrDefault();
                viewmodel.ResultadoProceso = resultadoproceso.Resultado;
                viewmodel.FechaProceso = resultadoproceso.FechaResultado;
                viewmodel.ObservacionesProceso = resultadoproceso.ObservacionResultado;


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
                BDocumentosExpediente objDocumentoExpediente = new BDocumentosExpediente();
                string uploadDir = "/Uploads";
                if (Request != null)
                {

                    HttpPostedFileBase upObservacionActaNacimiento = Request.Files["UpObservacionActaNacimiento"];
                    HttpPostedFileBase upObservacionCertificadoEstudios = Request.Files["UpObservacionCertificadoEstudios"];
                    HttpPostedFileBase upObservacionConstanciaHomologacion = Request.Files["UpObservacionConstanciaHomologacion"];
                    HttpPostedFileBase upObservacionCopiaDocumentacionApoderado = Request.Files["UpObservacionCopiaDocumentacionApoderado"];

                    string path = string.Empty;

                    ////////////////////////////////////////////////////////////////////
                    if ((upObservacionActaNacimiento != null) &&
                        (upObservacionActaNacimiento.ContentLength > 0)
                        && !string.IsNullOrEmpty(upObservacionActaNacimiento.FileName))
                    {
                        path = new Random().Next(1, 100).ToString() + upObservacionActaNacimiento.FileName;
                        string imagePath = Path.Combine(Server.MapPath(uploadDir), path);
                        upObservacionActaNacimiento.SaveAs(imagePath);

                        DocumentosExpediente documentoCrear = new DocumentosExpediente()
                        {
                            Expediente = new Expediente() { IdExpediente = Convert.ToInt32(collection["CodExpediente"]) },
                            FechaDocumento = DateTime.Now,
                            Observacion = collection["ObservacionActaNacimiento"],
                            Ruta = path,
                            Tipo = 1
                        };

                        if (objDocumentoExpediente.ListarTodo().Any(s => s.Expediente.IdExpediente == Convert.ToInt32(collection["CodExpediente"]) && s.Tipo == 1))
                        {
                            DocumentosExpediente documentoModificar = objDocumentoExpediente.ListarTodo().Where(s => s.Expediente.IdExpediente == Convert.ToInt32(collection["CodExpediente"]) && s.Tipo == 1).FirstOrDefault();
                            documentoModificar.FechaDocumento = DateTime.Now;
                            documentoModificar.Observacion = collection["ObservacionActaNacimiento"];
                            documentoModificar.Ruta = path;
                            objDocumentoExpediente.Modificar(documentoModificar);
                        }
                        else
                        {
                            objDocumentoExpediente.Crear(documentoCrear);
                        }

                        path = string.Empty;
                    }


                    ////////////////////////////////////////////////////////////////////
                    if ((upObservacionCertificadoEstudios != null) &&
                        (upObservacionCertificadoEstudios.ContentLength > 0)
                        && !string.IsNullOrEmpty(upObservacionCertificadoEstudios.FileName))
                    {
                        path = new Random().Next(1, 100).ToString() + upObservacionCertificadoEstudios.FileName;
                        string imagePath = Path.Combine(Server.MapPath(uploadDir), path);
                        upObservacionCertificadoEstudios.SaveAs(imagePath);

                        DocumentosExpediente documentoCrear = new DocumentosExpediente()
                        {
                            Expediente = new Expediente() { IdExpediente = Convert.ToInt32(collection["CodExpediente"]) },
                            FechaDocumento = DateTime.Now,
                            Observacion = collection["ObservacionCertificadoEstudios"],
                            Ruta = path,
                            Tipo = 2
                        };

                        if (objDocumentoExpediente.ListarTodo().Any(s => s.Expediente.IdExpediente == Convert.ToInt32(collection["CodExpediente"]) && s.Tipo == 2))
                        {
                            DocumentosExpediente documentoModificar = objDocumentoExpediente.ListarTodo().Where(s => s.Expediente.IdExpediente == Convert.ToInt32(collection["CodExpediente"]) && s.Tipo == 2).FirstOrDefault();
                            documentoModificar.FechaDocumento = DateTime.Now;
                            documentoModificar.Observacion = collection["ObservacionCertificadoEstudios"];
                            documentoModificar.Ruta = path;
                            objDocumentoExpediente.Modificar(documentoModificar);
                        }
                        else
                        {
                            objDocumentoExpediente.Crear(documentoCrear);
                        }

                        path = string.Empty;
                    }



                    ////////////////////////////////////////////////////////////////////
                    if ((upObservacionConstanciaHomologacion != null) &&
                        (upObservacionConstanciaHomologacion.ContentLength > 0)
                        && !string.IsNullOrEmpty(upObservacionConstanciaHomologacion.FileName))
                    {
                        path = new Random().Next(1, 100).ToString() + upObservacionConstanciaHomologacion.FileName;
                        string imagePath = Path.Combine(Server.MapPath(uploadDir), path);
                        upObservacionConstanciaHomologacion.SaveAs(imagePath);

                        DocumentosExpediente documentoCrear = new DocumentosExpediente()
                        {
                            Expediente = new Expediente() { IdExpediente = Convert.ToInt32(collection["CodExpediente"]) },
                            FechaDocumento = DateTime.Now,
                            Observacion = collection["ObservacionConstanciaHomologacion"],
                            Ruta = path,
                            Tipo = 3
                        };

                        if (objDocumentoExpediente.ListarTodo().Any(s => s.Expediente.IdExpediente == Convert.ToInt32(collection["CodExpediente"]) && s.Tipo == 3))
                        {
                            DocumentosExpediente documentoModificar = objDocumentoExpediente.ListarTodo().Where(s => s.Expediente.IdExpediente == Convert.ToInt32(collection["CodExpediente"]) && s.Tipo == 3).FirstOrDefault();
                            documentoModificar.FechaDocumento = DateTime.Now;
                            documentoModificar.Observacion = collection["ObservacionConstanciaHomologacion"];
                            documentoModificar.Ruta = path;
                            objDocumentoExpediente.Modificar(documentoModificar);
                        }
                        else
                        {
                            objDocumentoExpediente.Crear(documentoCrear);
                        }

                        path = string.Empty;
                    }




                    ////////////////////////////////////////////////////////////////////
                    if ((upObservacionCopiaDocumentacionApoderado != null) &&
                        (upObservacionCopiaDocumentacionApoderado.ContentLength > 0)
                        && !string.IsNullOrEmpty(upObservacionCopiaDocumentacionApoderado.FileName))
                    {
                        path = new Random().Next(1, 100).ToString() + upObservacionCopiaDocumentacionApoderado.FileName;
                        string imagePath = Path.Combine(Server.MapPath(uploadDir), path);
                        upObservacionCopiaDocumentacionApoderado.SaveAs(imagePath);

                        DocumentosExpediente documentoCrear = new DocumentosExpediente()
                        {
                            Expediente = new Expediente() { IdExpediente = Convert.ToInt32(collection["CodExpediente"]) },
                            FechaDocumento = DateTime.Now,
                            Observacion = collection["ObservacionCopiaDocumentacionApoderado"],
                            Ruta = path,
                            Tipo = 4
                        };

                        if (objDocumentoExpediente.ListarTodo().Any(s => s.Expediente.IdExpediente == Convert.ToInt32(collection["CodExpediente"]) && s.Tipo == 4))
                        {
                            DocumentosExpediente documentoModificar = objDocumentoExpediente.ListarTodo().Where(s => s.Expediente.IdExpediente == Convert.ToInt32(collection["CodExpediente"]) && s.Tipo == 4).FirstOrDefault();
                            documentoModificar.FechaDocumento = DateTime.Now;
                            documentoModificar.Observacion = collection["ObservacionCopiaDocumentacionApoderado"];
                            documentoModificar.Ruta = path;
                            objDocumentoExpediente.Modificar(documentoModificar);
                        }
                        else
                        {
                            objDocumentoExpediente.Crear(documentoCrear);
                        }

                        path = string.Empty;
                    }
                }

                //return Json(new { success = true, responseText = "OK" }, JsonRequestBehavior.AllowGet);

                ////////////////////////////////////////////////////////////////////
                BExpediente objExpediente = new BExpediente();
                Expediente expediente = new Expediente();
                List<DocumentosExpediente> documentosExpediente = new List<DocumentosExpediente>();
                GestionAdmisionViewModel viewmodel = new GestionAdmisionViewModel();

                expediente = objExpediente.ListarTodo().Where(x => x.IdExpediente == Convert.ToInt32(collection["CodExpediente"])).FirstOrDefault();
                documentosExpediente = objDocumentoExpediente.ListarTodo().Where(d => d.Expediente.IdExpediente == Convert.ToInt32(collection["CodExpediente"])).ToList();

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

                if (documentosExpediente.Any(d => d.Tipo == 1))
                {
                    viewmodel.FechaActaNacimiento = documentosExpediente.Where(v => v.Tipo == 1).FirstOrDefault().FechaDocumento.ToString("dd/MM/yyyy");
                    viewmodel.ObservacionActaNacimiento = documentosExpediente.Where(v => v.Tipo == 1).FirstOrDefault().Observacion;
                    //viewmodel.TieneActaNacimiento = (documentosExpediente.Where(v => v.Tipo == 1).FirstOrDefault().Ruta != string.Empty ? true : false);
                    viewmodel.PathActaNacimiento = string.Format("{0}://{1}{2}", Request.Url.Scheme, Request.Url.Authority, Url.Content("~")) + uploadDir + "/" + documentosExpediente.Where(v => v.Tipo == 1).FirstOrDefault().Ruta;
                }

                if (documentosExpediente.Any(d => d.Tipo == 2))
                {
                    viewmodel.FechaCertificadoEstudios = documentosExpediente.Where(v => v.Tipo == 2).FirstOrDefault().FechaDocumento.ToString("dd/MM/yyyy");
                    viewmodel.ObservacionCertificadoEstudios = documentosExpediente.Where(v => v.Tipo == 2).FirstOrDefault().Observacion;
                    //viewmodel.TieneCertificadoEstudios = (documentosExpediente.Where(v => v.Tipo == 2).FirstOrDefault().Ruta != string.Empty ? true : false);
                    viewmodel.PathCertificadoEstudios = string.Format("{0}://{1}{2}", Request.Url.Scheme, Request.Url.Authority, Url.Content("~")) + uploadDir + "/" + documentosExpediente.Where(v => v.Tipo == 2).FirstOrDefault().Ruta;
                }

                if (documentosExpediente.Any(d => d.Tipo == 3))
                {
                    viewmodel.FechaConstanciaHomologacion = documentosExpediente.Where(v => v.Tipo == 3).FirstOrDefault().FechaDocumento.ToString("dd/MM/yyyy");
                    viewmodel.ObservacionConstanciaHomologacion = documentosExpediente.Where(v => v.Tipo == 3).FirstOrDefault().Observacion;
                    //viewmodel.TieneConstanciaHomologacion = (documentosExpediente.Where(v => v.Tipo == 3).FirstOrDefault().Ruta != string.Empty ? true : false);
                    viewmodel.PathConstanciaHomologacion = string.Format("{0}://{1}{2}", Request.Url.Scheme, Request.Url.Authority, Url.Content("~")) + uploadDir + "/" + documentosExpediente.Where(v => v.Tipo == 3).FirstOrDefault().Ruta;
                }

                if (documentosExpediente.Any(d => d.Tipo == 4))
                {
                    viewmodel.FechaCopiaDocumentacionApoderado = documentosExpediente.Where(v => v.Tipo == 4).FirstOrDefault().FechaDocumento.ToString("dd/MM/yyyy");
                    viewmodel.ObservacionCopiaDocumentacionApoderado = documentosExpediente.Where(v => v.Tipo == 4).FirstOrDefault().Observacion;
                    //viewmodel.TieneCopiaDocumentacionApoderado = (documentosExpediente.Where(v => v.Tipo == 4).FirstOrDefault().Ruta != string.Empty ? true : false);
                    viewmodel.PathCopiaDocumentacionApoderado = string.Format("{0}://{1}{2}", Request.Url.Scheme, Request.Url.Authority, Url.Content("~")) + uploadDir + "/" + documentosExpediente.Where(v => v.Tipo == 4).FirstOrDefault().Ruta;
                }




                ///////////////////////////////////////////////////////////////////////////////////////////////////////////
                BResultadoEvaluacion objResultadoEvaluacion = new BResultadoEvaluacion();
                ResultadoEvaluacion resultadoevaluacion = objResultadoEvaluacion.ListarTodo().Where(d => d.Expediente.IdExpediente == Convert.ToInt32(collection["CodExpediente"])).FirstOrDefault();
                viewmodel.ResultadoPrueba = resultadoevaluacion.ResultadoPrueba;
                viewmodel.TipoEvaluacion = resultadoevaluacion.TipoEvaluacion;
                viewmodel.Evaluador = resultadoevaluacion.Evaluador;
                viewmodel.CargoEvaluador = resultadoevaluacion.CargoEvaluador;
                viewmodel.FechaEvaluacion = resultadoevaluacion.FechaEvaluacion;

                BResultadoProceso objResultadoProceso = new BResultadoProceso();
                ResultadoProceso resultadoproceso = objResultadoProceso.ListarTodo().Where(h => h.Expediente.IdExpediente == Convert.ToInt32(collection["CodExpediente"])).FirstOrDefault();
                viewmodel.ResultadoProceso = resultadoproceso.Resultado;
                viewmodel.FechaProceso = resultadoproceso.FechaResultado;
                viewmodel.ObservacionesProceso = resultadoproceso.ObservacionResultado;


                TempData["message"] = "Se guardó satisfactoriamente";
                return View(viewmodel);

            }
            catch (Exception ex)
            {
                throw ex;
                //return Json(new { success = false, responseText = ex.Message }, JsonRequestBehavior.AllowGet);
            }

        }
        #endregion
    }
}
