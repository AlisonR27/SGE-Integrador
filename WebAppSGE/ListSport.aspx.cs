using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppSGE
{
    public partial class ListSport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ss_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                string codigo;
                // Le o numero da linha selecionada
                int index = Convert.ToInt32(e.CommandArgument);
                // Copia o conteúdo da primeira célula da linha -> Código do Livro
                codigo = ss.Rows[index].Cells[0].Text;
                Session["idsport"] = codigo;
                Response.Redirect("~//EditSport.aspx");
            }            
            
        }
    }
}