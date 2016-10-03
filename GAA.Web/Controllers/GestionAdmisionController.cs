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
    public class GestionAdmisionController : Controller
    {
        #region Consulta
        public ActionResult Consulta()
        {
            BCitaAdmision objAdmision = new BCitaAdmision();
            List<CitaAdmision> listAdmision = objAdmision.ListarTodo();
            return View(listAdmision);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Eliminar(int codCitaAdmision)
        {
            try
            {
                BCitaAdmision objCita = new BCitaAdmision();
                CitaAdmision citaAmodificar = objCita.ListarTodo().Where(x => x.IdCitaAdmision == codCitaAdmision).FirstOrDefault();
                citaAmodificar.EstadoCita = new EstadoCita() { IdEstadoCita = 4 };//Eliminada
                citaAmodificar = objCita.Modificar(citaAmodificar);

                if (citaAmodificar.IdCitaAdmision > 0)
                    return Json(new { success = true, responseText = "OK" }, JsonRequestBehavior.AllowGet);
                else
                    return Json(new { success = true, responseText = "Ocurrió un incoveniente al eliminar el registro" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, responseText = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }


        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult VerificarPeriodoPostulacion()
        {
            try
            {
                BFechaCitaAdmision objFechaCita = new BFechaCitaAdmision();

                DateTime fechainicio = objFechaCita.ListarTodo().Min(g => g.FechaCita).AddDays(-22).Date;
                DateTime fechafin = objFechaCita.ListarTodo().Max(g => g.FechaCita).AddDays(-22).Date;


                if (fechainicio <= DateTime.Now.Date && fechafin >= DateTime.Now.Date)
                    return Json(new { success = true, responseText = "OK" }, JsonRequestBehavior.AllowGet);
                else
                    return Json(new { success = true, responseText = "No hay periodo de postulación vigente" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, responseText = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }


        #endregion

        #region Crear
        private void PopulateDropDownList(int codDepartamento = 0)
        {
            try
            {
                BTipoDocumento tipoDocumento = new BTipoDocumento();
                BGrado grado = new BGrado();
                BSucursal sucursal = new BSucursal();
                BDepartamento departamento = new BDepartamento();
                BVinculoApoderado vinculo = new BVinculoApoderado();
                BGenero genero = new BGenero();
                BCiudad ciudad = new BCiudad();

                ViewBag.ListaTipoDocumento = new SelectList(tipoDocumento.ListarTodo(), "IdTipoDocumento", "Descripcion", 0);
                ViewBag.ListaGrado = new SelectList(grado.ListarTodo(), "IdGrado", "Descripcion", 0);
                ViewBag.ListaSucursal = new SelectList(sucursal.ListarTodo(), "IdSucursal", "Descripcion", 0);
                ViewBag.ListaDepartamento = new SelectList(departamento.ListarTodo(), "IdDepartamento", "Descripcion", 0);
                ViewBag.ListaApoderadoVinculo = new SelectList(vinculo.ListarTodo(), "idVinculoApoderado", "Descripcion", 0);
                ViewBag.ListaGenero = new SelectList(genero.ListarTodo(), "IdGenero", "Descripcion", 0);
                if (codDepartamento > 0)
                    ViewBag.ListaCiudad = new SelectList(ciudad.ListarTodo().Where(x => x.Departamento.IdDepartamento == codDepartamento).ToList(), "IdCiudad", "Descripcion", 0);
                else
                    ViewBag.ListaCiudad = new SelectList(Enumerable.Empty<SelectListItem>(), "IdCiudad", "Descripcion", 0);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public ActionResult Create()
        {
            PopulateDropDownList();
            GestionAdmisionViewModel viewModel = new GestionAdmisionViewModel();
            viewModel.FechaNacimientoPostulante = DateTime.Now.AddYears(-10).ToString("dd/MM/yyyy");
            return View(viewModel);
        }

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                BSolicitudAdmision objSolicitud = new BSolicitudAdmision();
                BApoderado objApoderado = new BApoderado();
                BPostulante objPostulante = new BPostulante();
                BCitaAdmision objCita = new BCitaAdmision();

                if (objPostulante.ListarTodo().Any(v => v.NumeroDocumento == collection["NumDocumentoPostulante"]))
                {
                    return Json(new { success = true, responseText = "Ya existe un postulante con el mismo N° Documento. No se puede crear la solicitud." }, JsonRequestBehavior.AllowGet);
                }
                else if (objPostulante.ListarTodo().Any(v => v.Nombre == collection["NombresPostulante"] && v.Apellido == collection["ApellidosPostulante"]))
                {
                    return Json(new { success = true, responseText = "Ya existe un postulante con los mismos nombres. No se puede crear la solicitud." }, JsonRequestBehavior.AllowGet);
                }
                else if (DateTime.ParseExact(collection["FechaNacimientoPostulante"], "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture).Date < DateTime.Now.AddYears(-20).Date)
                {
                    return Json(new { success = true, responseText = "Edad del postulante no es admitida." }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    Apoderado apoderado = new Apoderado()
                    {
                        Nombre = collection["NombresApoderado"],
                        Apellido = collection["ApellidosApoderado"],
                        VinculoApoderado = new VinculoApoderado() { IdVinculoApoderado = Convert.ToInt32(collection["CodVinculo"]) },
                        TipoDocumento = new TipoDocumento() { IdTipoDocumento = Convert.ToInt32(collection["CodTipoDocumentoApoderado"]) },
                        NumeroDocumento = collection["NumDocumentoApoderado"],
                        Ocupacion = collection["OcupacionApoderado"],
                        Email = collection["EmailApoderado"],
                        Telefono = collection["TelefonoApoderado"],
                        Direccion = collection["DireccionApoderado"]
                    };

                    Postulante postulante = new Postulante()
                    {
                        Nombre = collection["NombresPostulante"],
                        Apellido = collection["ApellidosPostulante"],
                        Genero = new Genero() { IdGenero = Convert.ToInt32(collection["CodGenero"]) },
                        TipoDocumento = new TipoDocumento() { IdTipoDocumento = Convert.ToInt32(collection["CodTipoDocumentoPostulante"]) },
                        NumeroDocumento = collection["NumDocumentoPostulante"],
                        FechaNacimiento = DateTime.ParseExact(collection["FechaNacimientoPostulante"], "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture),
                        LugarNacimiento = collection["LugarNacimientoPostulante"],
                        Ciudad = new Ciudad() { IdCiudad = Convert.ToInt32(collection["CodCiudad"]) },
                        Apoderado = apoderado
                    };

                    SolicitudAdmision solicitud = new SolicitudAdmision()
                    {
                        Postulante = postulante,
                        Grado = new Grado() { IdGrado = Convert.ToInt32(collection["CodGrado"]) },
                        Sucursal = new Sucursal() { IdSucursal = Convert.ToInt32(collection["CodSucursal"]) },
                        FechaSolicitud = DateTime.Now
                    };

                    CitaAdmision cita = new CitaAdmision()
                    {
                        SolicitudAdmision = solicitud,
                        EstadoCita = new EstadoCita() { IdEstadoCita = 1 },///verificar esto
                        FechaCita = null,
                        NumeroIntento = 0
                    };


                    objApoderado.Crear(apoderado);
                    objPostulante.Crear(postulante);
                    objSolicitud.Crear(solicitud);
                    CitaAdmision citaCreada = objCita.Crear(cita);

                    if (citaCreada.IdCitaAdmision > 0)
                        return Json(new { success = true, responseText = "OK" }, JsonRequestBehavior.AllowGet);
                    else
                        return Json(new { success = true, responseText = "Ocurrió un incoveniente al crear la el registro" }, JsonRequestBehavior.AllowGet);
                }

            }
            catch (Exception ex)
            {
                return Json(new { success = false, responseText = ex.Message }, JsonRequestBehavior.AllowGet);
            }

        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult GetCiudad(int codDepartamento)
        {
            try
            {
                BDepartamento objDeparamento = new BDepartamento();
                var ciudades = objDeparamento.ListarTodo().Where(x => x.IdDepartamento == codDepartamento).FirstOrDefault().Ciudad.ToList();
                var listaCiudad = (from c in ciudades
                                   select new
                                   {
                                       id = c.IdCiudad,
                                       name = c.Descripcion
                                   }).ToList();

                return Json(listaCiudad, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, responseText = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }
        #endregion

        #region Modificar
        public ActionResult Modify(int id)
        {
            try
            {
                BCitaAdmision objCitaAdmision = new BCitaAdmision();
                CitaAdmision cita = new CitaAdmision();
                GestionAdmisionViewModel viewModel = new GestionAdmisionViewModel();
                cita = objCitaAdmision.ListarTodo().Where(x => x.IdCitaAdmision == id).FirstOrDefault();
                viewModel.CodApoderado = cita.SolicitudAdmision.Postulante.Apoderado.IdApoderado;
                viewModel.CodTipoDocumentoApoderado = cita.SolicitudAdmision.Postulante.Apoderado.TipoDocumento.IdTipoDocumento;
                viewModel.CodVinculo = cita.SolicitudAdmision.Postulante.Apoderado.VinculoApoderado.IdVinculoApoderado;
                viewModel.NombresApoderado = cita.SolicitudAdmision.Postulante.Apoderado.Nombre;
                viewModel.ApellidosApoderado = cita.SolicitudAdmision.Postulante.Apoderado.Apellido;
                viewModel.NumDocumentoApoderado = cita.SolicitudAdmision.Postulante.Apoderado.NumeroDocumento;
                viewModel.OcupacionApoderado = cita.SolicitudAdmision.Postulante.Apoderado.Ocupacion;
                viewModel.EmailApoderado = cita.SolicitudAdmision.Postulante.Apoderado.Email;
                viewModel.TelefonoApoderado = cita.SolicitudAdmision.Postulante.Apoderado.Telefono;
                viewModel.DireccionApoderado = cita.SolicitudAdmision.Postulante.Apoderado.Direccion;

                viewModel.CodPostulante = cita.SolicitudAdmision.Postulante.IdPostulante;
                viewModel.CodDepartamento = cita.SolicitudAdmision.Postulante.Ciudad.Departamento.IdDepartamento;
                viewModel.CodCiudad = cita.SolicitudAdmision.Postulante.Ciudad.IdCiudad;
                viewModel.CodGenero = cita.SolicitudAdmision.Postulante.Genero.IdGenero;
                viewModel.CodTipoDocumentoPostulante = cita.SolicitudAdmision.Postulante.TipoDocumento.IdTipoDocumento;
                viewModel.NombresPostulante = cita.SolicitudAdmision.Postulante.Nombre;
                viewModel.ApellidosPostulante = cita.SolicitudAdmision.Postulante.Apellido;
                viewModel.NumDocumentoPostulante = cita.SolicitudAdmision.Postulante.NumeroDocumento;
                viewModel.FechaNacimientoPostulante = cita.SolicitudAdmision.Postulante.FechaNacimiento.ToString("dd/MM/yyyy");
                viewModel.LugarNacimientoPostulante = cita.SolicitudAdmision.Postulante.LugarNacimiento;

                viewModel.CodSolicitudAdmision = cita.SolicitudAdmision.IdSolicitudAdmision;
                viewModel.CodGrado = cita.SolicitudAdmision.Grado.IdGrado;
                viewModel.CodSucursal = cita.SolicitudAdmision.Sucursal.IdSucursal;

                //viewModel.CodCitaAdmision = cita.IdCitaAdmision;
                //viewModel.CodEstadoCita = cita.EstadoCita.IdEstadoCita;
                //viewModel.FechaCitaAdmision = cita.FechaCita;

                PopulateDropDownList(cita.SolicitudAdmision.Postulante.Ciudad.Departamento.IdDepartamento);
                return View(viewModel);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        [HttpPost]
        public ActionResult Modify(FormCollection collection)
        {
            try
            {
                BSolicitudAdmision objSolicitud = new BSolicitudAdmision();
                BApoderado objApoderado = new BApoderado();
                BPostulante objPostulante = new BPostulante();
                BCitaAdmision objCita = new BCitaAdmision();

                if (objPostulante.ListarTodo().Any(v => v.IdPostulante != Convert.ToInt32(collection["CodPostulante"]) && v.NumeroDocumento == collection["NumDocumentoPostulante"]))
                {
                    return Json(new { success = true, responseText = "Ya existe un postulante con el mismo N° Documento. No se puede crear la solicitud." }, JsonRequestBehavior.AllowGet);
                }
                else if (objPostulante.ListarTodo().Any(v => v.IdPostulante != Convert.ToInt32(collection["CodPostulante"]) && v.Nombre == collection["NombresPostulante"] && v.Apellido == collection["ApellidosPostulante"]))
                {
                    return Json(new { success = true, responseText = "Ya existe un postulante con los mismos nombres. No se puede crear la solicitud." }, JsonRequestBehavior.AllowGet);
                }
                else if (DateTime.ParseExact(collection["FechaNacimientoPostulante"], "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture).Date < DateTime.Now.AddYears(-20).Date)
                {
                    return Json(new { success = true, responseText = "Edad del postulante no es admitida." }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    Apoderado apoderado = new Apoderado()
                    {
                        IdApoderado = Convert.ToInt32(collection["CodApoderado"]),
                        Nombre = collection["NombresApoderado"],
                        Apellido = collection["ApellidosApoderado"],
                        VinculoApoderado = new VinculoApoderado() { IdVinculoApoderado = Convert.ToInt32(collection["CodVinculo"]) },
                        TipoDocumento = new TipoDocumento() { IdTipoDocumento = Convert.ToInt32(collection["CodTipoDocumentoApoderado"]) },
                        NumeroDocumento = collection["NumDocumentoApoderado"],
                        Ocupacion = collection["OcupacionApoderado"],
                        Email = collection["EmailApoderado"],
                        Telefono = collection["TelefonoApoderado"],
                        Direccion = collection["DireccionApoderado"]
                    };

                    Postulante postulante = new Postulante()
                    {
                        IdPostulante = Convert.ToInt32(collection["CodPostulante"]),
                        Nombre = collection["NombresPostulante"],
                        Apellido = collection["ApellidosPostulante"],
                        Genero = new Genero() { IdGenero = Convert.ToInt32(collection["CodGenero"]) },
                        TipoDocumento = new TipoDocumento() { IdTipoDocumento = Convert.ToInt32(collection["CodTipoDocumentoPostulante"]) },
                        NumeroDocumento = collection["NumDocumentoPostulante"],
                        FechaNacimiento = DateTime.ParseExact(collection["FechaNacimientoPostulante"], "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture),
                        LugarNacimiento = collection["LugarNacimientoPostulante"],
                        Ciudad = new Ciudad() { IdCiudad = Convert.ToInt32(collection["CodCiudad"]) },
                        Apoderado = apoderado
                    };

                    SolicitudAdmision solicitud = new SolicitudAdmision()
                    {
                        IdSolicitudAdmision = Convert.ToInt32(collection["CodSolicitudAdmision"]),
                        Postulante = postulante,
                        Grado = new Grado() { IdGrado = Convert.ToInt32(collection["CodGrado"]) },
                        Sucursal = new Sucursal() { IdSucursal = Convert.ToInt32(collection["CodSucursal"]) },
                        FechaSolicitud = DateTime.Now
                    };

                    objApoderado.Modificar(apoderado);
                    objPostulante.Modificar(postulante);
                    SolicitudAdmision solicitudCreada = objSolicitud.Modificar(solicitud);

                    if (solicitudCreada.IdSolicitudAdmision > 0)
                        return Json(new { success = true, responseText = "OK" }, JsonRequestBehavior.AllowGet);
                    else
                        return Json(new { success = true, responseText = "Ocurrió un incoveniente al modificar el registro" }, JsonRequestBehavior.AllowGet);
                }

            }
            catch (Exception ex)
            {
                return Json(new { success = false, responseText = ex.Message }, JsonRequestBehavior.AllowGet);
            }

        }
        #endregion
    }
}
