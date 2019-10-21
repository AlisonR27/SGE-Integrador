using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppSGE
{
    public partial class ListSolicitacoesAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected string getStatus(string stats)
        {
            switch (stats)
            {
                case "0":
                    return "<img src=\"src/imgs/0.png\" width=\"20px\"/>";
                case "1":
                    return "<img src=\"src/imgs/1.png\" width=\"20px\"/>";
                case "2":
                    return "<img src=\"src/imgs/2.png\" width=\"20px\"/>";
                default:
                    Response.Write("erro");
                    return "<img src=\"src/imgs/0.png\" width=\"20px\"/>";
            }
        }
    }
}