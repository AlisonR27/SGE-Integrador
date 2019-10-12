using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebAppSGE.Modelo;

namespace WebAppSGE
{
    public partial class Entrar : System.Web.UI.Page
    {
        DAL.DALUsuario D = new DAL.DALUsuario();
        DAL.Alternadores Alt = new DAL.Alternadores();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {           
            List<Usuario> list = new List<Usuario>();
            list = D.SelectNome(UsuarioTXT.Text.ToString().Trim());
            if (list == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);
            }
            else
            {
                if (list.First<Usuario>().nome == UsuarioTXT.Text.ToString() && list.First<Usuario>().senha == PassTXT.Text.ToString())
                {
                    Response.Redirect("~//MngArea.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true); 
                }
            }
        }
    }
}