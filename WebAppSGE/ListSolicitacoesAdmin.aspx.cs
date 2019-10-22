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
                    return "<img src=\"src/imgs/0.png\" width=\"20px\"/>";
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
            //oDALSolicitacaoReserva.UpdateAdmin()
        }

        protected void btnIndef_Click(object sender, EventArgs e)
        {

        }
    }
}