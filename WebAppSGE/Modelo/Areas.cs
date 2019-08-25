using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppSGE.Modelo
{
    public class Areas
    {
        public int id { get; set; }
        public string desc { get; set; }
        public Areas() {
            desc = "";
        }
        public Areas(int aid, string adesc)
        {
            this.id = aid;
            this.desc = adesc;
        }
        public Areas(string adesc)
        {
            this.desc = adesc;
        }
    }
}