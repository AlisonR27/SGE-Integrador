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
            if(oDALSport.Update(new Sports(Session["idsport"].ToString(), TextBoxName.Text, TextBoxDesc.Text)))
            {                
                Response.Redirect("~//ListSport.aspx");
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertSuccessful()", true);
            }
            else
            {                
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);
            }
        }

        protected void Unnamed4_Click(object sender, EventArgs e)
        {
            try
            {
                oDALSport.Delete(Session["idsport"].ToString());
                Response.Redirect("~//ListSport.aspx");
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);
            }
        }
        /*protected void SQLErr(TextBox t, string d, Label a)
        {
            t.BorderColor = System.Drawing.Color.Red;
            a.Text = d;
        }
        protected void SQLCor(TextBox t, Label a)
        {
            t.BorderColor = System.Drawing.Color.White;
            a.Text = "";
        }*/
    }
}