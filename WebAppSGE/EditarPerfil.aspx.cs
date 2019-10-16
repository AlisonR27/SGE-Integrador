﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebAppSGE.DAL;
using WebAppSGE.Modelo;

namespace WebAppSGE
{
    public partial class EditarPerfil : System.Web.UI.Page
    {
        DALUsuario oDALUsuario = new DALUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SlctNome.Text = SlctNome.Text.ToUpper();
                List<Usuario> b = oDALUsuario.Select(Session["id"].ToString());
                SlctNome.Text = b.First().nome.ToString();
                SlctID.Text = b.First().id.ToString();
            }
        }

        protected void FormSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                //oDALUsuario.Update(new Usuario(TXTNome.Text,,TXTEmail.Text,TXTTelefone.Text)); Falta a Lógica da Imagem
                Response.Redirect("~//PaginaInicial.aspx");

            }
            catch
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "2", "alertUpdateFailed()", false);
            }
        }
    }
}