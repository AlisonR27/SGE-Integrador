using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppSGE.Modelo
{
    public class Image
    {
        public int id { get; set; }
        public string imgUrl { get; set; }
        public int idArea { get; set; }
        public Image(string aImgUrl, int idArea)
        {
            this.imgUrl = aImgUrl;
            this.idArea = idArea;
        }
    }
}