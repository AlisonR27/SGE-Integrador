using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
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
            Modelo.Usuario o;
            int id = int.Parse(Login1.UserName.ToString());
            List<Modelo.Usuario> list = D.Select(o.id.ToString());
            string senha = Login1.Password.ToString();
            if (list[0] != null && list[0].senha == senha)
            {
                o = list[0];
                //Fazer comando para proxima pagina de menu
            }
            else
            {
                Response.Write("Não existe usuario ou senha");
            }
        }
    }
}