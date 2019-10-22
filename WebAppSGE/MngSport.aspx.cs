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
    public partial class MngSport : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void FormSubmit_Click(object sender, EventArgs e)
        {
                    DALSport dSport = new DALSport();
                     if (dSport.Insert(new Sports(TextBoxName.Text,TextBoxDesc.Text)))
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(),"mensagem", "AlertInsertSuccessful()", true);
                     else
                     {
                        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);
                   }
        
    
        }
        protected void SportsView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                string codigo;
                // Le o numero da linha selecionada
                int index = Convert.ToInt32(e.CommandArgument);
                // Copia o conteúdo da primeira célula da linha -> Código do Livro
                codigo = SportsView.Rows[index].Cells[0].Text;
                Session["idsport"] = codigo;
                Response.Redirect("~//EditSport.aspx");
            }
        }
    }
}