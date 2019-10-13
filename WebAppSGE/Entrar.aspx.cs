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
            list = D.LoginSelect(UsuarioTXT.Text.ToString());
            Usuario query = list.First<Usuario>();
            if (list == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);
            } 
            else
            { 
                if (query.senha == PassTXT.Text.ToString())
                {
                    Session["autenticado"] = true;
                    Session["uemail"] = query.email;
                    Session["unome"] = query.nome;
                    Session["ufotoId"] = query.fotoId;
                    Session["utipo"] = query.tipo;
                    Response.Redirect("~//InitialPage.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true); 
                }
            }
        }
    }
}