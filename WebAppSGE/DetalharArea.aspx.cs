using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppSGE
{
    public partial class DetalharArea : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
                if (Session["Redirected"] != null && (Session["Redirected"].ToString() == "true" || Session["Redirected"].ToString() == "True"))
                {
                        ErrorPanel.Style.Add("display", "none");

                        string x = dv1.Rows[3].Cells[1].Text;
                        AreaImage.ImageUrl = x;
                        dv1.Rows[3].Style.Add("display", "none");
                }
                else
                {
                ErrorPanel.Visible = true;
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.Redirect("~//SlctAgendamento.aspx");
        }
    }
}