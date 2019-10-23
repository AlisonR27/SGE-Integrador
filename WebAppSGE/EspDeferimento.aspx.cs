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
    public partial class EspDeferimentoT2 : System.Web.UI.Page
    {
        static string mascaraSQL = "yyyy-MM-dd";
        DALSolicitacaoReserva oDALSolicitacaoReserva = new DALSolicitacaoReserva();
        List<SolicitacaoReserva> a = new List<SolicitacaoReserva>();
        protected void Page_Load(object sender, EventArgs e)
        {
            a = oDALSolicitacaoReserva.SelectUnic(Alternadores.AlternadorI(Session["IdDef"].ToString()));
            if (!IsPostBack)
            {                
                txtdataIni.Value = a.First().Data_ini.ToString();
                txtdataFim.Value = a.First().Data_fim.ToString();
                txthoraIni.Text = a.First().horaIni.ToString();
                txthoraFim.Text = a.First().horaFim.ToString();
                TextBox1.Text = a.First().id_AreaPoliesportiva.ToString();
                if (a.First().rep) { DropDownList1.Items[0].Enabled = true; DropDownList1.Items[1].Enabled = false; }
                else { DropDownList1.Items[1].Enabled = true; DropDownList1.Items[0].Enabled = false; }
            }
        }

        protected void btnsolicitar_Click(object sender, EventArgs e)
        {
            bool d = new bool();
            if (DropDownList1.Items[0].Enabled == true) d = true;

            else d = false;
            DALhRegistrado oDALhRegistrado = new DALhRegistrado();
            if (oDALSolicitacaoReserva.DeferirEsp(new SolicitacaoReserva(a.First().horario_Solicitacao, a.First().atividades_Realizadas, a.First().motivo_Solicitacao, "", Alternadores.AlternadorDT(txtdataIni.Value), Alternadores.AlternadorDT(txtdataFim.Value), a.First().id_Usuario_Solicitante, Alternadores.AlternadorI(Session["id"].ToString()), Alternadores.AlternadorI(Session["IdDef"].ToString()), 3,d)))
            {                
            List<SolicitacaoReserva> x = new List<SolicitacaoReserva>();
            x = oDALSolicitacaoReserva.SelectUnic(Alternadores.AlternadorI(Session["IdDef"].ToString()));
            SolicitacaoReserva processing = x.First<SolicitacaoReserva>();
            if (processing.rep == true)
            {
                if (processing.Data_fim <= processing.Data_ini)
                {
                    oDALhRegistrado.Insert(new hRegistrado(processing.Data_ini.ToString(mascaraSQL), processing.horaIni, processing.horaFim, processing.id.ToString()));
                }
                else
                {
                    if (processing.Data_fim.Subtract(processing.Data_ini) > TimeSpan.FromDays(7))
                    {
                        for (DateTime s = processing.Data_ini; s <= processing.Data_fim; s.AddDays(7))
                        {
                            oDALhRegistrado.Insert(new hRegistrado(s.ToString(mascaraSQL), processing.horaIni, processing.horaFim, processing.id.ToString()));
                        }
                    }
                    else
                    {
                        oDALhRegistrado.Insert(new hRegistrado(processing.Data_ini.ToString(mascaraSQL), processing.horaIni, processing.horaFim, processing.id.ToString()));
                    }
                }
            }
            else
            {
                oDALhRegistrado.Insert(new hRegistrado(processing.Data_ini.ToString(mascaraSQL), processing.horaIni, processing.horaFim, processing.id.ToString()));
            }
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertSuccessful()", true);
            }
            else { ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true); }
        }
    }
}