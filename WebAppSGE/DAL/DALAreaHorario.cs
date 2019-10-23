using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebAppSGE.DAL
{
    public class DALAreaHorario
    {
        string connectionString = "";

        public DALAreaHorario()
        {
            connectionString = ConfigurationManager.ConnectionStrings["SGEConnectionString"].ConnectionString;
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.AreaHorario> SelectAll()
        {
            Modelo.AreaHorario aAreaHorarios;
            List<Modelo.AreaHorario> aListAreaHorarios = new List<Modelo.AreaHorario>();
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from area_horario_Disponivel";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aAreaHorarios = new Modelo.AreaHorario(
                        Alternadores.AlternadorI(dr["id_horario_Disponivel"].ToString()),
                        Alternadores.AlternadorI(dr["id_AreaPoliesportiva"].ToString()));
                    aListAreaHorarios.Add(aAreaHorarios);
                }
            }
            dr.Close();
            conn.Close();
            return aListAreaHorarios;
        }
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public bool Insert(Modelo.AreaHorario obj)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand com = conn.CreateCommand();
                SqlCommand cmd = new SqlCommand("INSERT INTO area_horario_Disponivel (id_Area,id_horario_Disponivel) VALUES(@id1, @id2)", conn);
                cmd.Parameters.AddWithValue("@id1", obj.idArea);
                cmd.Parameters.AddWithValue("@id2", obj.idHorario);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch
            {
                return false;
            }
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public bool Update(Modelo.AreaHorario obj)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand com = conn.CreateCommand();
                SqlCommand cmd = new SqlCommand("Update area_horario_Disponivel SET id_AreaPoliesportiva = @id1 , SET id_horario_Disponivel = @id2", conn);
                cmd.Parameters.AddWithValue("@id1", obj.idArea);
                cmd.Parameters.AddWithValue("@id2", obj.idHorario);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch
            {
                return false;
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.hDisponivel> SelecthDisponivelOfArea(string id)
        {
            try
            {
                Modelo.hDisponivel ahDisponivel;
                List<Modelo.hDisponivel> aListhDisponivel = new List<Modelo.hDisponivel>();
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.Parameters.AddWithValue("@idArea", id);
                cmd.CommandText = "Select * from area_horario_Disponivel aa inner join horario_Disponivel ae on ae.id = aa.id_horario_Disponivel where id_Area = @idArea";
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        ahDisponivel = new Modelo.hDisponivel(
                           Alternadores.AlternadorI(dr["dia_semana"].ToString()), dr["hora_inicio"].ToString(), dr["hora_fim"].ToString());
                        aListhDisponivel.Add(ahDisponivel);
                    }
                }
                dr.Close();
                conn.Close();
                return aListhDisponivel;
            }
            catch
            {
                return null;
            }
        }
    }}