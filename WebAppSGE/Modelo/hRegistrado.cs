using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebAppSGE.DAL;

namespace WebAppSGE.Modelo
{
    public class hRegistrado
    {
        public int id { get; set; }
        public DateTime dia { get; set; }
        public string hInicio { get; set; }
        public string hFim { get; set; }
        public int solId { get; set; }
        public int userId { get; set; }
        public int areaID { get; set; }
        public string areaNome { get; set; }
        public hRegistrado() {

        }
        public hRegistrado(string id, string dia, string hInicio, string hFim, string solId, string userId, string areaID, string areaNome)
        {
            this.id =  Alternadores.AlternadorI(id);
            this.dia =  Alternadores.AlternadorDT(dia);
            this.hInicio = hInicio;
            this.hFim = hFim;
            this.solId =  Alternadores.AlternadorI(solId);
            this.userId =  Alternadores.AlternadorI(userId);
            this.areaID =  Alternadores.AlternadorI(areaID);
            this.areaNome = areaNome;
        }
        public hRegistrado(string id, string dia, string hInicio, string hFim, string solId)
        {
            this.id =  Alternadores.AlternadorI(id);
            this.dia =  Alternadores.AlternadorDT(dia);
            this.hInicio = hInicio;
            this.hFim = hFim;
            this.solId =  Alternadores.AlternadorI(solId);
        }
        public hRegistrado(string dia, string hInicio, string hFim, string solId)
        {
            this.dia =  Alternadores.AlternadorDT(dia);
            this.hInicio = hInicio;
            this.hFim = hFim;
            this.solId =  Alternadores.AlternadorI(solId);
        }
    }
}