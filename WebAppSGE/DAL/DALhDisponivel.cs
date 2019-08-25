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
                        Alternadores.AlternadorI(dr["id"].ToString()),
                        Alternadores.AlternadorI(dr["dia_semana"].ToString()),
                        dr["hora_inicio"].ToString(),
                        dr["hora_fim"].ToString(),
                        Alternadores.AlternadorI(dr["id_AreaPoliesportiva"].ToString())
                        );
                    aListAreas.Add(aArea);
                }
            }
            dr.Close();
            conn.Close();

            return aListAreas;
        }
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.hDisponivel obj)
        {
            SqlConnection conn = new SqlConnection(connectionstring);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("INSERT INTO horario_Disponivel (id,dia_semana,hora_inicio,hora_fim,id_AreaPoliesportiva) VALUES(@id,@dia,@hinit,@hfim,@idArea)", conn);
            cmd.Parameters.AddWithValue("@id", obj.id); cmd.Parameters.AddWithValue("@dia", obj.diaSemana); cmd.Parameters.AddWithValue("@hinit", obj.horaInicio); cmd.Parameters.AddWithValue("@hfim", obj.horaFim); cmd.Parameters.AddWithValue("@idArea", obj.idAreaEsportiva);

            cmd.ExecuteNonQuery();

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
    }
}