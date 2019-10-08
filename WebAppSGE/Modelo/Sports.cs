using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebAppSGE.DAL;

namespace WebAppSGE.Modelo
{
    public class Sports
    {
        public int id { get; set; }
        public string nome { get; set; }
        public string descricao { get; set; }

        public Sports()
        {
            this.nome = "";
        }
        public Sports(string aid, string anome,string adesc)
        {
            this.id = Alternadores.AlternadorI(aid);
            this.nome = anome;
            this.descricao = adesc;
        }
        public Sports(string anome)
        {
            this.nome = anome;
        }
        public Sports(string anome, string desc)
        {
            this.nome = anome;
            this.descricao = desc;
        }
    }
}