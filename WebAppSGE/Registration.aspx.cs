using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;


namespace WebAppSGE
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ListItem i = new ListItem(TXTPhones.Text);
            i.Attributes.Add("class", "sportItem");
            string ActualValue = TXTPhones.Text;
            if (selectedPhones.Items.Count > 0)
            {
                if (selectedPhones.Items.FindByValue(ActualValue) == null) selectedPhones.Items.Add(i);
                else
                {
                    if (!(selectedPhones.Items.FindByValue(ActualValue).Value == i.Value)) selectedPhones.Items.Add(i);
                }

            }
            else
            {
                selectedPhones.Items.Add(i);
            }
        }
    }
}