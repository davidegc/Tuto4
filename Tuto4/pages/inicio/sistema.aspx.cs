using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

namespace Tuto4.pages.inicio
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                VerificarSesion();

                int usuarioId = int.Parse(Session["usuarioId"].ToString());
                Persona persona = ClsUsuario.BuscarPorId(usuarioId);

                lblNombre.Text = "Bienvenido al sistema " + persona.Nombre;
            }
        }

        private void VerificarSesion()
        {
            if (Session["usuarioId"] == null)
                Response.Redirect("~/inicio.aspx");
        }
    }
}