using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppSGE.Modelo
{
    public class AreaImage
    {
        int idArea { get; set; }
        int idImage { get; set; }
        public AreaImage()
        {
            
        }
        public AreaImage(int aidArea,int aidImage)
        {
            this.idArea = aidArea;
            this.idImage = aidImage;
        }
    }
}