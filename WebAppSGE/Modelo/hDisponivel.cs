using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppSGE.Modelo
{
    public class hDisponivel
    {
        public int id { get; set; }
        public int diaSemana { get; set; }
        public string horaInicio { get; set; }
        public string horaFim { get; set; }
        public int idAreaEsportiva { get; set; }
        public DateTime data { get; set; }
        public hDisponivel()
        {
            diaSemana = 0;
            horaInicio = "";
            horaFim = "";

        }
        public hDisponivel(int diaSemana, string horaInicio, string horaFim)
        {
            this.id = id;
            this.diaSemana = diaSemana;
            this.horaInicio = horaInicio;
            this.horaFim = horaFim;
        }
    }
}