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
        public int sit { get; set; }
        public Areas() {
            desc = "";
        }
        public Areas(string anome)
        {
            this.nome = anome;
        }
        public Areas(string anome, string adesc, int asit)
        {
            this.desc = adesc;
            this.nome = anome;
            this.sit = asit;
        }
        public Areas(string aid, string anome, string adesc, int asit)
        {
            this.id = int.Parse(aid);
            this.nome = anome;
            this.desc = adesc;
            this.sit = asit;
        }
    }
}