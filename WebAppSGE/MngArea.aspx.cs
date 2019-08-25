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
            oDALArea.Insert(new Areas());
        }
        protected void FormSubmit_Click(object sender, EventArgs e)
        {

        }

        protected void AddSport_Click(object sender, EventArgs e)
        {
        }
    }
}