using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GAA.Entity;
using GAA.Business;

namespace GAA.Web.Controllers
{
    public class SolicitudAdmisionController : Controller
    {       

        public ActionResult CreateSolicitud()
        {            
            PopulateDropDownList();
            return View();
        }

        [HttpPost]
        public ActionResult CreateSolicitud(FormCollection collection)
        {            
            try
            {
                BSolicitudAdmision objSolicitud = new BSolicitudAdmision();
                BApoderado objApoderado = new BApoderado();
                BPostulante objPostulante = new BPostulante();

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
                    Ciudad = new Ciudad() { IdCiudad = Convert.ToInt32(collection["CodCiudadApoderado"]) },
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
                    Apoderado=apoderado
                };

                SolicitudAdmision solicitud = new SolicitudAdmision()
                {
                    Postulante = postulante,
                    Grado = new Grado() { IdGrado = Convert.ToInt32(collection["CodGrado"]) },
                    Sucursal = new Sucursal() { IdSucursal = Convert.ToInt32(collection["CodSucursal"]) },
                    FechaSolicitud = DateTime.Now,
                    Estado = "Pendiente"
                };

                objApoderado.Crear(apoderado);
                objPostulante.Crear(postulante);
                SolicitudAdmision solicitudCreada = objSolicitud.Crear(solicitud);

                var ruta = Url.Action("DetalleSolicitud", "DetalleSolicitud", new { id = solicitudCreada.IdSolicitudAdmision }, this.Request.Url.Scheme);
                return Json(new { success = true, responseText = "Se generó la Solicitud", url = ruta }, JsonRequestBehavior.AllowGet);                
            }
            catch (Exception ex)
            {
                var ruta = Url.Action("CreateSolicitud", "SolicitudAdmision", new { id = 5 }, this.Request.Url.Scheme);
                return Json(new { success = false, responseText = ex.Message, url = ruta }, JsonRequestBehavior.AllowGet);                
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
        public ActionResult GetSucursal(int codCiudad)
        {
            try
            {
                BCiudad objSucursal = new BCiudad();
                var ciudades = objSucursal.ListarTodo().Where(x => x.IdCiudad == codCiudad).FirstOrDefault().Sucursal.ToList();
                var listaCiudad = (from c in ciudades
                                   select new
                                   {
                                       id = c.IdSucursal,
                                       name = c.Descripcion
                                   }).ToList();

                return Json(listaCiudad, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        private void PopulateDropDownList()
        {
            try
            {                
                BTipoDocumento tipoDocumento = new BTipoDocumento();
                BGrado grado = new BGrado();
                BSucursal sucursal = new BSucursal();
                BDepartamento departamento= new BDepartamento();
                BVinculoApoderado vinculo= new BVinculoApoderado();
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
