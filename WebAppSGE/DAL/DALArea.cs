using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebAppSGE.DAL
{

    internal class DALArea
    {
        string connectionstring = "";
        internal DALArea()
        {
            connectionstring = ConfigurationManager.ConnectionStrings["SGEConnectionString"].ConnectionString;
        }
            [DataObjectMethod(DataObjectMethodType.Select)]
            internal List<Modelo.Areas> SelectAll()
            {
                Modelo.Areas aArea;
                List<Modelo.Areas> aListAreas = new List<Modelo.Areas>();
                SqlConnection conn = new SqlConnection(connectionstring);
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "Select * from Areas";
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {

                    while (dr.Read()) 
                    {
                        aArea = new Modelo.Areas(
                            AlternadorI(dr["id"].ToString()),
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
        internal void Insert(Modelo.Areas obj)
        {
            SqlConnection conn = new SqlConnection(connectionstring);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("INSERT INTO Areas (descricao) VALUES(@descricao)", conn);
            cmd.Parameters.AddWithValue("@descricao", obj.desc);

            cmd.ExecuteNonQuery();

        }
        [DataObjectMethod(DataObjectMethodType.Delete)]
        internal void Delete(Modelo.Areas obj)
        {
            SqlConnection conn = new SqlConnection(connectionstring);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("DELETE FROM Areas WHERE ID = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.ExecuteNonQuery();

        }

        internal int AlternadorI(string c)
        {
            int d;
            if (c != "") d = Convert.ToInt16(c);
            else d = 0;
            return d;
        }
    } 
}
