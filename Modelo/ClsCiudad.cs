using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class ClsCiudad
    {
        public static object ListarCiudades()
        {
            EntidadesDataContext context = new EntidadesDataContext();
            var query = context.Ciudad.Select(c => c);
            return query;
        }
    }
}
