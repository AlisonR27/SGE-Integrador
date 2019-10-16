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
            int aux = -1;
            switch (DateTime.Now.ToString("dddd"))
            {
                case "Sunday":
                    aux = 0;
                    for (int i = 1; i < 6; i++)
                    {
                        semrow.Cells[i].Text += DateTime.Now.AddDays(i);
                    }
                    break;
                case "Monday":
                    aux = 1;
                    semrow.Cells[0].Text += DateTime.Now.Subtract(TimeSpan.FromDays(1));
                    for (int i = 2; i < 6; i++)
                    {
                        semrow.Cells[i].Text += DateTime.Now.AddDays(i);
                    }
                    break;
                case "Tuesday":
                    aux = 2;
                    for (int i = 2; i == 0; i--){
                        semrow.Cells[i].Text += DateTime.Now.AddDays(i);
                    }
                    for (int i = 4; i < 6; i++)
                    {
                        semrow.Cells[i].Text += DateTime.Now.AddDays(i);
                    }
                    break;
                case "Wednesday":
                    aux = 3;
                    for (int i = 4; i == 0; i--)
                    {
                        semrow.Cells[i].Text += DateTime.Now.AddDays(i);
                    }
                    for (int i = 4; i < 6; i++)
                    {
                        semrow.Cells[i].Text += DateTime.Now.AddDays(i);
                    }
                    break;
                case "Thursday":
                    aux = 4;
                    for (int i = 5; i == 0; i--)
                    {
                        semrow.Cells[i].Text += DateTime.Now.AddDays(i);
                    }
                    for (int i = 5; i < 6; i++)
                    {
                        semrow.Cells[i].Text += DateTime.Now.AddDays(i);
                    }
                    break;
                case "Friday":
                    aux = 5;
                    for (int i = 6; i == 0; i--)
                    {
                        semrow.Cells[i].Text += DateTime.Now.AddDays(i);
                    }
                    for (int i = 3; i < 6; i++)
                    {
                        semrow.Cells[i].Text += DateTime.Now.AddDays(i);
                    }
                    break;
                case "Saturday":
                    aux = 6;
                    for (int i = 3; i == 0; i--)
                    {
                        semrow.Cells[i].Text += DateTime.Now.AddDays(i);
                    }
                    for (int i = 3; i < 6; i++)
                    {
                        semrow.Cells[i].Text += DateTime.Now.AddDays(i);
                    }
                    break;
                default:
                    aux = -1;
                    break;
            }

            foreach(TableHeaderCell thc in semrow.Cells)
            {
                
                if (DateTime.Now.ToString("dddd") == thc.Text)
                {
                    thc.Style.Add("background", "green");
                }
            }
               if (Session["Redirected"] != null && (Session["Redirected"].ToString() == "true" || Session["Redirected"].ToString() == "True"))
                {
                        ErrorPanel.Style.Add("display", "none");

                        string x = dv1.Rows[3].Cells[1].Text;
                        AreaImage.ImageUrl = x;
                        dv1.Rows[3].Style.Add("display", "none");
                }
                else
                {
                ErrorPanel.Visible = true;
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.Redirect("~//SlctAgendamento.aspx");
        }
    }
}