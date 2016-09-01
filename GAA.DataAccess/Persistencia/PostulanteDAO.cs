using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GAA.Entity;
using NHibernate;
using NHibernate.Criterion;

namespace GAA.DataAccess.Persistencia
{
    public class PostulanteDAO : BaseDAO<Postulante, int>
    {
        public ICollection<Postulante> ListarTodo()
        {
            using (ISession sesion = NHibernateHelper.ObtenerSesion())
            {
                ICriteria busqueda = sesion.CreateCriteria(typeof(Postulante));
                return busqueda.List<Postulante>();
            }
        }

    }
}
