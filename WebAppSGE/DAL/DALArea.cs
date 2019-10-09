using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebAppSGE.DAL;

namespace WebAppSGE.DAL
{

    public class DALArea
    {
        string connectionstring = "";
        public DALArea()
        {
            connectionstring = ConfigurationManager.ConnectionStrings["SGEConnectionString"].ConnectionString;
        }
            [DataObjectMethod(DataObjectMethodType.Select)]
            public List<Modelo.Areas> SelectAll()
            {
                Modelo.Areas aArea;
                List<Modelo.Areas> aListAreas = new List<Modelo.Areas>();
                SqlConnection conn = new SqlConnection(connectionstring);
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "Select * from area_Esportiva";
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {

                    while (dr.Read()) 
                    {
                        aArea = new Modelo.Areas( dr["id"].ToString(),
                            dr["descricao"].ToString()    
                            );
                        aListAreas.Add(aArea);
                    }
                }
                dr.Close();
                conn.Close();

                return aListAreas;
            }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.FullFieldsArea> SelectAllFields()
        {
            Modelo.FullFieldsArea aArea;
            List<Modelo.FullFieldsArea> aListAreas = new List<Modelo.FullFieldsArea>();
            SqlConnection conn = new SqlConnection(connectionstring);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = @"Select * from area_Esportiva areap inner
                                       join area_img aimg on aimg.id_Area = areap.id inner
                                       join Img img on img.id = aimg.id_Img";

SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aArea = new Modelo.FullFieldsArea(dr["id"].ToString(),
                        dr["descricao"].ToString(),
                        dr["img_url"].ToString());
                    aListAreas.Add(aArea);
                }
            }
            dr.Close();
            conn.Close();

            return aListAreas;
        }
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public bool Insert(Modelo.Areas obj)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connectionstring);
                conn.Open();
                SqlCommand com = conn.CreateCommand();
                SqlCommand cmd = new SqlCommand("INSERT INTO area_Esportiva (nome,descricao) VALUES(@nome,@descricao)", conn);
                cmd.Parameters.AddWithValue("@nome", obj.nome);cmd.Parameters.AddWithValue("@descricao", obj.desc);
                cmd.ExecuteNonQuery();
                return true;
            }              
            catch
            {
                return false;
            }
        }
        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Modelo.Areas obj)
        {
            SqlConnection conn = new SqlConnection(connectionstring);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("DELETE FROM area_Esportiva WHERE ID = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.ExecuteNonQuery();

        }
        public static int Identity()
        {
            int i = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SGEConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"select max(id) as id from area_Esportiva";
            cmd.Connection = conn;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    i = Alternadores.AlternadorI(dr["id"].ToString());
                }
            }
            dr.Close();
            conn.Close();
            return i;
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Areas> SelectUnic(int id)
        {
            Modelo.Areas aArea;
            List<Modelo.Areas> aListAreas = new List<Modelo.Areas>();
            SqlConnection conn = new SqlConnection(connectionstring);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from area_Esportiva where id = @id ";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {

                while (dr.Read())
                {
                    aArea = new Modelo.Areas(dr["id"].ToString(),
                        dr["descricao"].ToString()
                        );
                    aListAreas.Add(aArea);
                }
            }
            dr.Close();
            conn.Close();

            return aListAreas;
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Areas> SelectAll(string txt)
        {
            Modelo.Areas aArea;
            List<Modelo.Areas> aListAreas = new List<Modelo.Areas>();
            SqlConnection conn = new SqlConnection(connectionstring);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from area_Esportiva where descricao like '%" + txt+"%'";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {

                while (dr.Read())
                {
                    aArea = new Modelo.Areas(dr["id"].ToString(),
                        dr["descricao"].ToString()
                        );
                    aListAreas.Add(aArea);
                }
            }
            dr.Close();
            conn.Close();

            return aListAreas;
        }
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public bool InsertAreaImg(string url, int idArea)
        {
            try { 
                Modelo.Img mimg = new Modelo.Img(url);
                SqlConnection conn = new SqlConnection(connectionstring);
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = @"Insert into Img (img_Url) values (@url) 
                                    Select max(id) as id from Img";
                cmd.Parameters.AddWithValue("@url", url);
                SqlDataReader dr = cmd.ExecuteReader();
                int id = 0;
                if (dr.HasRows)
                {
                    int i =0;
                    while (dr.Read())
                    {
                        if (i > 0) {
                            break;
                        }
                          id = Alternadores.AlternadorI(dr["id"].ToString());
                        i++;
                    }
                }
                dr.Close();
                SqlCommand ncmd = conn.CreateCommand();
                if (id > 0) { 
                ncmd.CommandText = "Insert into Area_Img (id_Area,id_Img) values (@idA,@idI)"; ncmd.Parameters.AddWithValue("@idA", Identity()); ncmd.Parameters.AddWithValue("@idI", id);
                ncmd.ExecuteNonQuery();
                }
                else{
                    throw new Exception();
                }
                return true;
            }
            catch{
                return false;
            }
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.FullFieldsArea> SelectAllFields(string txt)
        {
            Modelo.FullFieldsArea aArea;
            List<Modelo.FullFieldsArea> aListAreas = new List<Modelo.FullFieldsArea>();
            SqlConnection conn = new SqlConnection(connectionstring);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from area_Esportiva areap inner join area_img aimg on aimg.id_Area = areap.id inner join Img img on  img.id = aimg.id_Img where descricao like '%" + txt + "%'";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aArea = new Modelo.FullFieldsArea(dr["id"].ToString(),
                        dr["descricao"].ToString(),
                        dr["img_Url"].ToString()
                    );
                    aListAreas.Add(aArea);
                }
            }
            dr.Close();
            conn.Close();

            return aListAreas;
        }
    } 
}
