using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppSGE.Modelo
{
    public class Areas
    {
        public int id { get; set; }
        public string nome { get; set; }
        public string desc { get; set; }
        public Areas() {
            desc = "";
        }
        public Areas(string anome)
        {
            this.nome = anome;
        }
        public Areas(string anome, string adesc)
        {
            this.desc = adesc;
            this.nome = anome;
        }
        public Areas(string aid, string anome, string adesc)
        {
            this.id = int.Parse(aid);
            this.nome = anome;
            this.desc = adesc;
        }
    }
}