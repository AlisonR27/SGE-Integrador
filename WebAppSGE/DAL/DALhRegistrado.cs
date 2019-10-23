using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebAppSGE.DAL
{
    public class DALhRegistrado
    {
        public string connectionString;
        public DALhRegistrado()
        {
            connectionString = ConfigurationManager.ConnectionStrings["SGEConnectionString"].ConnectionString;

        }
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.hRegistrado obj)
        {
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand com = conn.CreateCommand();
                SqlCommand cmd = new SqlCommand("INSERT INTO horario_solicitado (data,hora_inicio,hora_fim,id_SolicitacaoReserva) VALUES(@dia,@hinit,@hfim,@idArea)", conn);
                cmd.Parameters.AddWithValue("@dia", obj.dia);
                cmd.Parameters.AddWithValue("@hinit", obj.hInicio);
                cmd.Parameters.AddWithValue("@hfim", obj.hFim);
                cmd.Parameters.AddWithValue("@idArea", obj.solId);
                cmd.ExecuteNonQuery();
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.hRegistrado> SelectDate(string data, string idArea)
        {
            Modelo.hRegistrado aArea;
            List<Modelo.hRegistrado> aListAreas = new List<Modelo.hRegistrado>();
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = @"Select horSol.id as id_horarioregistrado, solRes.id as id_solicitacaoOrigem, horSol.data, horSol.hora_inicio, horSol.hora_fim, solRes.id_Usuario_solicitante, solRes.id_Area_Esportiva,ArEsp.nome from horario_Solicitado horSol 
                                inner join solicitacao_Reserva solRes on horSol.id_SolicitacaoReserva = solRes.id
                                inner join Area_Esportiva ArEsp on ArEsp.id = solRes.id_Area_Esportiva 
                                where horSol.data = @data and solRes.id_Area_Esportiva = @idArea order by horSol.hora_Inicio";
            cmd.Parameters.AddWithValue("@data", data);
            cmd.Parameters.AddWithValue("@idArea", idArea);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aArea = new Modelo.hRegistrado( 
                        dr["id_horarioregistrado"].ToString(),
                        dr["data"].ToString(),
                        dr["hora_inicio"].ToString(),
                        dr["hora_fim"].ToString(),
                        dr["id_solicitacaoOrigem"].ToString(),
                        dr["id_Usuario_solicitante"].ToString(),
                        dr["id_Area_Esportiva"].ToString(),
                        dr["nome"].ToString()
                    );
                    aListAreas.Add(aArea);
                }
            }
            dr.Close();
            conn.Close();

            return aListAreas;
        }
        public static int NumberOfRows(string data,string idArea)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SGEConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = @"select * from horario_Solicitado hs
                                inner join solicitacao_Reserva sr on sr.id = hs.id_SolicitacaoReserva
                                where hs.data = @data and sr.id_Area_Esportiva = @idArea";
            cmd.Parameters.AddWithValue("@data",data);
            cmd.Parameters.AddWithValue("@idArea",idArea);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                int count = 0;
                while (dr.Read())
                {
                    count++;
                }
                if (count > 0)
                {
                    dr.Close();
                    conn.Close();
                    return count;
                }
                else { throw new Exception(); }
            }
            else {
                dr.Close();
                conn.Close();
                return -1;
            }
        }
    }
}