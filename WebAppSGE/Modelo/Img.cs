using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppSGE.Modelo
{
    public class Img
    {
        public int id { get; set; }
        public string imgUrl { get; set; }
        public Img(string aImgUrl)
        {
            this.imgUrl = aImgUrl;
        }
    }
}