using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GAA.Entity;
using NHibernate;
using NHibernate.Criterion;

namespace GAA.DataAccess.Persistencia
{
    public class SucursalDAO : BaseDAO<Sucursal, int>
    {
        public ICollection<Sucursal> ListarTodo()
        {
            using (ISession sesion = NHibernateHelper.ObtenerSesion())
            {
                ICriteria busqueda = sesion.CreateCriteria(typeof(Sucursal));
                return busqueda.List<Sucursal>();
            }
        }


    }
}
