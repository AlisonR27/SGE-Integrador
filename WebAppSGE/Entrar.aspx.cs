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
        DAL.DALImage oDALImage = new DAL.DALImage();
        DAL.Alternadores Alt = new DAL.Alternadores();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            List<Usuario> list = new List<Usuario>();
            list = D.LoginSelect(UsuarioTXT.Text.ToString());
            if (list == null)
            {
                SQLErr(UsuarioTXT, "Usuário Inexistente");
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);
            }
            else
            {
                SQLCor(UsuarioTXT, "E-Mail");
                Usuario query = list.First<Usuario>();
                if (query.senha == PassTXT.Text.ToString())
                {                    
                    Session["autenticado"] = true;
                    Session["uemail"] = query.email;
                    Session["unome"] = query.nome;
                    Session["id"] = query.id;
                    Session["utipo"] = query.tipo;
                    List<Modelo.Img> oImg = oDALImage.SelectUnic(query.fotoId.ToString());
                    Session["fotourl"] = oImg.First<Modelo.Img>().imgUrl;
                    Response.Redirect("~//InitialPage.aspx");
                }
                else
                {
                    SQLErr(PassTXT, "Senha incorreta");
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);
                }
            }
        }
        protected void SQLErr(TextBox t, string d)
        {
            t.BorderColor = System.Drawing.Color.Red;
            t.Attributes.Add("placeholder", d);
            t.Text = "";
        }
        protected void SQLCor(TextBox t, string d)
        {
            t.BorderColor = System.Drawing.Color.White;
            t.Attributes.Add("placegolder", d);
        }
    }
}