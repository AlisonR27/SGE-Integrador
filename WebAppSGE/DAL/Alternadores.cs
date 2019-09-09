using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppSGE.DAL
{
    public class Alternadores
    {
        public static int AlternadorI(string c)
        {
            int d;
            if (c != "") d = Convert.ToInt16(c);
            else d = 0;
            return d;
        }
        public static DateTime AlternadorDT(string c)
        {
            DateTime d;
            if (c != "") d = Convert.ToDateTime(c);
            else d = new DateTime();
            return d;
        }
    }
}