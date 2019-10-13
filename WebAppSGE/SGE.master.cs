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
                if (oDALImage.SelectUnic(Session["ufotoId"].ToString()) != null)
                {
                    List<Modelo.Img> oImg = oDALImage.SelectUnic(Session["ufotoId"].ToString());
                    UserImg.ImageUrl = oImg.First<Modelo.Img>().imgUrl;

                }
                else
                {
                    throw new BadImageFormatException();
                }
            }
        }

        protected void exit_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~//Entrar.aspx");
        }
    }
}