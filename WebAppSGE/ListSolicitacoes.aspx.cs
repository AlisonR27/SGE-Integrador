using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppSGE
{
    public partial class ListSolicitacoes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           if(Session["uid"] == null){
                Session["uid"] = 12;
            }
        }

    }
}