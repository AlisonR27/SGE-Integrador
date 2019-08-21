using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppSGE.Modelo
{
    internal class Areas
    {
        internal int id { get; set; }
        internal string desc { get; set; }
        internal Areas() {
            desc = "";
        }
        internal Areas(int aid, string adesc)
        {
            this.id = aid;
            this.desc = adesc;
        }
    }
}