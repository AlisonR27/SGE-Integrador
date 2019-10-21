using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using WebAppSGE.Modelo;
using WebAppSGE.DAL;
using System.Web.Services;

namespace WebAppSGE
{
    public partial class DetalharArea : System.Web.UI.Page
    {
        static string mascaradata = "dd/MM/yyyy";
        DateTime domingo;
        DateTime hoje = DateTime.Now.Date;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Verifica se a página foi acessada da maneira correta
            if (Session["Redirected"] != null && (Session["Redirected"].ToString() == "true" || Session["Redirected"].ToString() == "True"))
            {
                ErrorPanel.Style.Add("display", "none");

                string x = dv1.Rows[3].Cells[1].Text;
                AreaImage.ImageUrl = x;
                dv1.Rows[3].Style.Add("display", "none");
            }
            else
            {
                //ErrorPanel.Visible = true;
            }
            int aux = -1;
            //Dia atual em formato 'Segunda-Feira' 
            string nw = hoje.ToString("dddd").ToLower();
            //Verifica se é a primeira vez que entra na pagina
            if (Session["primeira"] == null) {
                //Define o domingo da semana atual
                switch (nw)
                {
                    case "domingo":
                        domingo = hoje;
                        break;
                    case "segunda-feira":
                        domingo = hoje.Subtract(TimeSpan.FromDays(2));
                        break;
                    case "terça-feira":
                        domingo = hoje.Subtract(TimeSpan.FromDays(3));
                        break;
                    case "quarta-feira":
                        domingo = hoje.Subtract(TimeSpan.FromDays(4));
                        break;
                    case "quinta-feira":
                        domingo = hoje.Subtract(TimeSpan.FromDays(5));
                        break;
                    case "sexta-feira":
                        domingo = hoje.Subtract(TimeSpan.FromDays(6));
                        break;
                    case "sábado":
                        domingo = hoje.Subtract(TimeSpan.FromDays(7));
                        break;
                    default:
                        aux = -1;
                        break;
                }
                reloadRow();
                int rs = RowSize();
                criaTabela(rs);
                preencheTabela(rs);
            }
            else
            {
                //Define o domingo com base no session
                domingo = Convert.ToDateTime(Session["domingo"].ToString());
                reloadRow();
                //Roda a verificação das solicitações
                int rs = RowSize();
                criaTabela(rs);
                preencheTabela(rs);

            }
        }
        //Preenche a tabela com valores
        protected void preencheTabela(int rs)
        {
            if (rs > 0)
            {
                List<hRegistrado> lhRegistrado = new List<hRegistrado>();
                DALhRegistrado oDALhRegistrado = new DALhRegistrado();
                List<hRegistrado>[] weekValues = new List<hRegistrado>[7];

                for (int i = 1; i <= rs; i++)
                {
                    int x = 0;
                    for (int j = 0; j < 7; j++)
                    {
                        weekValues[j] = oDALhRegistrado.SelectDate(Convert.ToDateTime(semrow.Cells[j].InnerHtml).ToString("yyyy-MM-dd"));
                    }
                    for (int j = 0; j < 7; j++)
                    {
                        if (weekValues[j].Count > 0)
                        {
                            foreach (hRegistrado hr in weekValues[i])
                            {
                                try { 
                                x++;
                                weekTable.Rows[x].Cells[j].InnerText = $"{hr.hInicio}~{hr.hFim}";
                                weekTable.Rows[x].Cells[j].Attributes.Add("class", "bg-danger text-center");
                                }
                                catch(Exception e)
                                {
                                    Response.Write(e.Message);
                                }
                            }
                            //if (weekValues[j-1][i-1] != null)
                            //{
                            //    weekTable.Rows[i].Cells[j].InnerText = $"{weekValues[i][j].hInicio}~{weekValues[i][j].hFim}";
                            //    weekTable.Rows[i].Cells[j].Attributes.Add("class", "bg-danger text-center");
                            //}
                        }
                    }
                }
            }
        }
        //Define o tamanho da tabela em X e Y.
        protected void criaTabela(int rs)
        {
            if (rs > 0) { 
                for (int i = 0; i < rs; i++)
                {
                    weekTable.Rows.Add(new HtmlTableRow());
                    for (int j = 0; j < 7; j++)
                    {
                        HtmlTableCell td = new HtmlTableCell();
                        td.InnerText = "Livre";
                        td.Attributes.Add("class","bg-success text-center");
                        weekTable.Rows[i + 1].Cells.Add(td);
                    }
                }
            }
            else
            {
                HtmlTableRow tr = new HtmlTableRow();
                HtmlTableCell td = new HtmlTableCell();
                td.ColSpan = 7;
                td.InnerText = "Livre";
                td.Attributes.Add("class", "bg-success text-center");
                tr.Cells.Add(td);
                weekTable.Rows.Add(tr);
            }
        }
        protected int RowSize()
        {
            int maior = 0;
            for (int i = 0; i < 7; i++)
            {
                 int atual = DALhRegistrado.NumberOfRows(Convert.ToDateTime(semrow.Cells[i].InnerHtml).ToString("yyyy-MM-dd"));
                if ( atual > maior)
                {
                    maior = atual;
                }
            }
            if (maior > 0)
            {
                return maior;
            }
            else { return -1; }
        }
        //Recarrega a Linha de Cabeçalho da Tabela
        protected void reloadRow()
        {
            for (int i = 0; i < 7; i++)
            {
                DateTime x = domingo.AddDays(i);
                semrow.Cells[i].InnerHtml = x.ToString(mascaradata);
            }
        }
        //Abre página para solicitação
        protected void Unnamed_Click(object sender, EventArgs e)
        {
            bool flag = false;
            string selecteDate = "";
            semrow.DataBind();
            for (int i = 0; i < 7; i++){
                if (semrow.Cells[i].Attributes["class"] == "px-2 active")
                {
                    flag = true;
                    selecteDate = semrow.Cells[i].InnerText;
                }
            }   
            if (flag)
            {
                Session["preSolDate"] = selecteDate;
                Response.Redirect("~//SlctAgendamento.aspx");
            }
            else
            {
                Response.Write("Selecione um dia!");
            }
        }
        //Retorna uma semana
        protected void return1week_Click(object sender, EventArgs e)
        {
            Session["primeira"] = 1;
            domingo = domingo.Subtract(TimeSpan.FromDays(7));
            Session["domingo"] = domingo.ToString(mascaradata);
            Response.Redirect(Request.UrlReferrer.ToString());
        }
        //Avança uma semana
        protected void go1week_Click(object sender, EventArgs e)
        {
            Session["primeira"] = 1;
            domingo = domingo.AddDays(7);
            Session["domingo"] = domingo.ToString(mascaradata);
            Response.Redirect(Request.UrlReferrer.ToString());


        }
        [WebMethod]
        public void setSessionDate(string selecteDate)
        {
            Session["preSolDate"] = selecteDate;
            Response.Redirect("~//SlctAgendamento.aspx");
        }
    }
}