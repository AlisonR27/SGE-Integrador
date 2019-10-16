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
        public List<Modelo.Img> SelectAll()
        {
            Modelo.Img aImage;
            List<Modelo.Img> aListImages = new List<Modelo.Img>();
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from img_Area";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aImage = new Modelo.Img(
                        dr["img_Url"].ToString());
                    aListImages.Add(aImage);
                }
            }
            dr.Close();
            conn.Close();
            return aListImages;
        }
        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Modelo.Img obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("DELETE FROM img_Area WHERE id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.ExecuteNonQuery();

        }
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public bool Insert(Modelo.Img obj)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand com = conn.CreateCommand();
                SqlCommand cmd = new SqlCommand("INSERT INTO img_Area  VALUES(@img_Url, @id_Area)", conn);
                cmd.Parameters.AddWithValue("@img_Url", obj.imgUrl);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch
            {
                return false;
            }
        }
        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Img obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("UPDATE img_Area SET img_Url = @img_Url WHERE id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.ExecuteNonQuery();
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Img> Select(string id)
        {
            Modelo.Img aImage;
            List<Modelo.Img> aListImages = new List<Modelo.Img>();
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from Area_Img ai inner join Img i on i.id = ai.id_Img where ai.id_Area = @id";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aImage = new Modelo.Img(dr["img_Url"].ToString());
                    aListImages.Add(aImage);
                }
            }
            dr.Close();
            conn.Close();
            return aListImages;
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Img> SelectUnic(string id)
        {
            Modelo.Img aImage;
            List<Modelo.Img> aListImages = new List<Modelo.Img>();
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from Img where id = @id";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aImage = new Modelo.Img(dr["img_Url"].ToString());
                    aListImages.Add(aImage);
                }
            }
            dr.Close();
            conn.Close();
            return aListImages;
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public string NextIdentity()
        {
            string x = "";
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select max(id) as id from Img";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    x = (DAL.Alternadores.AlternadorI(dr["id"].ToString())+1).ToString();
                }
            }
            else
            {
                x = "1";
            }
            dr.Close();
            conn.Close();
            return x;
        }
    }
}