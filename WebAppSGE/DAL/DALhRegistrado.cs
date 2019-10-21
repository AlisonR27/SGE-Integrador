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
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.hRegistrado> SelectDate(string data)
        {
            Modelo.hRegistrado aArea;
            List<Modelo.hRegistrado> aListAreas = new List<Modelo.hRegistrado>();
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = @"Select horSol.id as id_horarioregistrado, solRes.id as id_solicitacaoOrigem, horSol.data_registro, horSol.hora_inicio, horSol.hora_fim, solRes.id_Usuario_solicitante, solRes.id_Area_Esportiva,ArEsp.nome from horario_Solicitado horSol 
                                inner join solicitacao_Reserva solRes on horSol.id_SolicitacaoReserva = solRes.id
                                inner join Area_Esportiva ArEsp on ArEsp.id = solRes.id_Area_Esportiva 
                                where horSol.data_registro = @data order by horSol.hora_Inicio";
            cmd.Parameters.AddWithValue("@data", data);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aArea = new Modelo.hRegistrado( 
                        dr["id_horarioregistrado"].ToString(),
                        dr["data_registro"].ToString(),
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
        public static int NumberOfRows(string data)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SGEConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from horario_Solicitado where data_registro = @data";
            cmd.Parameters.AddWithValue("@data",data);
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