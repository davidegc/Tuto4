using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class ClsUsuario
    {
        public static Persona BuscarPorId(int usuarioId)
        {
            EntidadesDataContext context = new EntidadesDataContext();

            Persona persona = null;

            var query = context.Persona.Where(p => p.PersonaId == usuarioId).Select(p => p);

            if (query.Count() > 0)
                persona = query.First();

            return persona;

        }

        public static object ListarUsuarios(int usuarioId)
        {
            EntidadesDataContext context = new EntidadesDataContext();
            var query = from u in context.Persona
                        join c in context.Ciudad
                        on u.CiudadId equals c.CiudadId
                        where u.PersonaId != usuarioId
                        select new
                        {
                            CURP = u.CURP,
                            Nombre = u.Nombre,
                            Apellido = u.Apellido,
                            Correo = u.Correo,
                            Ciudad = c.Nombre,
                            Colores = RetornarCololesPorPersona(u.PersonaId)
                        };

            return query;
        }

        private static string RetornarCololesPorPersona(int personaId)
        {
            EntidadesDataContext context = new EntidadesDataContext();
            var query = context.PersonaColor.Where(p => p.PersonaId == personaId).Select(p => p);

            string colores = "";

            foreach (var item in query)
            {
                colores += item.Color.Nombre + ", ";
            }

            return colores;
        }

        public static int RegistrarUsuario(string CURP, string nombre, string apellido, string correo, 
                                            string clave, int ciudadId, List<int> colores)
        {
            int resultado = 0;
            EntidadesDataContext entity = new EntidadesDataContext();
            Persona persona = ConsultarPorCURP(CURP);

            if(persona == null)
            {
                persona = new Persona();
                persona.CURP = CURP;
                persona.Nombre = nombre;
                persona.Apellido = apellido;
                persona.Correo = correo;
                persona.Clave = clave;
                persona.CiudadId = ciudadId;
                
                try
                {
                    entity.Persona.InsertOnSubmit(persona);
                    entity.SubmitChanges();
                    int ultimoUsuarioId = ListarUltimoUsuario();
                    if(ultimoUsuarioId != 0)
                    {
                        RegistrarPersonaColor(colores, ultimoUsuarioId);
                    }
                    resultado = 3;
                }
                catch (Exception)
                {
                    resultado = 2;
                }
            } else
            {
                resultado = 1;
            }

            return resultado;
        }

        private static void RegistrarPersonaColor(List<int> colores, int usuarioId)
        {
            EntidadesDataContext entity = new EntidadesDataContext();
            PersonaColor personaColor = new PersonaColor();
            

            try
            {
                foreach(int color in colores)
                {
                    personaColor.ColorId = color;
                    personaColor.PersonaId = usuarioId;
             
                    entity.PersonaColor.InsertOnSubmit(personaColor);
                    entity.SubmitChanges();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public static int ModificarUsuario(int persoanId, string nombre, string apellido, string correo,
                                    string clave, int ciudadId, List<int> colores)
        {
            int resultado = 0;
            EntidadesDataContext entity = new EntidadesDataContext();
            Persona persona = ConsultarPorCURP(CURP);

            if (persona == null)
            {
                persona = new Persona();
                persona.CURP = CURP;
                persona.Nombre = nombre;
                persona.Apellido = apellido;
                persona.Correo = correo;
                persona.Clave = clave;
                persona.CiudadId = ciudadId;

                try
                {
                    entity.Persona.InsertOnSubmit(persona);
                    entity.SubmitChanges();
                }
                catch (Exception)
                {
                    resultado = 2;
                }
            }
            else
            {
                resultado = 1;
            }

            return resultado;
        }

        public static Persona ConsultarPorCURP(string curp)
        {
            EntidadesDataContext context = new EntidadesDataContext();
            Persona persona = null;
            var query = context.Persona.Where(p => p.CURP == curp).Select(p => p);

            if (query.Count() > 0)
                persona = query.First();

            return persona;
        }

        public static int ListarUltimoUsuario()
        {
            EntidadesDataContext context = new EntidadesDataContext();
            int personaId = 0;
            var query = from u in context.Persona
                        orderby u.PersonaId descending
                        select u;
            if (query.Count() > 0)
                personaId = query.First().PersonaId;

            return personaId;
        }

    }
}
