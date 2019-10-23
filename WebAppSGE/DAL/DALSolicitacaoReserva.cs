using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data.SqlTypes;

namespace WebAppSGE.DAL
{
    public class DALSolicitacaoReserva
    {
        string connectionstring = "";
        static string mascaraSQL = "yyyy-MM-dd";
        public DALSolicitacaoReserva()
        {
            connectionstring = ConfigurationManager.ConnectionStrings["SGEConnectionString"].ConnectionString;
        }
        //Select para o administrador Somente
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
                        Alternadores.AlternadorI(dr["id"].ToString()),
                        Alternadores.AlternadorDT(dr["hor_Solicitacao"].ToString()),
                        Alternadores.AlternadorI(dr["status"].ToString()),
                        dr["atividades_Realizadas"].ToString(),
                        dr["motivo_Solicitacao"].ToString(),
                        dr["motivo_indeferimento"].ToString(),
                        Alternadores.AlternadorDT(dr["Data_ini"].ToString()),
                        Alternadores.AlternadorDT(dr["Data_fim"].ToString()),
                        Alternadores.AlternadorI(dr["id_Usuario_Solicitante"].ToString()),
                        0,
                        Alternadores.AlternadorI(dr["id_Area_esportiva"].ToString())
                        );
                    aListSolicitacaoReserva.Add(aSolicitacaoReserva);
                }
            }
            dr.Close();
            conn.Close();

            return aListSolicitacaoReserva;
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.SolicitacaoReserva> SelectYours(int id)
        {
            Modelo.SolicitacaoReserva aSolicitacaoReserva;
            List<Modelo.SolicitacaoReserva> aListSolicitacaoReserva = new List<Modelo.SolicitacaoReserva>();
            SqlConnection conn = new SqlConnection(connectionstring);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from solicitacao_Reserva where id_Usuario_Solicitante = @id";cmd.Parameters.AddWithValue("@id",id);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {

                while (dr.Read())
                {
                    if (dr["hor_solicitacao"] == DBNull.Value)
                    {
                        //throw new SqlNullValueException();
                    }
                    else { 
                    aSolicitacaoReserva = new Modelo.SolicitacaoReserva(
                        Alternadores.AlternadorI(dr["id"].ToString()),
                        Convert.ToDateTime(dr["hor_Solicitacao"].ToString()),
                        Alternadores.AlternadorI(dr["status"].ToString()),
                        dr["atividades_Realizadas"].ToString(),
                        dr["motivo_Solicitacao"].ToString(),
                        null,
                        Alternadores.AlternadorDT(dr["Data_ini"].ToString()),
                        Alternadores.AlternadorDT(dr["Data_fim"].ToString()),
                        Alternadores.AlternadorI(dr["id_Usuario_Solicitante"].ToString()),
                        0,
                        Alternadores.AlternadorI(dr["id_Area_esportiva"].ToString())
                        );
                    aListSolicitacaoReserva.Add(aSolicitacaoReserva);
                    }
                }
            }
            dr.Close();
            conn.Close();

            return aListSolicitacaoReserva;
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.SolicitacaoReserva> SelectUnic(int id)
        {
            Modelo.SolicitacaoReserva aSolicitacaoReserva;
            List<Modelo.SolicitacaoReserva> aListSolicitacaoReserva = new List<Modelo.SolicitacaoReserva>();
            SqlConnection conn = new SqlConnection(connectionstring);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from solicitacao_Reserva where id = @id"; cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {

                while (dr.Read())
                {
                    if (dr["hor_solicitacao"] == DBNull.Value)
                    {
                        throw new SqlNullValueException();
                    }
                    else
                    {
                        aSolicitacaoReserva = new Modelo.SolicitacaoReserva(
                            Alternadores.AlternadorI(dr["id"].ToString()),
                            Convert.ToDateTime(dr["hor_Solicitacao"].ToString()),
                            Alternadores.AlternadorI(dr["status"].ToString()),
                            dr["atividades_Realizadas"].ToString(),
                            dr["motivo_Solicitacao"].ToString(),
                            null,
                            Alternadores.AlternadorDT(dr["Data_ini"].ToString()),
                            Alternadores.AlternadorDT(dr["Data_fim"].ToString()),
                            Alternadores.AlternadorI(dr["id_Usuario_Solicitante"].ToString()),
                            0,
                            Alternadores.AlternadorI(dr["id_Area_esportiva"].ToString()),
                            bool.Parse(dr["rep"].ToString()),
                            dr["hora_ini"].ToString(),
                            dr["hora_fim"].ToString()
                            );
                        aListSolicitacaoReserva.Add(aSolicitacaoReserva);
                    }
                }
            }
            dr.Close();
            conn.Close();

            return aListSolicitacaoReserva;
        }
        //Insert para usuário
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public bool Insert(Modelo.SolicitacaoReserva obj)
        {
            //try
            //{
                SqlConnection conn = new SqlConnection(connectionstring);
                conn.Open();
                SqlCommand com = conn.CreateCommand();
                SqlCommand cmd = new SqlCommand("INSERT INTO solicitacao_Reserva (hor_Solicitacao,atividades_Realizadas ,motivo_Solicitacao,Data_ini,Data_fim,id_Usuario_Solicitante,id_Area_Esportiva,status,rep,hora_ini,hora_fim) VALUES(@horario_Solicitacao,@atividades_Realizadas,@motivo_Solicitacao,@Data_ini,@Data_fim,@id_Usuario_Solicitante,@id_AreaPoliesportiva,0,@repeat,@hi,@hf)", conn);
                cmd.Parameters.AddWithValue("@horario_Solicitacao", SqlDateTime.Parse(obj.horario_Solicitacao.ToString("yyyy-MM-dd h:m:s.")));
                cmd.Parameters.AddWithValue("@atividades_Realizadas", obj.atividades_Realizadas);
                cmd.Parameters.AddWithValue("@motivo_Solicitacao", obj.motivo_Solicitacao);
                cmd.Parameters.AddWithValue("@Data_ini", SqlDateTime.Parse(obj.Data_ini.ToString(mascaraSQL)));
                cmd.Parameters.AddWithValue("@Data_fim", SqlDateTime.Parse(obj.Data_fim.ToString(mascaraSQL)));
                cmd.Parameters.AddWithValue("@id_Usuario_Solicitante", obj.id_Usuario_Solicitante);
                cmd.Parameters.AddWithValue("@id_AreaPoliesportiva", obj.id_AreaPoliesportiva);
                cmd.Parameters.AddWithValue("@repeat", obj.rep);
                cmd.Parameters.AddWithValue("@hi", obj.horaIni);
                cmd.Parameters.AddWithValue("@hf", obj.horaFim);
                cmd.ExecuteNonQuery();
                return true;
            //}
            //catch
            //{
            //    return false;
            //}
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
                SqlCommand cmd = new SqlCommand("UPDATE solicitacao_Reserva SET motivo_Indeferimento = @motivo_Indeferimento,Data_ini = @Data_ini,Data_fim = @Data_fim,id_Usuario_Analise = @id_Usuario_Analise, WHERE id = @id", conn);
                SqlCommand cmd2 = new SqlCommand("INSERT INTO horario_Solicitado ()");
                cmd.Parameters.AddWithValue("@id", obj.id);                                               
                cmd.Parameters.AddWithValue("@motivo_Indeferimento", obj.motivo_Indeferimento);
                cmd.Parameters.AddWithValue("@Data_ini", obj.Data_ini);
                cmd.Parameters.AddWithValue("@Data_fim", obj.Data_fim);                
                cmd.Parameters.AddWithValue("@id_Usuario_Analise", obj.id_Usuario_Analise);                
                cmd.ExecuteNonQuery();
                return true;
            }
            catch { return false; }
        }
        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Deferir(string id)
        {
                SqlConnection conn = new SqlConnection(connectionstring);
                conn.Open();
                SqlCommand com = conn.CreateCommand();
                SqlCommand cmd = new SqlCommand("UPDATE solicitacao_Reserva SET status = 1 WHERE id = @id", conn);
                cmd.Parameters.AddWithValue("@id", Alternadores.AlternadorI(id));
                cmd.ExecuteNonQuery();
        }
    }
}