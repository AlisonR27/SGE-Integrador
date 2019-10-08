using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppSGE.Modelo
{
    public class SolicitacaoReserva
    {
        public int id { get; set; }
        public DateTime horario_Solicitacao { get; set; }
        public int status { get; set; }
        public string atividades_Realizadas { get; set; }
        public string motivo_Solicitacao { get; set; }
        public string motivo_Indeferimento { get; set; }
        public DateTime Data_ini { get; set; }
        public DateTime Data_fim { get; set; }
        public int id_Usuario_Solicitante { get; set; }
        public int id_Usuario_Analise { get; set; }
        public int id_AreaPoliesportiva { get; set; }

        public SolicitacaoReserva() // No parameters
        {
            this.id = 0;
            this.horario_Solicitacao = new DateTime();
            this.status = 0;
            this.atividades_Realizadas = "";
            this.motivo_Solicitacao = "";
            this.motivo_Indeferimento = "";
            this.Data_ini = new DateTime();
            this.Data_fim = new DateTime();
            this.id_AreaPoliesportiva = 0;
            this.id_Usuario_Analise = 0;
            this.id_Usuario_Solicitante = 0;
        }

        public SolicitacaoReserva(DateTime ahorario_Solicitacao, string aatividades_Realizadas, string amotivo_Solicitacao, DateTime adata_Ini, DateTime adata_Fim, int aid_Usuario_Solicitante, int aid_AreaPoliesportiva) // User Insert
        {
            this.horario_Solicitacao = ahorario_Solicitacao;
            this.status = 0;
            this.atividades_Realizadas = aatividades_Realizadas;
            this.motivo_Solicitacao = amotivo_Solicitacao;
            this.Data_ini = adata_Ini;
            this.Data_fim = adata_Fim;
            this.id_Usuario_Solicitante = aid_Usuario_Solicitante;
            this.id_AreaPoliesportiva = aid_AreaPoliesportiva;
        }
        public SolicitacaoReserva(DateTime ahorario_Solicitacao, string aatividades_Realizadas, string amotivo_Solicitacao, string amotivo_Indeferimento, DateTime adata_Ini, DateTime adata_Fim, int aid_Usuario_Solicitante, int aid_AreaPoliesportiva) // Admin Update
        {
            this.horario_Solicitacao = ahorario_Solicitacao;
            this.status = 0;
            this.atividades_Realizadas = aatividades_Realizadas;
            this.motivo_Solicitacao = amotivo_Solicitacao;
            this.motivo_Indeferimento = amotivo_Indeferimento;
            this.Data_ini = adata_Ini;
            this.Data_fim = adata_Fim;
            this.id_Usuario_Solicitante = aid_Usuario_Solicitante;
            this.id_AreaPoliesportiva = aid_AreaPoliesportiva;
        }
        public SolicitacaoReserva(int aid, DateTime ahorario_Solicitacao, string aatividades_Realizadas, string amotivo_Solicitacao, string amotivo_Indeferimento, DateTime adata_Ini, DateTime adata_Fim, int aid_Usuario_Solicitante, int aid_AreaPoliesportiva) // Total return
        {
            this.id = aid;
            this.horario_Solicitacao = ahorario_Solicitacao;
            this.status = 0;
            this.atividades_Realizadas = aatividades_Realizadas;
            this.motivo_Solicitacao = amotivo_Solicitacao;
            this.motivo_Indeferimento = amotivo_Indeferimento;
            this.Data_ini = adata_Ini;
            this.Data_fim = adata_Fim;
            this.id_Usuario_Solicitante = aid_Usuario_Solicitante;
            this.id_AreaPoliesportiva = aid_AreaPoliesportiva;
        }
    }
}