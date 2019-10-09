using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppSGE
{
    public partial class PaginaSearch : System.Web.UI.Page
    {
        DAL.DALArea d = new DAL.DALArea();
        protected void Page_Load(object sender, EventArgs e)
        {
            Repeater1.DataSource = d.SelectAllFields();
            Repeater1.DataBind();
        }

        protected void Pesq_Click(object sender, EventArgs e)
        {
            Repeater1.Controls.Clear();
            if (TextBoxSearch.Text.ToString().Trim() == "")
            {
                Repeater1.DataSource = d.SelectAllFields();
                Repeater1.DataBind();
            }
            else if (TextBoxSearch.Text.ToString().Trim() != "")
            {
                Repeater1.DataSource = d.SelectAllFields(TextBoxSearch.Text.ToString().Trim());
                Repeater1.DataBind();
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
        }

        protected void Unnamed_Command(object sender, CommandEventArgs e)
        {

            Session["AreaID"] = e.CommandArgument;
            Response.Redirect("~\\DetalharArea.aspx");
        }
    }
}