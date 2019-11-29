using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

namespace Tuto4
{
    public partial class registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                ListarCiudades();
                ListarColores();
            }
        }

        protected void lnkRegistro_Click(object sender, EventArgs e)
        {
            string CURP = txtCURP.Text;
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string correo = txtCorreo.Text;
            string clave = txtClave.Text;
            int ciudadId = int.Parse(ddlCiudad.SelectedValue);
            List<int> colores = RetornarColores();

            int resultado = ClsUsuario.RegistrarUsuario(CURP, nombre, apellido, correo, clave, ciudadId, colores);
            if (resultado == 1)
                Response.Write("<script> alert(" + "'Ya existe ese usuario, escoge otro'" + ")</script>");
            else if (resultado == 2)
                Response.Write("<script> alert(" + "'Ocurrio un error al realizar el registro'" + ")</script>");
            else if (resultado == 3)
                Response.Write("<script> alert(" + "'Registro exitoso'" + ")</script>");
        }

        private List<int> RetornarColores()
        {
            List<int> itemsSeleccionados = new List<int>();
            foreach (ListItem color in lbxColor.Items)
            {
                if (color.Selected)
                {
                    int valor = int.Parse(color.Value);
                    itemsSeleccionados.Add(valor);
                }
            }

            return itemsSeleccionados;
        }

        protected void lnkInicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/inicio.aspx");
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

    }
}