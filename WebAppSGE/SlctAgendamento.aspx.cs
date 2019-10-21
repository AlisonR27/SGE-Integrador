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
    public partial class SlctAgendamento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try { 
            if (Session["Redirected"] != null && Session["Redirected"].ToString() == "True")
            {
                ErrorPanel.Style.Add("display", "none");
                txtidarea.Text = Session["AreaID"].ToString();
                txtdataInit.Text = Session["preSolDate"].ToString();
            }
            else
            {
                //CBL1.DataSource = null;
                //ErrorPanel.Visible = true;
            }
            }
            catch
            {
                
            }
        }
        protected void btnsolicitar_Click(object sender, EventArgs e)
        {
            DALSolicitacaoReserva oDALSolicitacaoReserva = new DALSolicitacaoReserva();
            string atv = "";  //Adaptar para colocar todas
            foreach (CheckBox cbf in CBL1.Items)
            {
                if (cbf.Checked) atv += cbf.Text+ ";";
            }
            if (oDALSolicitacaoReserva.Insert(new SolicitacaoReserva(DateTime.Now, atv, TextBoxMotivo.Text, Alternadores.AlternadorDT(TextBoxDe.Text), Alternadores.AlternadorDT(TextBoxAte.Text), Alternadores.AlternadorI(Session["UserID"].ToString()), Alternadores.AlternadorI(txtidarea.Text))))
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertSuccessful()", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);
            }
        }
        protected void calendar1_SelectionChanged(object sender, EventArgs e)
        {

        }
    }
}