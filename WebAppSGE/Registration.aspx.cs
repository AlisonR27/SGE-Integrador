using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using WebAppSGE.DAL;
using WebAppSGE.Modelo;


namespace WebAppSGE
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TXTId.Text = DALUsuario.Identity().ToString();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DALUsuario oDALUsuario = new DALUsuario();
            string phones = "";
           /* foreach (ListItem li in selectedPhones.Items) {
                phones += li.Text+";";
            }*/
            if (oDALUsuario.Insert(new Usuario(Pass.Text, 2, TextBox1.Text,"aaa",TextBox2.Text,phones))) ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertSuccessful()", true);
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);
        
        }
    }
    }
}