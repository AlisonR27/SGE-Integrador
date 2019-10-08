using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace WebAppSGE.Modelo
{
    public class FullFieldsArea
    {
        public int id { get; set; }
        public string desc { get; set; }
        public string imgUrl { get; set; }
        public FullFieldsArea()
        {
            desc = "";
        }
        public FullFieldsArea(string adesc)
        {
            this.desc = adesc;
        }
        public FullFieldsArea(string aid, string adesc, string aimgUrl)
        {
            this.id = WebAppSGE.DAL.Alternadores.AlternadorI(aid);
            this.desc = adesc;
            this.imgUrl = aimgUrl;
        }
    }
}