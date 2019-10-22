using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using WebAppSGE.Modelo;
using WebAppSGE.DAL;
using System.IO;
using System.Data;

namespace WebAppSGE
{
    public partial class MngArea : System.Web.UI.Page
    {
        Sports oSports = new Sports();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Image"] = null;
            }
        }
        protected void Submit(object sender, EventArgs e)
        {

            //Adicionando Area Esportiva
            DALArea oDALArea = new DALArea();
            try
            {
                oDALArea.Insert(new Areas(TextBoxName.Text, TextBoxDesc.Text));
            }
            catch(Exception ex)
            {
                string d = "Área já existente";
                if (ex.Message.Contains(d)) { SQLErr(TextBoxName, d, NameErr); } else { SQLCor(TextBoxName, NameErr); }                
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);
            }
            //Criando horários
            hDisponivel[] h = new hDisponivel[7];
            DALhDisponivel oDALhDisponivel = new DALhDisponivel();
            int b = 0, c = 0;
            string[,] TXT = new string[7, 2];
            TXT[0, 0] = TXTDomInit.Text;
            TXT[0, 1] = TXTDomEnd.Text;
            TXT[1, 0] = TXTSegInit.Text;
            TXT[1, 1] = TXTSegEnd.Text;
            TXT[2, 0] = TXTTerInit.Text;
            TXT[2, 1] = TXTTerEnd.Text;
            TXT[3, 0] = TXTQuaInit.Text;
            TXT[3, 1] = TXTQuaEnd.Text;
            TXT[4, 0] = TXTQuiInit.Text;
            TXT[4, 1] = TXTQuiEnd.Text;
            TXT[5, 0] = TXTSexInit.Text;
            TXT[5, 1] = TXTSexEnd.Text;
            TXT[6, 0] = TXTSabInit.Text;
            TXT[6, 1] = TXTSabEnd.Text;
            foreach (hDisponivel a in h)
            {
                try
                {
                    oDALhDisponivel.Insert(new hDisponivel(b + 1, TXT[b, 0], TXT[b, 1], DALArea.Identity())); c++; b++;
                }
                catch (Exception ex)
                {
                    string d = "Hora inicio invalida";
                    if (ex.Message.Contains(d)) { LoopDays(b, 0, true, d); } else { LoopDays(b, 0, false, d); }
                    d = "Hora fim invalida";
                    if (ex.Message.Contains(d)) { LoopDays(b, 1, true, d); } else { LoopDays(b, 1, false, d); }
                    d = "Minuto inicio invalido";
                    if (ex.Message.Contains(d)) { LoopDays(b, 0, true, d); } else { LoopDays(b, 0, false, d); }
                    d = "Minuto fim invalido";
                    if (ex.Message.Contains(d)) { LoopDays(b, 1, true, d); } else { LoopDays(b, 1, false, d); }
                    d = "Horario invalido, coloque uma hora fim maior que a inicio";
                    if (ex.Message.Contains(d)) { LoopDays(b, 1, true, d); } else { LoopDays(b, 1, false, d); }
                    d = "Horario invalido, coloque um minuto fim maior que a inicio";
                    if (ex.Message.Contains(d)) { LoopDays(b, 1, true, d); } else { LoopDays(b, 1, false, d); }                
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);                    
                }
            }
            if (c == 7)
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertSuccessful()", true);
            
            // Rodando esportes
            List<string> selectedValues = CBL.Items.Cast<ListItem>().Where(li => li.Selected).Select(li => li.Value).ToList();
            DALAreaSport oDALAreaSport = new DALAreaSport();
            DALSport oDALSport = new DALSport();
            foreach (string s in selectedValues)
            {
            // li.Attributes["checked"]
                if (oDALAreaSport.Insert(new AreaSport(DALArea.Identity(), Alternadores.AlternadorI(s))))
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertSuccessful()", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);

            }
            }
            //Adiciona Imagem
            //if (oDALArea.InsertAreaImg(Server.MapPath(FileUpload1.FileName), DALArea.Identity())) N pude testar ainda
            if (oDALArea.InsertAreaImg("https://i.ytimg.com/vi/IQgg_LNl1B4/hqdefault.jpg", DALArea.Identity()))
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertSuccessful()", true);
            }
            else
            {

                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);
            }
            //Envia para outra página
            Response.Redirect("~//MngArea.aspx");

        }
        protected void FormSubmit_Click(object sender, EventArgs e)
        {
        
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                string codigo;
                // Le o numero da linha selecionada
                int index = Convert.ToInt32(e.CommandArgument);
                // Copia o conteúdo da primeira célula da linha -> Código do Livro
                codigo = GridView1.Rows[index].Cells[0].Text;
                Session["AreaId"] = codigo;
                Response.Redirect("~//EditArea.aspx");
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
        protected void LoopDays(int d, int h, bool v, string g)
        {
            TextBox t = new TextBox(); 
            TextBox t2 = new TextBox();
            Label l = new Label();
            Label l2 = new Label();
            switch (d)
            {
                case 1:
                    {                        
                        t = TXTDomInit;
                        t2 = TXTDomEnd;
                        l = DomInitErr;
                        l2 = DomEndErr;
                        break;
                    }
                case 2:
                    {
                        t = TXTSegInit;
                        l = SegInitErr;
                        t2 = TXTSegEnd;
                        l2 = SegEndErr;
                        break;
                    }
                case 3:
                    {
                        t = TXTTerInit;
                        l = TerInitErr;
                        t2 = TXTTerEnd;
                        l2 = TerEndErr;
                        break;
                    }
                case 4:
                    {
                        t = TXTQuaInit;
                        l = QuaInitErr;
                        t2 = TXTQuaEnd;
                        l2 = QuaEndErr;
                        break;
                    }
                case 5:
                    {
                        t = TXTQuiInit;
                        l = QuiInitErr;
                        t2 = TXTQuiEnd;
                        l2 = QuiEndErr;
                        break;
                    }
                case 6:
                    {
                        t = TXTSexInit;
                        l = SexInitErr;
                        t2 = TXTSexEnd;
                        l2 = SexEndErr;
                        break;
                    }
                case 7:
                    {
                        t = TXTSabInit;
                        l = SabInitErr;
                        t2 = TXTSabEnd;
                        l2 = SabEndErr;
                        break;
                    }
            }
            if (h == 0)
            {
                if (v) SQLErr(t, g, l);
                else SQLCor(t, l);
            }
            else
            {
                if (v) SQLErr(t2, g, l2);
                else SQLCor(t2, l2);
            }
        }
    }
}