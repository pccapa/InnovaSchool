using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GAA.Entity;
using NHibernate;
using NHibernate.Criterion;

namespace GAA.DataAccess.Persistencia
{
    public class GradoDAO : BaseDAO<Grado, int>
    {

        public ICollection<Grado> ListarTodo()
        {
            using (ISession sesion = NHibernateHelper.ObtenerSesion())
            {
                ICriteria busqueda = sesion.CreateCriteria(typeof(Grado));
                return busqueda.List<Grado>();
            }
        }

    }
}
