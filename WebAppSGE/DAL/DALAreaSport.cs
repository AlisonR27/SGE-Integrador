using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebAppSGE.DAL
{
    public class DALAreaSport
    {
        string connectionString = "";

        public DALAreaSport()
        {
            connectionString = ConfigurationManager.ConnectionStrings["SGEConnectionString"].ConnectionString;
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.AreaSport> SelectAll()
        {
            Modelo.AreaSport aAreaSports;
            List<Modelo.AreaSport> aListAreaSports = new List<Modelo.AreaSport>();
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from area_Atividade";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aAreaSports = new Modelo.AreaSport(
                        Alternadores.AlternadorI(dr["id_AtividadeEsportiva"].ToString()),
                        Alternadores.AlternadorI(dr["id_AreaPoliesportiva"].ToString()));
                    aListAreaSports.Add(aAreaSports);
                }
            }
            dr.Close();
            conn.Close();
            return aListAreaSports;
        }
        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Modelo.AreaSport obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("DELETE FROM area_Atividade WHERE id_AreaPoliesportiva = @id1, id_AtividadeEsportiva = @id2", conn);
            cmd.Parameters.AddWithValue("@id1", obj.idArea);
            cmd.Parameters.AddWithValue("@id2", obj.idSport);
            cmd.ExecuteNonQuery();

        }
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public bool Insert(Modelo.AreaSport obj)
        {
            try { 
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand com = conn.CreateCommand();
                SqlCommand cmd = new SqlCommand("INSERT INTO area_Atividade (id_AreaPoliesportiva,id_AtividadeEsportiva) VALUES(@id1, @id2)", conn);
                cmd.Parameters.AddWithValue("@id1", obj.idArea);
                cmd.Parameters.AddWithValue("@id2", obj.idSport);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch
            {
                return false;
            }
            }
    }
}