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
    public partial class EditarPerfil : System.Web.UI.Page
    {
        DALUsuario oDALUsuario = new DALUsuario();
        Usuario a = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            SlctNome.Text = SlctNome.Text.ToUpper();
            a = (Usuario)OBJ.Select();         
            SlctNome.Text = a.nome.ToString();
            SlctID.Text = a.id.ToString();            
            //Falta a lógica da data de criação da conta 
        }

        protected void FormSubmit_Click(object sender, EventArgs e)  
        {
            //oDALUsuario.Update(new Usuario(TXTNome.Text,,TXTEmail.Text,TXTTelefone.Text)); Falta a Lógica da Imagem
        }
    }
}