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
        DAL.DALArea d = new DAL.DALArea();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Image"] = null;
                DataColumn dc = new DataColumn("column1");
                dt.Columns.Add(dc);
                DataRow dr = dt.NewRow();
                dr["column1"] = "value1";
                dt.Rows.Add(dr);
                GV1.DataSource = dt;
                GV1.DataBind();
                //Search
                GVAreasCadastradas.DataSource = d.SelectAll();
                GVAreasCadastradas.DataBind();
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
        protected void Unnamed_Click1(object sender, EventArgs e)
        {
            if (dt.Columns.Count < 6) { 
            BoundField bf = new BoundField();
            bf.DataField = "RRR";
            bf.HeaderText = "New Header";
            DataColumn dc = new DataColumn("column1");
            dt.Columns.Add(dc);
            GV1.Columns.Add(bf);
            }
            else { }
        }     

        protected void Searchbtn_Click(object sender, EventArgs e)
        {
            GVAreasCadastradas.DataSource = null;
            if (TextBoxSearch.Text.ToString().Trim() == "")
            {
                GVAreasCadastradas.DataSource = d.SelectAll();
                GVAreasCadastradas.DataBind();
            }
            else if (TextBoxSearch.Text.ToString().Trim() != "")
            {
                GVAreasCadastradas.DataSource = d.SelectAllFields(TextBoxSearch.Text.ToString());
                GVAreasCadastradas.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GVAreasCadastradas.DataSource = null;
            if (TextBoxSearch.Text.ToString().Trim() == "")
            {
                GVAreasCadastradas.DataSource = d.SelectAll();
                GVAreasCadastradas.DataBind();
            }
            else if (TextBoxSearch.Text.ToString().Trim() != "")
            {
                GVAreasCadastradas.DataSource = d.SelectAllFields(TextBoxSearch.Text.ToString());
                GVAreasCadastradas.DataBind();
            }
        }
    }
}