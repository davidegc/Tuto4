using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class ClsColor
    {
        public static object ListarColores()
        {
            EntidadesDataContext context = new EntidadesDataContext();
            var query = context.Color.Select(c => c);
            return query;
        }
    }
}
