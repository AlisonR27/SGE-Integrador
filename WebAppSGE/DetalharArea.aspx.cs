using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppSGE
{
    public partial class DetalharArea : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try { 
                string x = dv1.Rows[3].Cells[1].Text;
                AreaImage.ImageUrl = x;
            dv1.Rows[3].Style.Add("display","none");
            }
            catch { }
        }
    }
}