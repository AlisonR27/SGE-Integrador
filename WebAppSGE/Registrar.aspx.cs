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
            DALUsuario oDALUsuario = new DALUsuario();
            DALImage oDALImage = new DALImage();
            //Manipulação do corte da imagem
            FU1.PostedFile.SaveAs(Server.MapPath("~/src/temp/") + FU1.FileName);
            cropimage1.Src = "src/temp/" + FU1.FileName;
            string filepath = Path.Combine(Server.MapPath("/"), cropimage1.Src);
            Image outputfile = Image.FromFile(filepath);
            Rectangle cropcoordinate = new Rectangle(Convert.ToInt32(coordinate_x.Value), Convert.ToInt32(coordinate_y.Value), Convert.ToInt32(coordinate_w.Value), Convert.ToInt32(coordinate_h.Value));
            string confilename, confilepath;
            Bitmap bitmap = new Bitmap(cropcoordinate.Width, cropcoordinate.Height, outputfile.PixelFormat);
            Graphics grapics = Graphics.FromImage(bitmap);
            grapics.DrawImage(outputfile, new Rectangle(0, 0, bitmap.Width, bitmap.Height), cropcoordinate, GraphicsUnit.Pixel);
            confilename = "Crop_" + oDALImage.NextIdentity()+".png";
            confilepath = Path.Combine(Server.MapPath("~/src/temp/"), confilename);
            bitmap.Save(confilepath);
            //cropimg.Visible = true;
            cropimg.Src = "~/src/temp/" + confilename;
            //Submeter 
            int id = oDALUsuario.InsertUserImg("/src/temp/" + confilename);
            if (id < 0)
            {
                throw new Exception();
            }
            try { oDALUsuario.Insert(new Usuario(Pass.Text, 2, TextBox1.Text, id.ToString(), TXTEmail.Text, TXTPhone.Value)); ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertSuccessful()", true); }
            catch(Exception ex)
            {
                string a = "Email invalido, por favor colocar um valido";
                if (ex.Message.Contains(a)) { SQLErr(TXTEmail, a); } else { SQLCor(TXTEmail, "E-Mail"); }
                a = "Senha curta, por favor colocar uma com pelo menos 8 caracteres";
                if (ex.Message.Contains(a)) { SQLErr(Pass, a); } else { SQLCor(Pass, "Senha"); }
                if(Pass.Text != CnfrmPass.Text) { SQLErr(CnfrmPass, "As Senhas não batem"); } else { SQLCor(CnfrmPass,"Repita a Senha"); }
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);

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