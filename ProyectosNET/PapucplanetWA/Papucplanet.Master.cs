using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class Papucplanet : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Cualquier código de inicialización necesario para la barra
        }

        public void SetTituloPagina(string titulo)
        {
            lblPagina.Text = titulo;
        }
    }
}