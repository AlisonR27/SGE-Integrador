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
    public partial class MotivoIndef : System.Web.UI.Page
    {
        DALSolicitacaoReserva oDALSolicitacaoReserva = new DALSolicitacaoReserva();
        protected void Page_Load(object sender, EventArgs e)
        {            
        }

        protected void btnIndef_Click(object sender, EventArgs e)
        {
            if (oDALSolicitacaoReserva.Indeferir(Session["IdIndef"].ToString(), TextBoxReason.Text))
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertSuccessful()", true);
                Response.Redirect("/ListSolicitacoesAdmin.aspx");
            }
            else ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);
        }
    }
}