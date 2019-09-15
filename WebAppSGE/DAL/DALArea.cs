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
                cmd.CommandText = "Select * from area_poliesportiva";
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
            cmd.CommandText = "Select *,img.img_url from area_poliesportiva areap inner join img_Area img on img.id_AreaPoliesportiva = areap.id";
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
                SqlCommand cmd = new SqlCommand("INSERT INTO area_poliesportiva (descricao) VALUES(@descricao)", conn);
                cmd.Parameters.AddWithValue("@descricao", obj.desc);
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
            SqlCommand cmd = new SqlCommand("DELETE FROM area_poliesportiva WHERE ID = @id", conn);
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
            cmd.CommandText = @"select top(1) id from area_Poliesportiva
                                order by id desc";
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
        public List<Modelo.Areas> SelectAll(string txt)
        {
            Modelo.Areas aArea;
            List<Modelo.Areas> aListAreas = new List<Modelo.Areas>();
            SqlConnection conn = new SqlConnection(connectionstring);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from area_poliesportiva where descricao like '%"+txt+"%'";
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
        public List<Modelo.FullFieldsArea> SelectAllFields(string txt)
        {
            Modelo.FullFieldsArea aArea;
            List<Modelo.FullFieldsArea> aListAreas = new List<Modelo.FullFieldsArea>();
            SqlConnection conn = new SqlConnection(connectionstring);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select *,img.img_url from area_poliesportiva areap inner join img_Area img on img.id_AreaPoliesportiva = areap.id where descricao like '%" + txt + "%'";
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
    } 
}
