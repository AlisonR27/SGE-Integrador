using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppSGE.Modelo
{
    public class hDisponivel
    {
        internal int id { get; set; }
        internal int diaSemana { get; set; }
        internal string horaInicio { get; set; }
        internal string horaFim { get; set; }
        internal int idAreaEsportiva { get; set; }
        internal hDisponivel()
        {
            diaSemana = 0;
            horaInicio = "";
            horaFim = "";

        }
        internal hDisponivel(int id, int diaSemana, string horaInicio, string horaFim, int idAreaEsportiva)
        {
            this.id = id;
            this.diaSemana = diaSemana;
            this.horaInicio = horaInicio;
            this.horaFim = horaFim;
            this.idAreaEsportiva = idAreaEsportiva;
        }
    }
}