﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebAppSGE.DAL
{
    public class DALSolicitacaoReserva
    {
        string connectionstring = "";
        public DALSolicitacaoReserva()
        {
            connectionstring = ConfigurationManager.ConnectionStrings["SGEConnectionString"].ConnectionString;
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.SolicitacaoReserva> SelectAll()
        {
            Modelo.SolicitacaoReserva aSolicitacaoReserva;
            List<Modelo.SolicitacaoReserva> aListSolicitacaoReserva = new List<Modelo.SolicitacaoReserva>();
            SqlConnection conn = new SqlConnection(connectionstring);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from solicitacao_Reserva";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {

                while (dr.Read())
                {
                    aSolicitacaoReserva = new Modelo.SolicitacaoReserva(
                        Alternadores.AlternadorDT(dr["horario_Solicitacao"].ToString()),
                        dr["atividades_Realizadas"].ToString(),
                        dr["motivo_Solicitacao"].ToString(),
                        Alternadores.AlternadorDT(dr["Data_ini"].ToString()),
                        Alternadores.AlternadorDT(dr["Data_fim"].ToString()),
                        Alternadores.AlternadorI(dr["id_Usuario_Solicitante"].ToString()),
                        Alternadores.AlternadorI(dr["id_AreaPoliesportiva"].ToString())
                        );
                    aListSolicitacaoReserva.Add(aSolicitacaoReserva);
                }
            }
            dr.Close();
            conn.Close();

            return aListSolicitacaoReserva;
        }
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public bool Insert(Modelo.SolicitacaoReserva obj)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connectionstring);
                conn.Open();
                SqlCommand com = conn.CreateCommand();
                SqlCommand cmd = new SqlCommand("INSERT INTO solicitacao_Reserva (horario_Solicitacao,atividades_Realizadas ,motivo_Solicitacao,Data_ini,Data_fim,id_Usuario_Solicitante,id_AreaPoliesportiva) VALUES(@horario_Solicitacao,@atividades_Realizadas,@motivo_Solicitacao,@Data_ini,Data_fim,@id_Usuario_Solicitante,@id_AreaPoliesportiva)", conn);
                cmd.Parameters.AddWithValue("@horario_Solicitacao", obj.horario_Solicitacao);
                cmd.Parameters.AddWithValue("@atividades_Realizadas", obj.atividades_Realizadas);
                cmd.Parameters.AddWithValue("@motivo_Solicitacao", obj.motivo_Solicitacao);
                cmd.Parameters.AddWithValue("@Data_ini", obj.Data_ini);
                cmd.Parameters.AddWithValue("@Data_fim", obj.Data_fim);
                cmd.Parameters.AddWithValue("@id_Usuario_Solicitante", obj.id_Usuario_Solicitante);
                cmd.Parameters.AddWithValue("@id_AreaPoliesportiva", obj.id_AreaPoliesportiva);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch
            {
                return false;
            }
        }
        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Modelo.SolicitacaoReserva obj)
        {
            SqlConnection conn = new SqlConnection(connectionstring);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("DELETE FROM solicitacao_Reserva WHERE ID = @id", conn);
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
            cmd.CommandText = @"select top(1) id from solicitacao_Reserva
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
        [DataObjectMethod(DataObjectMethodType.Update)]
        public bool UpdateUsuario(Modelo.SolicitacaoReserva obj)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connectionstring);
                conn.Open();
                SqlCommand com = conn.CreateCommand();
                SqlCommand cmd = new SqlCommand("UPDATE solicitacao_Reserva SET horario_Solicitacao = @horario_Solicitacao,atividades = @atividades_Realizadas,motivo_Solicitacao = @motivo_Solicitacao,Data_ini = @Data_ini,Data_fim = @Data_fim,id_Usuario_Solicitante = @id_Usuario_Solicitante,id_AreaPoliesportiva = @id_AreaPoliesportiva, WHERE id = @id", conn);
                cmd.Parameters.AddWithValue("@id", obj.id);
                cmd.Parameters.AddWithValue("@horario_Solicitacao", obj.horario_Solicitacao);
                cmd.Parameters.AddWithValue("@atividades_Realizadas", obj.atividades_Realizadas);
                cmd.Parameters.AddWithValue("@motivo_Solicitacao", obj.motivo_Solicitacao);
                cmd.Parameters.AddWithValue("@Data_ini", obj.Data_ini);
                cmd.Parameters.AddWithValue("@Data_fim", obj.Data_fim);
                cmd.Parameters.AddWithValue("@id_Usuario_Solicitante", obj.id_Usuario_Solicitante);
                cmd.Parameters.AddWithValue("@id_AreaPoliesportiva", obj.id_AreaPoliesportiva);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch { return false; }
        }
        [DataObjectMethod(DataObjectMethodType.Update)]
        public bool UpdateAdmin(Modelo.SolicitacaoReserva obj)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connectionstring);
                conn.Open();
                SqlCommand com = conn.CreateCommand();
                SqlCommand cmd = new SqlCommand("UPDATE solicitacao_Reserva SET horario_Solicitacao = @horario_Solicitacao,atividades = @atividades_Realizadas,motivo_Solicitacao = @motivo_Solicitacao,motivo_Indeferimento = @motivo_Indeferimento,Data_ini = @Data_ini,Data_fim = @Data_fim,id_Usuario_Solicitante = @id_Usuario_Solicitante,id_Usuario_Analise = @id_Usuario_Analise,id_AreaPoliesportiva = @id_AreaPoliesportiva, WHERE id = @id", conn);
                cmd.Parameters.AddWithValue("@id", obj.id);
                cmd.Parameters.AddWithValue("@horario_Solicitacao", obj.horario_Solicitacao);
                cmd.Parameters.AddWithValue("@atividades_Realizadas", obj.atividades_Realizadas);
                cmd.Parameters.AddWithValue("@motivo_Solicitacao", obj.motivo_Solicitacao);
                cmd.Parameters.AddWithValue("@motivo_Indeferimento", obj.motivo_Indeferimento);
                cmd.Parameters.AddWithValue("@Data_ini", obj.Data_ini);
                cmd.Parameters.AddWithValue("@Data_fim", obj.Data_fim);
                cmd.Parameters.AddWithValue("@id_Usuario_Solicitante", obj.id_Usuario_Solicitante);
                cmd.Parameters.AddWithValue("@id_Usuario_Analise", obj.id_Usuario_Analise);
                cmd.Parameters.AddWithValue("@id_AreaPoliesportiva", obj.id_AreaPoliesportiva);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch { return false; }
        }

    }
}