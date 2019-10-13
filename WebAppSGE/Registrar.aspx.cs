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
    public partial class Registrar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DALUsuario oDALUsuario = new DALUsuario();
            FileUpload1.SaveAs(MapPath("/src/temp/" + FileUpload1.FileName));
            int id = oDALUsuario.InsertUserImg("/src/temp/"+FileUpload1.FileName);
            if (id < 0)
            {
                throw new Exception();
            }
            if (oDALUsuario.Insert(new Usuario(Pass.Text, 2, TextBox1.Text, id.ToString(), TXTEmail.Text, TXTPhones.Text))) ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertSuccessful()", true);
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);

            }
        }

        
    }
}