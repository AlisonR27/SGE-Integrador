using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppSGE
{
    public partial class SGE : System.Web.UI.MasterPage
    {
        DAL.DALImage oDALImage = new DAL.DALImage();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["autenticado"] != null)
            {
                UserImg.ImageUrl = Session["fotourl"].ToString();
                Image2.ImageUrl = Session["fotourl"].ToString();
                username1.Text = Session["unome"].ToString();
                username2.Text = Session["unome"].ToString();
                //Session["utipo"] = query.tipo;
            }
            else
            {
                exit_Click(null, EventArgs.Empty);
            }
        }

        protected void exit_Click(object sender, EventArgs e)
        {
            //Session.Abandon();
            //Response.Redirect("/Entrar.aspx");
        }
    }
}