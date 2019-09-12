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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Pesq_Click(object sender, EventArgs e)
        {
            GridView1.Controls.Clear();
            DAL.DALArea d = new DAL.DALArea();
            if (TextBoxSearch.Text.ToString().Trim() == "")
            {
                GridView1.DataSource = d.SelectAll();
                GridView1.DataBind();
            }else if (TextBoxSearch.Text.ToString().Trim() != "")
            {
                GridView1.DataSource = d.SelectAll(TextBoxSearch.Text.ToString().Trim());
                GridView1.DataBind();
            }
        }
    }
}