using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppSGE.Modelo
{
    internal class Sports
    {
        internal int id { get; set; }
        internal string nome { get; set; }

        internal Sports()
        {
            this.nome = "";
        }
        internal Sports(int aid, string anome)
        {
            this.id = aid;
            this.nome = anome;
        }
    }
}