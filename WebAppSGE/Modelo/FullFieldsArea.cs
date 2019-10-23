using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace WebAppSGE.Modelo
{
    public class FullFieldsArea
    {
        public int id { get; set; }
        public string nome { get; set; }
        public string desc { get; set; }
        public int sit { get; set; }
        public string imgUrl { get; set; }
        public FullFieldsArea()
        {
            desc = "";
        }
        public FullFieldsArea(string adesc)
        {
            this.desc = adesc;
        }
        public FullFieldsArea(string aid, string anome, string adesc, int asit, string aimgUrl)
        {
            this.id = WebAppSGE.DAL.Alternadores.AlternadorI(aid);
            this.nome=anome;
            this.desc = adesc;
            this.imgUrl = aimgUrl;
            this.sit = asit;
        }

        public FullFieldsArea(string aid, string anome, string adesc, int asit)
        {
            this.id = WebAppSGE.DAL.Alternadores.AlternadorI(aid);
            this.nome = anome;
            this.desc = adesc;
            this.sit = asit;
        }

        /*public FullFieldsArea(string aid, string anome, string aimgUrl)
        {
            this.id = WebAppSGE.DAL.Alternadores.AlternadorI(aid);
            this.nome = anome;
            this.imgUrl = aimgUrl;
        }*/
    }
}