using Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tuto4
{
    public partial class inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Iniciar_Click(object sender, EventArgs e)
        {
            string CURP = txtCURP.Text;
            string clave = txtClave.Text;

            int usuarioId = ClsLogin.IniciarSesion(CURP, clave);

            if(usuarioId == 0)
            {
                Response.Write("<script> alert(" + "'Datos incorrectos'" + ") </script>");
            } else
            {
                Session["usuarioId"] = usuarioId;
                Response.Redirect("~/pages/inicio/sistema.aspx");
            }
        }

        protected void lnkRegistro_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/registro.aspx");
        }


    }
}