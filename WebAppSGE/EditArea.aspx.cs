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
    public partial class EditArea : System.Web.UI.Page
    {
        DALArea oDALArea = new DALArea();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<FullFieldsArea> a = oDALArea.SelectUnic(Convert.ToInt16(Session["AreaId"]));
                TextBoxName.Text = a.First().nome;
                TextBoxDesc.Text = a.First().desc;
            }
        }

        protected void Unnamed3_Click(object sender, EventArgs e)
        {
            //oDALArea.Update(new FullFieldsArea(Session["AreaId"].ToString(), TextBoxName.Text, TextBoxDesc.Text)); Possui um erro que a descrição vira valor do nome e da descrição n sei pq
            //oDALArea.UpdateAreaImg(FileUpload1.Controls.ToString(), Convert.ToInt16(Session["Areaid"])); Eu tentei fazer algo n sei se ta certo mt menos como tentar traduzir mas pelo menos o dal deve estar certo
            Response.Redirect("~//MngArea.aspx");
        }

        protected void Unnamed4_Click(object sender, EventArgs e)
        {
            //oDALArea.Delete(Session["AreaId"].ToString()); Falta terminar de configurar seu DAL
            Response.Redirect("~//MngArea.aspx");
        }
    }
}