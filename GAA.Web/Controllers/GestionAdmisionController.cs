using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GAA.Business;
using GAA.Entity;

namespace GAA.Web.Controllers
{
    public class GestionAdmisionController : Controller
    {
        public ActionResult Consulta()
        {
            BCitaAdmision objAdmision = new BCitaAdmision();
            List<CitaAdmision> listAdmision = objAdmision.ListarTodo();
            //ViewBag.ListaAdmision = listAdmision;
            return View(listAdmision);
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

                Apoderado apoderado = new Apoderado()
                {
                    Nombre = collection["NombresApoderado"],
                    Apellido = collection["ApellidosApoderado"],
                    VinculoApoderado = new VinculoApoderado() { IdVinculoApoderado = Convert.ToInt32(collection["IdVinculoApoderado"]) },
                    TipoDocumento = new TipoDocumento() { IdTipoDocumento = Convert.ToInt32(collection["CodTipoDocumentoApoderado"]) },
                    NumeroDocumento = Convert.ToInt32(collection["NumDocumentoApoderado"]),
                    Ocupacion = collection["OcupacionApoderado"],
                    Email = collection["EmailApoderado"],
                    Telefono = collection["TelefonoApoderado"],
                    Direccion = collection["DireccionApoderado"]
                };

                Postulante postulante = new Postulante()
                {
                    Nombre = collection["NombresPostulante"],
                    Apellido = collection["ApellidoPostulante"],
                    Genero = new Genero() { IdGenero = Convert.ToInt32(collection["CodGenero"]) },
                    TipoDocumento = new TipoDocumento() { IdTipoDocumento = Convert.ToInt32(collection["CodTipoDocumentoPostulante"]) },
                    NumeroDocumento = Convert.ToInt32(collection["NumDocumentoPostulante"]),
                    FechaNacimiento = Convert.ToDateTime(collection["FechaNacimientoPostulante"]),
                    LugarNacimiento = collection["LugarNacimiento"],
                    Ciudad = new Ciudad() { IdCiudad = Convert.ToInt32(collection["CodCiudadApoderado"]) },
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
                    return Json(new { success = true, responseText ="OK"}, JsonRequestBehavior.AllowGet);
                else
                    return Json(new { success = true, responseText = "Ocurrió un incoveniente al crear la el registro" }, JsonRequestBehavior.AllowGet);
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
                throw ex;
            }
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Eliminar(int codCitaAdmision) { 
        }

        private void PopulateDropDownList()
        {
            try
            {
                BTipoDocumento tipoDocumento = new BTipoDocumento();
                BGrado grado = new BGrado();
                BSucursal sucursal = new BSucursal();
                BDepartamento departamento = new BDepartamento();
                BVinculoApoderado vinculo = new BVinculoApoderado();
                BGenero genero = new BGenero();

                ViewBag.ListaTipoDocumento = new SelectList(tipoDocumento.ListarTodo(), "IdTipoDocumento", "Descripcion", 0);
                ViewBag.ListaGrado = new SelectList(grado.ListarTodo(), "IdGrado", "Descripcion", 0);
                ViewBag.ListaSucursal = new SelectList(sucursal.ListarTodo(), "IdSucursal", "Descripcion", 0);
                ViewBag.ListaDepartamento = new SelectList(departamento.ListarTodo(), "IdDepartamento", "Descripcion", 0);
                ViewBag.ListaApoderadoVinculo = new SelectList(vinculo.ListarTodo(), "idVinculoApoderado", "Descripcion", 0);
                ViewBag.ListaGenero = new SelectList(genero.ListarTodo(), "IdGenero", "Descripcion", 0);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

    }
}
