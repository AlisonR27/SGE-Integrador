using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebAppSGE.DAL
{
    public class DALImage
    {
        string connectionString = "";

        public DALImage()
        {
            connectionString = ConfigurationManager.ConnectionStrings["SGEConnectionString"].ConnectionString;
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Image> SelectAll()
        {
            Modelo.Image aImage;
            List<Modelo.Image> aListImages = new List<Modelo.Image>();
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from img_Area";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aImage = new Modelo.Image(
                        dr["img_Url"].ToString(),
                       Alternadores.AlternadorI(dr["id_AreaPoliesportiva"].ToString()));
                    aListImages.Add(aImage);
                }
            }
            dr.Close();
            conn.Close();
            return aListImages;
        }
        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Modelo.Image obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("DELETE FROM img_Area WHERE id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.ExecuteNonQuery();

        }
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public bool Insert(Modelo.Image obj)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand com = conn.CreateCommand();
                SqlCommand cmd = new SqlCommand("INSERT INTO img_Area  VALUES(@img_Url, @id_Area)", conn);
                cmd.Parameters.AddWithValue("@img_Url", obj.imgUrl);
                cmd.Parameters.AddWithValue("@id_Area", obj.idArea);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch
            {
                return false;
            }
        }
        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Image obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("UPDATE img_Area SET img_Url = @img_Url, id_AreaPoliesportiva = @id_Area WHERE id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.Parameters.AddWithValue("@img_Url", obj.imgUrl);
            cmd.Parameters.AddWithValue("@id_Area", obj.idArea);
            cmd.ExecuteNonQuery();
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Image> Select(string id)
        {
            Modelo.Image aImage;
            List<Modelo.Image> aListImages = new List<Modelo.Image>();
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from img_Area Where id = @id";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aImage = new Modelo.Image(dr["img_Url"].ToString(),
                       Alternadores.AlternadorI(dr["id_AreaPoliesportiva"].ToString()));
                    aListImages.Add(aImage);
                }
            }
            dr.Close();
            conn.Close();
            return aListImages;
        }
    }
}