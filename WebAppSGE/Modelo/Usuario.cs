using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppSGE.Modelo
{
    internal class Usuario
    {
        internal int id { get; set; }
        internal string senha { get; set; }
        internal int tipo { get; set; }
        internal string nome { get; set; }
        internal byte[] foto { get; set; }
        internal string email { get; set; }
        internal string telefone { get; set; }

        internal Usuario()
        {
            this.senha = "";
            this.tipo = 0;
            this.nome = "";
            this.foto = null;
            this.email = "";
            this.telefone = "";
        }
        internal Usuario(int aid, string asenha, int atipo, string anome, byte[] afoto, string aemail, string atelefone)
        {
            this.id = aid;
            this.senha = asenha;
            this.tipo = atipo;
            this.nome = anome;
            this.foto = afoto;
            this.email = aemail;
            this.telefone = atelefone;
        }
    }
}