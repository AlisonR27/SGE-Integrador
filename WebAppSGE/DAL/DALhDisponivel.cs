using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebAppSGE.DAL
{
    public class DALhDisponivel
    {
        string connectionstring = "";
        public DALhDisponivel()
        {
            connectionstring = ConfigurationManager.ConnectionStrings["SGEConnectionString"].ConnectionString;
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.hDisponivel> SelectAll()
        {
            Modelo.hDisponivel aArea;
            List<Modelo.hDisponivel> aListAreas = new List<Modelo.hDisponivel>();
            SqlConnection conn = new SqlConnection(connectionstring);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from horario_Disponivel";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {

                while (dr.Read())
                {
                    aArea = new Modelo.hDisponivel(
                        Alternadores.AlternadorI(dr["dia_semana"].ToString()),
                        dr["hora_inicio"].ToString(),
                        dr["hora_fim"].ToString()
                        );
                    aListAreas.Add(aArea);
                }
            }
            dr.Close();
            conn.Close();

            return aListAreas;
        }
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public bool Insert(Modelo.hDisponivel obj)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connectionstring);
                conn.Open();
                SqlCommand com = conn.CreateCommand();
                SqlCommand cmd = new SqlCommand("INSERT INTO horario_Disponivel (dia_semana,hora_inicio,hora_fim) VALUES(@dia,@hinit,@hend)", conn);
                cmd.Parameters.AddWithValue("@dia", obj.diaSemana);
                cmd.Parameters.AddWithValue("@hinit", obj.horaInicio);
                cmd.Parameters.AddWithValue("@hend", obj.horaFim);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch { return false;  }
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public bool Update(Modelo.hDisponivel obj, string id)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connectionstring);
                conn.Open();
                SqlCommand com = conn.CreateCommand();
                SqlCommand cmd = new SqlCommand("Update horario_Disponivel set dia_semana = @dia,set hora_inicio = @hinit,set hora_fim = @hfim where id = @id", conn);
                cmd.Parameters.AddWithValue("@dia", obj.diaSemana);
                cmd.Parameters.AddWithValue("@hinit", obj.horaInicio);
                cmd.Parameters.AddWithValue("@hfim", obj.horaFim);
                cmd.Parameters.AddWithValue("id", id);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch { return false;  }
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.hDisponivel> Select(string id)
        {
            Modelo.hDisponivel ahDisponivel;
            List<Modelo.hDisponivel> aListhDisponivel = new List<Modelo.hDisponivel>();
            SqlConnection conn = new SqlConnection(connectionstring);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from horario_Disponivel where id = @id"; cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    ahDisponivel = new Modelo.hDisponivel(Alternadores.AlternadorI(dr["dia_semana"].ToString()), dr["hora_inicio"].ToString(), dr["hora_fim"].ToString());
                    aListhDisponivel.Add(ahDisponivel);
                }
            }
            else { throw new Exception(); }
            dr.Close();
            conn.Close();
            return aListhDisponivel;
        }
        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Modelo.hDisponivel obj)
        {
            SqlConnection conn = new SqlConnection(connectionstring);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("DELETE FROM horario_Disponivel WHERE ID = @id", conn);
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
            cmd.CommandText = @"select max(id) as id from horario_Disponivel";
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

    }
}