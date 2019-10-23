using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppSGE.Modelo
{
    public class AreaHorario
    {
        public int idArea { get; set; }
        public int idHorario { get; set; }
        public AreaHorario()
        {

        }
        public AreaHorario(int aidArea, int aidHorario)
        {
            this.idArea = aidArea;
            this.idHorario = aidHorario;
        }
    }
}