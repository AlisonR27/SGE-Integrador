using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppSGE.DAL
{
    public class Alternadores
    {
        internal int AlternadorI(string c)
        {
            int d;
            if (c != "") d = Convert.ToInt16(c);
            else d = 0;
            return d;
        }
    }
}