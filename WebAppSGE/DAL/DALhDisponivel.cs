using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebAppSGE.DAL
{
    internal class DALhDisponivel
    {
        string connectionstring = "";
        internal DALhDisponivel()
        {
            connectionstring = ConfigurationManager.ConnectionStrings["SGEConnectionString"].ConnectionString;
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        internal List<Modelo.hDisponivel> SelectAll()
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
                        AlternadorI(dr["id"].ToString()),
                        int.Parse(dr["dia_semana"].ToString()),
                        dr["hora_inicio"].ToString(),
                        dr["hora_fim"].ToString(),
                        AlternadorI(dr["id_AreaPoliesportiva"].ToString())
                        );
                    aListAreas.Add(aArea);
                }
            }
            dr.Close();
            conn.Close();

            return aListAreas;
        }
        [DataObjectMethod(DataObjectMethodType.Insert)]
        internal void Insert(Modelo.hDisponivel obj)
        {
            SqlConnection conn = new SqlConnection(connectionstring);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("INSERT INTO horario_Disponivel (id,dia_semana,hora_inicio,hora_fim,id_AreaPoliesportiva) VALUES(@id,@dia,@hinit,@hfim,@idArea)", conn);
            cmd.Parameters.AddWithValue("@id", obj.id); cmd.Parameters.AddWithValue("@dia", obj.diaSemana); cmd.Parameters.AddWithValue("@hinit", obj.horaInicio); cmd.Parameters.AddWithValue("@hfim", obj.horaFim); cmd.Parameters.AddWithValue("@idArea", obj.idAreaEsportiva);

            cmd.ExecuteNonQuery();

        }
        [DataObjectMethod(DataObjectMethodType.Delete)]
        internal void Delete(Modelo.hDisponivel obj)
        {
            SqlConnection conn = new SqlConnection(connectionstring);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("DELETE FROM horario_Disponivel WHERE ID = @id", conn);
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