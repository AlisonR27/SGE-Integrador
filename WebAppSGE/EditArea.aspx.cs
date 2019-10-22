using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebAppSGE.DAL;
using WebAppSGE.Modelo;

namespace WebAppSGE
{
    public partial class EditArea : System.Web.UI.Page
    {
        DALArea oDALArea = new DALArea();
        DALAreaSport oDALAreaSport = new DALAreaSport();
        DALSport oDALSport = new DALSport();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<FullFieldsArea> a = oDALArea.SelectUnic(Convert.ToInt16(Session["AreaId"]));
                TextBoxName.Text = a.First().nome;
                TextBoxDesc.Text = a.First().desc;
                List<Sports> g = oDALAreaSport.SelectSportsOfArea(Session["AreaId"].ToString());
                int b = 0;
                foreach (CheckBox v in CBL.Items) {
                    if (g[b].nome == v.Text) v.Checked = true; b++;
                }
            }
        }

        protected void Unnamed3_Click(object sender, EventArgs e)
        {
            try
            {
                oDALArea.Update(new FullFieldsArea(Session["AreaId"].ToString(), TextBoxName.Text, TextBoxDesc.Text)); 
                string p1 = FileUpload1.FileName;
                string p2 = Path.Combine("~/src/temp/" + p1);
                oDALArea.UpdateAreaImg(p2, Convert.ToInt16(Session["Areaid"]));
                Response.Redirect("~//MngArea.aspx");
            }
            catch(Exception ex)
            {
                string d = "Área já existente";
                if (ex.Message.Contains(d)) { SQLErr(TextBoxName, d, NameErr); } else { SQLCor(TextBoxName, NameErr); }
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);
            }
            List<string> selectedValues = CBL.Items.Cast<ListItem>().Where(li => li.Selected).Select(li => li.Value).ToList();                       
            foreach (string s in selectedValues)
            {
                // li.Attributes["checked"]
                if (oDALAreaSport.Update(new AreaSport(DALArea.Identity(), Alternadores.AlternadorI(s))))
                {
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertSuccessful()", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);

                }
            }
        }

        protected void Unnamed4_Click(object sender, EventArgs e)
        {
            try
            {
                oDALArea.Delete(Session["AreaId"].ToString()); 
                Response.Redirect("~//MngArea.aspx");
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "mensagem", "AlertInsertFailed()", true);
            }
        }
        protected void SQLErr(TextBox t, string d, Label a)
        {
            t.BorderColor = System.Drawing.Color.Red;
            a.Text = d;
        }
        protected void SQLCor(TextBox t, Label a)
        {
            t.BorderColor = System.Drawing.Color.White;
            a.Text = "";
        }
    }
}