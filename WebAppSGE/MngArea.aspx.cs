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
            oDALArea.Insert(new Areas(TextBoxName.Text,TextBoxDesc.Text));
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
                if (oDALhDisponivel.Insert(new hDisponivel(b + 1, TXT[b, 0], TXT[b, 1], DALArea.Identity()))) c++;
                b++;
            }
            if (c == 7)
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertSuccessful()", true);
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);
            }
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
                Response.Redirect("~\\EditArea.aspx");
            }
        }
    }
}