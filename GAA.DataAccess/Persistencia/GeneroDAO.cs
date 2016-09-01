using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GAA.Entity;
using NHibernate;
using NHibernate.Criterion;

namespace GAA.DataAccess.Persistencia
{
    public class GeneroDAO : BaseDAO<Genero, int>
    {

        public ICollection<Genero> ListarTodo()
        {
            using (ISession sesion = NHibernateHelper.ObtenerSesion())
            {
                ICriteria busqueda = sesion.CreateCriteria(typeof(Genero));
                return busqueda.List<Genero>();
            }
        }

    }
}
