using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppSGE.Modelo
{
    public class Sports
    {
        public int id { set; get; }
        public string nome { set; get; }

        public Sports()
        {
            this.id = "";
            this.nome = "";
        }
        public Sports(string a_id, string anome)
        {
            this.id = a_id;
            this.nome = anome;
        }
    }
}