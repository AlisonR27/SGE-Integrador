using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebAppSGE.Modelo;
using WebAppSGE.DAL;

namespace WebAppSGE
{
    public partial class MngArea : System.Web.UI.Page
    {
        Sports oSports = new Sports();
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void Submit(object sender, EventArgs e)
        {
            DALArea oDALArea = new DALArea();
            oDALArea.Insert(new Areas(TextBoxDesc.Text));
        }
        protected void FormSubmit_Click(object sender, EventArgs e)
        {
            if (oDALArea.Insert(new Areas(TextBoxDesc.Text)))
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertSuccessful()", true);
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);
            }
        }
            hDisponivel[] h = new hDisponivel[7];
            DALhDisponivel oDALhDisponivel = new DALhDisponivel();
            int b = 0, c = 0;
            string[,] TXT = new string[7,2];
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
            foreach (hDisponivel a in h) {
                if (oDALhDisponivel.Insert(new hDisponivel(0,b,TXT[b,0], TXT[b, 1],0))) c++;
                b++;
            }
            if (c == 7)
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertSuccessful()", true);
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);
            }
        }

        protected void AddSportevent(object sender, EventArgs e)
        {
            DALAreaSport oDALAreaSport = new DALAreaSport();
             // if (oDALAreaSport.Insert(new AreaSport(Alternadores.AlternadorI(SportsList.DataValueField), DALArea.NextIdentity()))) ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertSuccessful();console.log('y');", true);
            // else { ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed();console.log('n')", true); }
            oDALAreaSport.Insert(new AreaSport(Alternadores.AlternadorI(SportsList.SelectedValue), DALArea.NextIdentity()));
        }
    }
}