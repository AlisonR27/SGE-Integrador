using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppSGE.Modelo
{
    public class Areas
    {
        internal int id { get; set; }
        internal string desc { get; set; }
        internal Areas() {
            id = 0;
            desc = "";
        }
        internal Areas(int aid, string adesc)
        {
            id = aid;
            desc = adesc;
        }
    }
}