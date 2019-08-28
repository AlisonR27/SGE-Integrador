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
        public byte[] foto { get; set; }
        public string fotoURL { get; set; }
        public string email { get; set; }
        public string telefone { get; set; }

        public Usuario()
        {
            this.senha = "";
            this.tipo = 0;
            this.nome = "";
            this.foto = null;
            this.fotoURL = "aa";
            this.email = "";
            this.telefone = "";
        }
        public Usuario(string asenha, int atipo, string anome, string aemail, string atelefone)
        {
            this.senha = asenha;
            this.tipo = atipo;
            this.nome = anome;
            this.email = aemail;
            this.telefone = atelefone;
        }
        public Usuario(string asenha, int atipo, string anome, string afotoURL, string aemail, string atelefone)
        {
            this.senha = asenha;
            this.tipo = atipo;
            this.nome = anome;
            this.fotoURL = afotoURL;
            this.email = aemail;
            this.telefone = atelefone;
        }
    }
}