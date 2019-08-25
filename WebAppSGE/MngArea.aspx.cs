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
        string[] d = new string[7];
        hDisponivel[] hd = new hDisponivel[7];
        protected void Page_Load(object sender, EventArgs e)
        {
            d[0] = "Dom";
            d[1] = "Seg";
            d[2] = "Ter";
            d[3] = "Qua";
            d[4] = "Qui";
            d[5] = "Sex";
            d[6] = "Sab";
        }
        protected void Submit(object sender, EventArgs e)
        {
            //  DALArea dArea = new DALArea();
            //  DALhDisponivel dHorario = new DALhDisponivel();
            //  dHorario.Insert(new hDisponivel(
            //  int.Parse((TextBox));
            //   ));
            //  dArea.Insert(new Areas(
            // int.Parse(Text.Text), TextBoxID.Text
            //  ));
        }
        protected void FormSubmit_Click(object sender, EventArgs e)
        {

        }
    }
}