using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using WebAppSGE.Modelo;
using WebAppSGE.DAL;
using System.IO;
using System.Data;

namespace WebAppSGE
{
    public partial class MngArea : System.Web.UI.Page
    {
        Sports oSports = new Sports();
        DataTable dt = new DataTable();
        DALArea d = new DALArea();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Image"] = null;
                DGSearch.DataSource = d.SelectAllFields();
                DGSearch.DataBind();
            }
        }
        protected void Submit(object sender, EventArgs e)
        {
            //Adicionando Area Esportiva
                DALArea oDALArea = new DALArea();
                oDALArea.Insert(new Areas(TextBoxDesc.Text));
        
            // Rodando esportes
                DALAreaSport oDALAreaSport = new DALAreaSport();
            DALSport oDALSport = new DALSport();
                foreach (CheckBoxField li in CBL.Items)
            {
                 if (oDALAreaSport.Insert(new AreaSport(DALArea.Identity(), Alternadores.AlternadorI(li.DataField.ToString()))))
                {
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertSuccessful()", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);

                }
            }
            Response.Redirect("~//PaginaSearch.aspx");

        }
        protected void FormSubmit_Click(object sender, EventArgs e)
        {
        
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            DGSearch.DataSource = null;
            if (SearchBox.Text.ToString().Trim() == "")
            {
                DGSearch.DataSource = d.SelectAllFields();
                DGSearch.DataBind();
            }
            else if (SearchBox.Text.ToString().Trim() != "")
            {
                DGSearch.DataSource = d.SelectAll(SearchBox.Text.ToString().Trim());
                DGSearch.DataBind();
            }
        }
    }
}