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
        bool Repeat;
        protected void Page_Load(object sender, EventArgs e)
        {
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
        protected void btnsolicitar_Click(object sender, EventArgs e)
        {
            switch (dropdown1.SelectedIndex)
            {
                case 0:
                    Repeat = false;
                    break;
                case 1:
                    Repeat = true;
                    break;
                case 2:
                    Repeat = false;
                    break;
            }
            DALSolicitacaoReserva oDALSolicitacaoReserva = new DALSolicitacaoReserva();
            string atv = "";  //Adaptar para colocar todas
            foreach (CheckBox cbf in CBL1.Items)
            {
                if (cbf.Checked) atv += cbf.Text+ ";";
            }
            if (oDALSolicitacaoReserva.Insert(new SolicitacaoReserva(0,DateTime.Now, 0,atv, TextBoxMotivo.Text,
                null,Alternadores.AlternadorDT(TextBoxDe.Text), Alternadores.AlternadorDT(TextBoxAte.Text),
                Alternadores.AlternadorI(Session["id"].ToString()), 0 ,Alternadores.AlternadorI(Session["AreaId"].ToString()),
                Repeat, TextBoxDe.Text,TextBoxAte.Text)))
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