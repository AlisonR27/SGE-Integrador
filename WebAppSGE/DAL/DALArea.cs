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
                        aArea = new Modelo.Areas(
                            Alternadores.AlternadorI(dr["id"].ToString()),
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
        public void Insert(Modelo.Areas obj)
        {
            SqlConnection conn = new SqlConnection(connectionstring);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("INSERT INTO area_poliesportiva (descricao) VALUES(@descricao)", conn);
            cmd.Parameters.AddWithValue("@descricao", obj.desc);
            cmd.ExecuteNonQuery();
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

    } 
}
