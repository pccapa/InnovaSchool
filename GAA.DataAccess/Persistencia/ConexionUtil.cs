using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GAA.DataAccess.Persistencia
{
    public class ConexionUtil
    {
        public static string ObtenerCadena()
        {
            return @"Data Source=Pablo-laptop-PC\SQLEXPRESS_R2;Initial Catalog=InnovaSchool;Integrated Security=SSPI;";
        }
    }
}
