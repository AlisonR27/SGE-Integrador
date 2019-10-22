using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebAppSGE.DAL;
using WebAppSGE.Modelo;

namespace WebAppSGE
{
    public partial class EditarPerfil : System.Web.UI.Page
    {
        List<Usuario> b;
        List<Img> c;
        DALUsuario oDALUsuario = new DALUsuario();
        DALImage oDALImage = new DALImage();
        protected void Page_Load(object sender, EventArgs e)
        {
            b = oDALUsuario.Select(Session["id"].ToString());
            c = oDALImage.SelectUnic(b.First().fotoId.ToString());
            {
                if (!IsPostBack)
                {
                    SlctNome.Text = SlctNome.Text.ToUpper();
                    SlctNome.Text = b.First().nome.ToString();
                    SlctNome.Text = SlctNome.Text.ToUpper();
                    ProfileImg.ImageUrl = c.First().imgUrl;
                    SlctID.Text = Session["id"].ToString();
                    TXTNome.Text = b.First().nome.ToString();
                    TXTEmail.Text = b.First().email.ToString();
                    TXTTelefone.Text = b.First().telefone.ToString();
                }
            }
        }

        protected void FormSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                oDALUsuario.Update(new Usuario(b.First().senha, b.First().tipo, TXTNome.Text,"1",TXTEmail.Text,TXTTelefone.Text, Alternadores.AlternadorI(Session["id"].ToString())), IMGUPLD.FileName);
                string p1 = IMGUPLD.FileName;
                string p2 = Path.Combine("~/src/temp/" + p1);
                Session["fotourl"] = p2;
                Session["unome"] = TXTNome.Text;
                Session["uemail"] = TXTEmail.Text;
                if(p1 != "")Response.Redirect("/Crop.aspx");
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertSuccessful()", true);
            }
            catch(Exception ex)
            {
                string a = "Email invalido, por favor colocar um valido";
                if(ex.Message.Contains(a)) { SQLErr(TXTEmail, a, EmailErr); } else { SQLCor(TXTEmail, EmailErr); }
                a = "Email já cadastrado";
                if (ex.Message.Contains(a)) { SQLErr(TXTEmail, a, EmailErr); } else { SQLCor(TXTEmail, EmailErr); }
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