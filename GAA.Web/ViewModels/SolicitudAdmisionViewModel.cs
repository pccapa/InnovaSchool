using System;
using System.ComponentModel.DataAnnotations;

namespace GAA.Web.ViewModels
{
    public class SolicitudAdmisionViewModel
    {
        //APODERADO

        [Required(ErrorMessage = "(*) Ingresar Apellidos de Apoderado")]
        [StringLength(100, ErrorMessage = "La longitud máxima es 100")]
        public string ApellidosApoderado { get; set; }

        [Required(ErrorMessage = "(*) Ingresar Nombre de Apoderado")]
        [StringLength(100, ErrorMessage = "La longitud máxima es 100")]
        public string NombresApoderado { get; set; }

        [Required(ErrorMessage = "(*) Ingresar Numero de Documento de Apoderado")]
        [StringLength(15, ErrorMessage = "La longitud máxima es 15")]
        public string NumDocumentoApoderado { get; set; }

        [Required(ErrorMessage = "(*) Seleccione Tipo de Documento de Apoderado")]
        public int CodTipoDocumentoApoderado { get; set; }

        public string NombTipoDocumentoApoderado { get; set; }

        [StringLength(50, ErrorMessage = "(*) La longitud máxima es 50")]
        public string OcupacionApoderado { get; set; }

        [Required(ErrorMessage = "(*) Ingresar Email del Postulante")]
        [StringLength(50, ErrorMessage = "La longitud máxima es 50")]
        //[EmailAddress(ErrorMessage = "Email invalido")]
        [RegularExpression("^[a-zA-Z0-9_\\.-]+@([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$", ErrorMessage = "Email invalido")]
        public string EmailApoderado { get; set; }    

        [Required(ErrorMessage = "(*) Ingresar Telefono del Apoderado")]
        [StringLength(9, ErrorMessage = "La longitud máxima es 9")]
        public string TelefonoApoderado { get; set; }

        [Required(ErrorMessage = "(*) Seleccione Departamento")]
        public int? CodDepartamentoApoderado { get; set; }        

        [Required(ErrorMessage = "(*) Seleccione Ciudad")]
        public int? CodCiudadApoderado { get; set; }

        public string NombreCiudadApoderado { get; set; }

        [Required(ErrorMessage = "(*) Ingresar Direccion del Apoderado")]
        [StringLength(100, ErrorMessage = "La longitud máxima es 100")]
        public string DireccionApoderado { get; set; }


        //VINCULO
        [Required(ErrorMessage = "(*) Seleccione Vinculo con el Postulante")]
        public int? IdVinculoApoderado { get; set; }

        public string NombreApoderadoVinculo { get; set; }

        //POSTULANTE
        [Required(ErrorMessage = "(*) Ingresar Apellidos del Postulante")]
        [StringLength(100, ErrorMessage = "La longitud máxima es 100")]
        public string ApellidoPostulante { get; set; }

        [Required(ErrorMessage = "(*) Ingresar Apellido Paterno del Postulante")]
        [StringLength(50, ErrorMessage = "La longitud máxima es 50")]
        public string ApellidoPaternoPostulante { get; set; }

        [Required(ErrorMessage = "(*) Ingresar Apellido Materno del Postulante")]
        [StringLength(50, ErrorMessage = "La longitud máxima es 50")]
        public string ApellidoMaternoPostulante { get; set; }

        [Required(ErrorMessage = "(*) Ingresar Nombre del Postulante")]
        [StringLength(50, ErrorMessage = "La longitud máxima es 50")]
        public string NombresPostulante { get; set; }

        [Required(ErrorMessage = "(*) Ingresar Numero de Documento de Postulante")]
        [StringLength(15, ErrorMessage = "La longitud máxima es 15")]
        public string NumDocumentoPostulante { get; set; }

        [Required(ErrorMessage = "(*) Seleccione Tipo de Documento Postulante")]
        public int CodTipoDocumentoPostulante { get; set; }

        public string NombreTipoDocumentoPostulante { get; set; }

        [Required(ErrorMessage = "(*) Seleccione Genero")]
        public string CodGenero { get; set; }

        public string NombreGenero { get; set; }

        [Required(ErrorMessage = "(*) Ingresar Fecha de Nacimiento del Postulante")]
        [DataType(DataType.Date)]
        public DateTime? FechaNacimientoPostulante { get; set; }
        
        [StringLength(50, ErrorMessage = "(*) La longitud máxima es 50")]
        public string LugarNacimiento { get; set; }

        [Required(ErrorMessage = "(*) Ingresar Telefono del Postulante")]
        [StringLength(15, ErrorMessage = "La longitud máxima es 15")]
        public string Telefono { get; set; }

        [Required(ErrorMessage = "(*) Ingresar Email del Postulante")]
        [StringLength(50, ErrorMessage = "La longitud máxima es 50")]
        //[EmailAddress(ErrorMessage = "Email invalido")]
        [RegularExpression("^[a-zA-Z0-9_\\.-]+@([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$", ErrorMessage = "Email invalido")]
        public string Email { get; set; }

        [Required(ErrorMessage = "(*) Ingresar Colegio de Procedencia del Postulante")]
        [StringLength(50, ErrorMessage = "La longitud máxima es 50")]
        public string ColegioProcedencia { get; set; }

        //SOLICITUD ADMISION
        [Required(ErrorMessage = "(*) Seleccione Grado")]
        public int CodGrado { get; set; }

        public string NombreGrado { get; set; }

        [Required(ErrorMessage = "(*) Seleccione Sede")]
        public int CodSucursal { get; set; }

        public string NombreSucursal { get; set; }

    }
}