using Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Tuto4.pages.usuarios
{
    public partial class usuarios : System.Web.UI.Page
    {
        string curp;

        protected void Page_Load(object sender, EventArgs e)
        {
            VerificarSesion();
            if (!Page.IsPostBack)
            {
                Listar();
                OcultarDiv();
                ListarCiudades();
                ListarColores();
            }
        }

        private void OcultarDiv()
        {
            modificar.Visible = false;
        }

        private void VerificarSesion()
        {
            if (Session["usuarioId"] == null)
                Response.Redirect("~/inicio.aspx");
        }

        private void Listar()
        {

            gvUsuarios.DataSource = null;
            gvUsuarios.DataBind();

            int usuarioId = int.Parse(Session["usuarioId"].ToString());

            gvUsuarios.DataSource = ClsUsuario.ListarUsuarios(usuarioId);
            gvUsuarios.DataBind();
        }

        protected void gvUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow fila = gvUsuarios.SelectedRow;
            string curp = fila.Cells[1].Text;
        }

        private void AsignarCampos()
        {
            Persona persona = ClsUsuario.ConsultarPorCURP(curp);
            hfPersonaId.Value = persona.PersonaId.ToString();
            txtCURP.Text = persona.CURP;
            txtNombre.Text = persona.CURP;
            txtApellido.Text = persona.CURP;
            txtCorreo.Text = persona.CURP;
            txtClave.Text = persona.CURP;

            ddlCiudad.ClearSelection();
            ListItem ciudadUsuario = ddlCiudad.Items.FindByValue(persona.CiudadId.ToString());
            if (ciudadUsuario != null)
                ciudadUsuario.Selected = true;
        }

        private void ListarCiudades()
        {
            ddlCiudad.DataSource = null;
            ddlCiudad.DataBind();

            ddlCiudad.DataSource = ClsCiudad.ListarCiudades();
            ddlCiudad.DataTextField = "Nombre";
            ddlCiudad.DataValueField = "CiudadId";
            ddlCiudad.DataBind();
        }

        private void ListarColores()
        {
            lbxColor.DataSource = null;
            lbxColor.DataBind();

            lbxColor.DataSource = ClsColor.ListarColores();
            lbxColor.DataTextField = "Nombre";
            lbxColor.DataValueField = "ColorId";
            lbxColor.DataBind();
        }

        protected void lnkCancelar_Click(object sender, EventArgs e)
        {
            LimpiarTextBox();
        }

        protected void lnkModificar_Click(object sender, EventArgs e)
        {
            int personaId = int.Parse(hfPersonaId.Value)
            string CURP = txtCURP.Text;
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string correo = txtCorreo.Text;
            string clave = txtClave.Text;
            int ciudadId = int.Parse(ddlCiudad.SelectedValue);
        }

        private void LimpiarTextBox()
        {
            txtCURP.Text = String.Empty;
            txtNombre.Text = String.Empty;
            txtApellido.Text = String.Empty;
            txtCorreo.Text = String.Empty;
            txtClave.Text = String.Empty;
            ListarCiudades();
            ListarColores();
            OcultarDiv();
        }

    }   
}