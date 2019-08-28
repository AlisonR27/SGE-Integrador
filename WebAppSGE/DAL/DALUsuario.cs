using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebAppSGE.DAL
{
    public class DALUsuario
    {
            string connectionString = "";

            public DALUsuario()
            {
                connectionString = ConfigurationManager.ConnectionStrings["SGEConnectionString"].ConnectionString;
            }
            [DataObjectMethod(DataObjectMethodType.Select)]
            public List<Modelo.Usuario> SelectAll()
            {
                Modelo.Usuario aUsuario;
                List<Modelo.Usuario> aListUsuario = new List<Modelo.Usuario>();
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "Select * from usuario";
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        aUsuario = new Modelo.Usuario(
                            dr["senha"].ToString(),
                            Alternadores.AlternadorI(dr["tipo_Usuario"].ToString()),
                            dr["nome"].ToString(),
                            dr["email"].ToString(),
                            dr["email"].ToString(),
                            dr["telefone"].ToString()
                        );
                        aListUsuario.Add(aUsuario);
                    }
                }
                dr.Close();
                conn.Close();
                return aListUsuario;
            }
            [DataObjectMethod(DataObjectMethodType.Delete)]
            public void Delete(Modelo.Usuario obj)
            {
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand com = conn.CreateCommand();
                SqlCommand cmd = new SqlCommand("DELETE FROM usuario WHERE id = @id", conn);
                cmd.Parameters.AddWithValue("@id", obj.id);
                cmd.ExecuteNonQuery();

            }
            [DataObjectMethod(DataObjectMethodType.Insert)]
            public bool Insert(Modelo.Usuario obj)
            {
            try { 
                    SqlConnection conn = new SqlConnection(connectionString);
                    conn.Open();
                    SqlCommand com = conn.CreateCommand();
                    SqlCommand cmd = new SqlCommand("INSERT INTO Usuario (senha,tipo_Usuario,nome,foto,email,telefones) VALUES(@senha,@tipo_Usuario,@nome,@foto,@email,@telefone)", conn);
                    cmd.Parameters.AddWithValue("@senha", obj.senha);
                    cmd.Parameters.AddWithValue("@tipo_Usuario", obj.tipo);
                    cmd.Parameters.AddWithValue("@nome", obj.nome);
                    cmd.Parameters.AddWithValue("@foto", obj.fotoURL);
                    cmd.Parameters.AddWithValue("@email", obj.email);
                    cmd.Parameters.AddWithValue("@telefone", obj.telefone);
                    cmd.ExecuteNonQuery();
                    return true;
            }
            catch
            {
                return false;
            }
            }
            [DataObjectMethod(DataObjectMethodType.Update)]
            public void Update(Modelo.Usuario obj)
            {
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand com = conn.CreateCommand();
                SqlCommand cmd = new SqlCommand("UPDATE Usuario SET senha = @senha, tipo_Usuario = @tipo_Usuario, nome = @nome, foto = @foto, email = @email, telefone = @telefone WHERE id = @id", conn);
                cmd.Parameters.AddWithValue("@senha", obj.senha);
                cmd.Parameters.AddWithValue("@tipo_Usuario", obj.tipo);
                cmd.Parameters.AddWithValue("@nome", obj.nome);
                cmd.Parameters.AddWithValue("@foto", obj.fotoURL);
                cmd.Parameters.AddWithValue("@email", obj.email);
                cmd.Parameters.AddWithValue("@telefone", obj.telefone);

                cmd.ExecuteNonQuery();
            }
            [DataObjectMethod(DataObjectMethodType.Select)]
            public List<Modelo.Usuario> Select(string id)
            {
                Modelo.Usuario aUsuario;
                List<Modelo.Usuario> aListUsuario = new List<Modelo.Usuario>();
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "Select * from Usuario Where id = @id";
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        aUsuario = new Modelo.Usuario(dr["senha"].ToString(), Alternadores.AlternadorI(dr["tipo_Usuario"].ToString()), dr["nome"].ToString(), dr["email"].ToString(), dr["telefones"].ToString());
                        aListUsuario.Add(aUsuario);
                    }
                }
                else { return null; }
                dr.Close();
                conn.Close();
                return aListUsuario;
            }
        public static int Identity()
        {
            int i = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SGEConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"select top(1) id from usuario
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
            return i+1;
        }
    }
    }