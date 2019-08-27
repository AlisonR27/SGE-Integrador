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