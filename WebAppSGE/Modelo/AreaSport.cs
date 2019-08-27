using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppSGE.Modelo
{
    public class AreaSport
    {
        public int idArea { get; set; }
        public int idSport { get; set; }
        public AreaSport(int aidArea, int aidSport)
        {
            this.idArea = aidArea;
            this.idSport = aidSport;
        }
    }
}