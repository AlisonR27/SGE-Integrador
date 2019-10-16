using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppSGE.Modelo
{
    public class Usuario
    {
        public int id { get; set; }
        public string senha { get; set; }
        public int tipo { get; set; }
        public string nome { get; set; }
        public int fotoId { get; set; }
        public string email { get; set; }
        public string telefone { get; set; }

        public Usuario()
        {
            this.senha = "";
            this.tipo = 0;
            this.nome = "";
            this.fotoId = 0;
            this.email = "";
            this.telefone = "";
        }
        public Usuario(string asenha, string aemail, string anome, int atipo)
        {
            this.senha = asenha;
            this.email = asenha;
            this.nome = anome;
            this.tipo = atipo;
        }
        public Usuario(string asenha, int atipo, string anome, string afotoId, string aemail, string atelefone)
        {
            this.senha = asenha;
            this.tipo = atipo;
            this.nome = anome;
            this.fotoId =  int.Parse(afotoId);
            this.email = aemail;
            this.telefone = atelefone;
        }
        public Usuario(string asenha, int atipo, string anome, string afotoId, string aemail, string atelefone, int aid)
        {
            this.senha = asenha;
            this.tipo = atipo;
            this.nome = anome;
            this.fotoId = int.Parse(afotoId);
            this.email = aemail;
            this.telefone = atelefone;
            this.id = aid;
        }
    }
}