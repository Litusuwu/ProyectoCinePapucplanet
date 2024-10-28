using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class Sedes : System.Web.UI.Page
    {
        private string a;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarSedes();
            }
        }

        private void CargarSedes()
        {
            
        }
    }
}