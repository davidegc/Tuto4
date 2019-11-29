using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

namespace Tuto4.resources.master
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuarioId"] != null)
            {
                int usuarioId = int.Parse(Session["usuarioId"].ToString());
                Persona persona = ClsUsuario.BuscarPorId(usuarioId);
                lblNombre.Text = persona.Nombre;
            }
            else
            {
                Response.Redirect("~/inicio.aspx");
            }
                
        }

        protected void lnkCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/inicio.aspx");
        }
    }
}