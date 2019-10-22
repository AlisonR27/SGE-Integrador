using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebAppSGE.DAL;
using WebAppSGE.Modelo;
using Image = System.Drawing.Image;

namespace WebAppSGE
{
    public partial class Registrar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
        }

        protected void submitcrop_Click(object sender, EventArgs e)
        {
            int id = new int();
            DALUsuario oDALUsuario = new DALUsuario();
            DALImage oDALImage = new DALImage();
            //Manipulação do corte da imagem
            try
            {
                FU1.PostedFile.SaveAs(Server.MapPath("~/src/temp/") + FU1.FileName);
                //Submeter 
                id = oDALUsuario.InsertUserImg("/src/temp/" + FU1.FileName);
                if (id < 0)
                {
                    throw new Exception();
                }
                ImgErr.Text = "";
            }
            catch(Exception)
            {
                ImgErr.Text = "Insira uma imagem";
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);
            }
            try { oDALUsuario.Insert(new Usuario(Pass.Text, 2, TextBox1.Text, id.ToString(), TXTEmail.Text, TXTPhone.Value)); ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertSuccessful()", true); }
            catch(Exception ex)
            {
                string a = "Email invalido, por favor colocar um valido";
                if (ex.Message.Contains(a)) { SQLErr(TXTEmail, a, EmailErr); } else { SQLCor(TXTEmail, EmailErr); }
                a = "Email já cadastrado";
                if (ex.Message.Contains(a)) { SQLErr(TXTEmail, a, EmailErr); } else { SQLCor(TXTEmail, EmailErr); }
                a = "Senha curta, por favor colocar uma com pelo menos 8 caracteres";
                if (ex.Message.Contains(a)) { SQLErr(Pass, a,PassErr); } else { SQLCor(Pass,PassErr); }
                if(Pass.Text != CnfrmPass.Text) { SQLErr(CnfrmPass, "As Senhas não batem",ConfirmPassErr); } else { SQLCor(CnfrmPass,ConfirmPassErr); }
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);

            }
        }
        protected void SQLErr(TextBox t, string d, Label a)
        {
            t.BorderColor = System.Drawing.Color.Red;
            a.Text = d;
        }
        protected void SQLCor(TextBox t, Label a)
        {
            t.BorderColor = System.Drawing.Color.White;
            a.Text = "";
        }
    }
}