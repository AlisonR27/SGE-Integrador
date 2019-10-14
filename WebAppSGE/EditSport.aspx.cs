using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebAppSGE.DAL;
using WebAppSGE.Modelo;

namespace WebAppSGE
{
    public partial class EditSport : System.Web.UI.Page
    {
        DALSport oDALSport = new DALSport();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Sports> a = oDALSport.Select(Session["idsport"].ToString());
                TextBoxName.Text = a.First().nome;
                TextBoxDesc.Text = a.First().descricao;
            }
        }

        protected void Unnamed3_Click(object sender, EventArgs e)
        {
            oDALSport.Update(new Sports(Session["idsport"].ToString(), TextBoxName.Text, TextBoxDesc.Text));
            Response.Redirect("~//ListSport.aspx");
        }

        protected void Unnamed4_Click(object sender, EventArgs e)
        {
            oDALSport.Delete(Session["idsport"].ToString());
            Response.Redirect("~//ListSport.aspx");
        }
    }
}