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
    public partial class ListSolicitacoesAdmin : System.Web.UI.Page
    {
        static string mascaraSQL = "yyyy-MM-dd";
        DALSolicitacaoReserva oDALSolicitacaoReserva = new DALSolicitacaoReserva();       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }
        protected string getStatus(string stats)
        {
            switch (stats)
            {
                case "0":
                    return "<img src=\"src/imgs/0.png\" class=\"invert\" width=\"20px\"/>";
                case "1":
                    return "<img src=\"src/imgs/1.png\" width=\"20px\"/>";
                case "2":
                    return "<img src=\"src/imgs/2.png\" width=\"20px\"/>";
                default:
                    Response.Write("erro");
                    return "<img src=\"src/imgs/0.png\" width=\"20px\"/>";
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            string codigo;
            codigo = ((DataBoundLiteralControl)((LinkButton)sender).Controls[0]).Text;
            codigo = codigo.Replace("<p class=\"d-none\">","");
            codigo = codigo.Replace("</p><span class=\"w-100 d-block\">Indeferir Com Especificação</span>", "");
            Session["idSol"] = codigo;
        }

        protected void btnDef_Click(object sender, EventArgs e)
        {
            DALSolicitacaoReserva oDALSolicitacaoReserva = new DALSolicitacaoReserva();
            DALhRegistrado oDALhRegistrado = new DALhRegistrado();
            string codigo;
            codigo = ((DataBoundLiteralControl)((LinkButton)sender).Controls[0]).Text;
            codigo = codigo.Replace("<p class=\"d-none\">", "");
            codigo = codigo.Replace("</p><span class=\"w-100 d-block\">Deferir</span>", "");
            oDALSolicitacaoReserva.Deferir(codigo);
            List<SolicitacaoReserva> x = new List<SolicitacaoReserva>();
            x = oDALSolicitacaoReserva.SelectUnic(Alternadores.AlternadorI(codigo));
            SolicitacaoReserva processing = x.First<SolicitacaoReserva>();
            if (processing.rep == true)
            {
                if(processing.Data_fim <= processing.Data_ini)
                {
                    oDALhRegistrado.Insert(new hRegistrado(processing.Data_ini.ToString(mascaraSQL),processing.horaIni,processing.horaFim,processing.id.ToString()));
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
        }
        protected void btnIndef_Click(object sender, EventArgs e)
        {
            DALSolicitacaoReserva oDALSolicitacaoReserva = new DALSolicitacaoReserva();
            DALhRegistrado oDALhRegistrado = new DALhRegistrado();
            string codigo;
            codigo = ((DataBoundLiteralControl)((LinkButton)sender).Controls[0]).Text;
            codigo = codigo.Replace("<p class=\"d-none\">", "");
            codigo = codigo.Replace("</p><span class=\"w-100 d-block\">Indeferir</span>", "");
            Session["IdIndef"] = codigo;
            Response.Redirect("/MotivoIndef.aspx");
        }

        protected void Unnamed_Click1(object sender, EventArgs e)
        {
            DALSolicitacaoReserva oDALSolicitacaoReserva = new DALSolicitacaoReserva();
            DALhRegistrado oDALhRegistrado = new DALhRegistrado();
            string codigo;
            codigo = ((DataBoundLiteralControl)((LinkButton)sender).Controls[0]).Text;
            codigo = codigo.Replace("<p class=\"d-none\">", "");
            codigo = codigo.Replace("</p><span class=\"w-100 d-block\">Deferir Com Especificação</span>", "");
            Session["IdDef"] = codigo;
            Response.Redirect("EspDeferimento.aspx");
        }
    }
}