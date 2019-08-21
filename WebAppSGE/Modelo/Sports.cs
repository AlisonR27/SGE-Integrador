using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppSGE.Modelo
{
    public class Sports
    {
        public string id;
        public string nome;

        public Sports()
        {
            this.id = "";
            this.nome = "";
        }
        public Sports(string aid, string anome)
        {
            this.id = aid;
            this.nome = anome;
        }
    }
}