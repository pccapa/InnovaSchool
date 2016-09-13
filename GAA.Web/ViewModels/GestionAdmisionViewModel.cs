using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;

namespace GAA.Web.ViewModels
{
    public class GestionAdmisionViewModel
    {
        #region Apoderado
        public int CodApoderado { get; set; }

        [Required(ErrorMessage = "(*) Ingresar Nombre de Apoderado")]
        [StringLength(100, ErrorMessage = "La longitud máxima es 100")]
        public string NombresApoderado { get; set; }

        [Required(ErrorMessage = "(*) Ingresar Apellidos de Apoderado")]
        [StringLength(100, ErrorMessage = "La longitud máxima es 100")]
        public string ApellidosApoderado { get; set; }

        [Required(ErrorMessage = "(*) Ingresar Numero de Documento de Apoderado")]
        [RegularExpression("([0-9][0-9]*)", ErrorMessage = "El numero de documento debe ser numérico")]
        [StringLength(15, ErrorMessage = "La longitud máxima es 15")]
        public string NumDocumentoApoderado { get; set; }

        [Required(ErrorMessage = "(*) Ingresar la ocupación del Apoderado")]
        [StringLength(50, ErrorMessage = "(*) La longitud máxima es 50")]
        public string OcupacionApoderado { get; set; }

        [Required(ErrorMessage = "(*) Ingresar Email del Apoderado")]
        [StringLength(50, ErrorMessage = "La longitud máxima es 50")]
        [RegularExpression("^[a-zA-Z0-9_\\.-]+@([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$", ErrorMessage = "Email invalido")]
        public string EmailApoderado { get; set; }

        [Required(ErrorMessage = "(*) Ingresar Telefono del Apoderado")]
        [StringLength(9, ErrorMessage = "La longitud máxima es 9")]
        public string TelefonoApoderado { get; set; }

        [Required(ErrorMessage = "(*) Ingresar Direccion del Apoderado")]
        [StringLength(100, ErrorMessage = "La longitud máxima es 100")]
        public string DireccionApoderado { get; set; }

        [Required(ErrorMessage = "(*) Seleccione un Tipo Documento")]
        public int CodTipoDocumentoApoderado { get; set; }

        [Required(ErrorMessage = "(*) Seleccione un Vinculo")]
        public int CodVinculo { get; set; }
        #endregion

        #region Postulante
        public int CodPostulante { get; set; }

        [Required(ErrorMessage = "(*) Ingresar Nombre del Postulante")]
        [StringLength(50, ErrorMessage = "La longitud máxima es 50")]
        public string NombresPostulante { get; set; }

        [Required(ErrorMessage = "(*) Ingresar Apellidos del Postulante")]
        [StringLength(100, ErrorMessage = "La longitud máxima es 100")]
        public string ApellidosPostulante { get; set; }

        [Required(ErrorMessage = "(*) Ingresar Numero de Documento de Postulante")]
        [RegularExpression("([0-9][0-9]*)", ErrorMessage = "El numero de documento debe ser numérico")]
        [StringLength(15, ErrorMessage = "La longitud máxima es 15")]
        public string NumDocumentoPostulante { get; set; }

        //[DataType(DataType.Date)]
        //[DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = false )]
        //[Range(typeof(DateTime), "01/01/1960", "12/12/2016", ErrorMessage = "Value for {0} must be between {1} and {2}")]                         
        [Required(ErrorMessage = "(*) Ingresar Fecha de Nacimiento del Postulante")]
        public string FechaNacimientoPostulante { get; set; }

        [Required(ErrorMessage = "(*) Ingresar el lugar de nacimiento del Postulante")]
        [StringLength(100, ErrorMessage = "(*) La longitud máxima es 100")]
        public string LugarNacimientoPostulante { get; set; }

        [Required(ErrorMessage = "(*) Seleccione un Departamento")]
        public int CodDepartamento { get; set; }

        [Required(ErrorMessage = "(*) Seleccione una Ciudad")]
        public int CodCiudad { get; set; }

        [Required(ErrorMessage = "(*) Seleccione un Genero")]
        public int CodGenero { get; set; }

        [Required(ErrorMessage = "(*) Seleccione un Tipo Documento")]
        public int CodTipoDocumentoPostulante { get; set; }

        #endregion

        #region CitaAdmision
        public int CodCitaAdmision { get; set; }

        [Required(ErrorMessage = "(*) Ingrese la fecha")]
        //[DataType(DataType.Date)]
        //[DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public string FechaCitaAdmision { get; set; }

        [Required(ErrorMessage = "(*) Ingrese la hora")]
        public string HoraCitaAdmision { get; set; }
        public int NroIntentosCitaAdmision { get; set; }

        [Required(ErrorMessage = "(*) Seleccione un estado para la Cita")]
        public int CodEstadoCita { get; set; }

        public string GradoDescripcion { get; set; }
        public string SucursalDescripcion { get; set; }
        public string EstadoDescripcion { get; set; }
        #endregion

        #region SolicitudAdmision

        public int CodSolicitudAdmision { get; set; }
        public DateTime FechaSolicitudAdmision { get; set; }

        [Required(ErrorMessage = "(*) Seleccione un Grado")]
        public int CodGrado { get; set; }

        [Required(ErrorMessage = "(*) Seleccione un Sucursal")]
        public int CodSucursal { get; set; }
        #endregion

        #region Expediente
        public int CodExpediente{ get; set; }
        
        public string FechaActaNacimiento { get; set; }
        public string ObservacionActaNacimiento { get; set; }
        public bool TieneActaNacimiento { get; set; }      

        public string FechaCertificadoEstudios { get; set; }
        public string ObservacionCertificadoEstudios { get; set; }
        public bool TieneCertificadoEstudios { get; set; }      

        public string FechaConstanciaHomologacion { get; set; }
        public string ObservacionConstanciaHomologacion { get; set; }
        public bool TieneConstanciaHomologacion { get; set; }      

        public string FechaCopiaDocumentacionApoderado { get; set; }
        public string ObservacionCopiaDocumentacionApoderado { get; set; }
        public bool TieneCopiaDocumentacionApoderado { get; set; }      
        #endregion

    }

}