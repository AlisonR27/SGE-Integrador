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
            if (TextBoxSearch.Text.ToString().Trim() == "")
            {
                DAL.DALArea d = new DAL.DALArea();
                GridView1.DataSource = d.SelectAll();
                GridView1.DataBind();
            }
        }
    }
}