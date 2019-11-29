using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class ClsLogin
    {
        public static int IniciarSesion(string curp, string clave)
        {
            EntidadesDataContext context = new EntidadesDataContext();

            int usuarioId = 0;

            var query = context.Persona.Where(p => p.CURP == curp && p.Clave == clave).Select(p => p);

            var query1 = from p in context.Persona
                         where p.CURP == curp && p.Clave == clave
                         select p;

            if (query.Count() > 0)

                usuarioId = query.First().PersonaId;

                return usuarioId;
        }
    }
}
