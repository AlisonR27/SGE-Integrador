using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using WebAppSGE.Modelo;
using WebAppSGE.DAL;
using System.Web.UI.WebControls;

namespace WebAppSGE
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_LoggingIn(object sender, LoginCancelEventArgs e)
        {
            DAL.DALUsuario D = new DAL.DALUsuario();
            Usuario o = new Usuario();
            Usuario s = new Usuario();
            o.id = Alternadores.AlternadorI(UserName.Text.ToString());
            o.senha = Password.Text.ToString();
            List<Usuario> list = new List<Usuario>();
            list = D.Select(o.id.ToString());
            if (list == null)
            {
                Response.Write("Não existe usuario ou senha");
            }
            else
            {
                if (list.First<Usuario>().id != o.id && list.First<Usuario>().senha == o.senha)
                {
                    s = list.First<Usuario>();
                    Response.Redirect("~//MngArea.aspx");
                }
                else
                {
                    Response.Write("Não existe usuario ou senha");
                }
            }
        }
    }
}