using System;
using System.Collections.Generic;
using System.Drawing;
using Image = System.Drawing.Image;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace WebAppSGE
{
    public partial class Crop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            string filename = "macaiba2.PNG";
            string filepath = Path.Combine(Server.MapPath("~/src/"), filename);
            Image outputfile = Image.FromFile(filepath);
            Rectangle cropcoordinate = new Rectangle(Convert.ToInt32(coordinate_x.Value), Convert.ToInt32(coordinate_y.Value), Convert.ToInt32(coordinate_w.Value), Convert.ToInt32(coordinate_h.Value));
            string confilename, confilepath;
            Bitmap bitmap = new Bitmap(cropcoordinate.Width, cropcoordinate.Height, outputfile.PixelFormat);
            Graphics grapics = Graphics.FromImage(bitmap);
            grapics.DrawImage(outputfile, new Rectangle(0, 0, bitmap.Width, bitmap.Height), cropcoordinate, GraphicsUnit.Pixel);
            confilename = "Crop_" + filename;
            confilepath = Path.Combine(Server.MapPath("~/src/temp/"), confilename);
            bitmap.Save(confilepath);
            cropimg.Visible = true;
            cropimg.Src = "~/src/temp/" + confilename;
        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            if (FU1.HasFile)
            {
                FU1.PostedFile.SaveAs(Server.MapPath("~/src/temp/") + FU1.FileName);
                cropimage1.Src = "src/temp/" + FU1.FileName;
            }
        }
    }
}