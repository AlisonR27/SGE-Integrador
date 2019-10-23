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
    public partial class EditArea : System.Web.UI.Page
    {
        DALArea oDALArea = new DALArea();
        DALAreaSport oDALAreaSport = new DALAreaSport();
        DALSport oDALSport = new DALSport();
        DALhDisponivel oDALhDisponivel = new DALhDisponivel();
        DALAreaHorario oDALAreaHorario = new DALAreaHorario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<FullFieldsArea> a = oDALArea.SelectUnic(Convert.ToInt16(Session["AreaId"]));
                TextBoxName.Text = a.First().nome;
                TextBoxDesc.Text = a.First().desc;
                List<Sports> g = oDALAreaSport.SelectSportsOfArea(Session["AreaId"].ToString());
                int b = 0;
                foreach (CheckBox v in CBL.Items) {
                    if (g[b].nome == v.Text)  v.Checked = true; 
                        b++;                    
                }
                List<hDisponivel> h = oDALAreaHorario.SelecthDisponivelOfArea(Session["AreaId"].ToString());
                TXTDomInit.Text = h[0].horaInicio.ToString();
                TXTDomEnd.Text = h[0].horaFim.ToString();
                TXTSegInit.Text = h[1].horaInicio.ToString();
                TXTSegEnd.Text = h[1].horaFim.ToString();
                TXTTerInit.Text = h[2].horaInicio.ToString();
                TXTTerEnd.Text = h[2].horaFim.ToString();
                TXTQuaInit.Text = h[3].horaInicio.ToString();
                TXTQuaEnd.Text = h[3].horaFim.ToString();
                TXTQuiInit.Text = h[4].horaInicio.ToString();
                TXTQuiEnd.Text = h[4].horaFim.ToString();
                TXTSexInit.Text = h[5].horaInicio.ToString();
                TXTSexEnd.Text = h[5].horaFim.ToString();
                TXTSabInit.Text = h[6].horaInicio.ToString();
                TXTSabEnd.Text = h[6].horaFim.ToString();
            }
        }

        protected void Unnamed3_Click(object sender, EventArgs e)
        {
            //Adicionando Area Esportiva
            DALArea oDALArea = new DALArea();
            if (oDALArea.Update(new FullFieldsArea(Session["AreaId"].ToString(), TextBoxName.Text, TextBoxDesc.Text, 1)))
            {
                string p1 = FileUpload1.FileName;
                string p2 = Path.Combine("~/src/temp/" + p1);
                oDALArea.UpdateAreaImg(p2, Convert.ToInt16(Session["Areaid"]));
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);
            }
            //Criando horários
            hDisponivel[] h = new hDisponivel[7];
            DALAreaHorario oDALAreaHorario = new DALAreaHorario();
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
                if (oDALhDisponivel.Update(new hDisponivel(b + 1, TXT[b, 0], TXT[b, 1]),Session["IdArea"].ToString())) { ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertSuccessful()", true); } else { ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true); }                
                c++; b++;
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
                if (oDALAreaSport.Update(new AreaSport(DALArea.Identity(), Alternadores.AlternadorI(s))))
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
            if (oDALArea.UpdateAreaImg("https://i.ytimg.com/vi/IQgg_LNl1B4/hqdefault.jpg", DALArea.Identity()))
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertSuccessful()", true);
            }
            else
            {

                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);
            }            
        }        

        protected void Unnamed4_Click(object sender, EventArgs e)
        {
            if(oDALArea.Delete(Session["AreaId"].ToString())) Response.Redirect("~//MngArea.aspx");            
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);
            }
        }       
    }
}