using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GAA.Entity;
using NHibernate;
using NHibernate.Criterion;

namespace GAA.DataAccess.Persistencia
{
    public class VinculoApoderadoDAO : BaseDAO<VinculoApoderado, int>
    {
        public ICollection<VinculoApoderado> ListarTodo()
        {
            using (ISession sesion = NHibernateHelper.ObtenerSesion())
            {
                ICriteria busqueda = sesion.CreateCriteria(typeof(VinculoApoderado));
                return busqueda.List<VinculoApoderado>();
            }
        }


    }
}
