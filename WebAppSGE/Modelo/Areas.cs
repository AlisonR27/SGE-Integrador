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
        public Areas(string adesc)
        {
            this.desc = adesc;
        }
        public Areas(string aid, string adesc)
        {
            this.id = int.Parse(aid);
            this.desc = adesc;
        }
    }
}