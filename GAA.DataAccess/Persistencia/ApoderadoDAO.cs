using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GAA.Entity;
using NHibernate;
using NHibernate.Criterion;

namespace GAA.DataAccess.Persistencia
{
    public class ApoderadoDAO: BaseDAO<Apoderado, int>
    {

        public ICollection<Apoderado> ListarTodo()
        {
            using (ISession sesion = NHibernateHelper.ObtenerSesion())
            {
                ICriteria busqueda = sesion.CreateCriteria(typeof(Apoderado));
                return busqueda.List<Apoderado>();
            }
        }


    }
}
