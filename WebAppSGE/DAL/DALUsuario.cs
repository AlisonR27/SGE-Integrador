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
        internal class DALSport
        {
            string connectionString = "";

            internal DALSport()
            {
                connectionString = ConfigurationManager.ConnectionStrings
                          ["SGEConnectionString"].ConnectionString;
            }
            [DataObjectMethod(DataObjectMethodType.Select)]
            internal List<Modelo.Usuario> SelectAll()
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
                            Alternadores.AlternadorI(dr["id"].ToString()),
                            dr["senha"].ToString(),
                            Alternadores.AlternadorI(dr["tipo_Usuario"].ToString()),
                            dr["nome"].ToString(),
                            (byte[])dr["foto"],
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
            internal void Delete(Modelo.Usuario obj)
            {
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand com = conn.CreateCommand();
                SqlCommand cmd = new SqlCommand("DELETE FROM usuario WHERE id = @id", conn);
                cmd.Parameters.AddWithValue("@id", obj.id);
                cmd.ExecuteNonQuery();

            }
            [DataObjectMethod(DataObjectMethodType.Insert)]
            internal void Insert(Modelo.Usuario obj)
            {
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand com = conn.CreateCommand();
                SqlCommand cmd = new SqlCommand("INSERT INTO usuario (senha,tipo_Usuario,nome,foto,email,telefone) VALUES(@senha,@tipo_Usuario,@nome,@foto,@email,@telefone)", conn);
                cmd.Parameters.AddWithValue("@senha", obj.senha);
                cmd.Parameters.AddWithValue("@tipo_Usuario", obj.tipo);
                cmd.Parameters.AddWithValue("@nome", obj.nome);
                cmd.Parameters.AddWithValue("@foto", obj.foto);
                cmd.Parameters.AddWithValue("@email", obj.email);
                cmd.Parameters.AddWithValue("@telefone", obj.telefone);
                cmd.ExecuteNonQuery();
            }
            [DataObjectMethod(DataObjectMethodType.Update)]
            internal void Update(Modelo.Usuario obj)
            {
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand com = conn.CreateCommand();
                SqlCommand cmd = new SqlCommand("UPDATE atividadeEsportiva SET senha = @senha, tipo_Usuario = @tipo_Usuario, nome = @nome, foto = @foto, email = @email, telefone = @telefone WHERE id = @id", conn);
                cmd.Parameters.AddWithValue("@senha", obj.senha);
                cmd.Parameters.AddWithValue("@tipo_Usuario", obj.tipo);
                cmd.Parameters.AddWithValue("@nome", obj.nome);
                cmd.Parameters.AddWithValue("@foto", obj.foto);
                cmd.Parameters.AddWithValue("@email", obj.email);
                cmd.Parameters.AddWithValue("@telefone", obj.telefone);

                cmd.ExecuteNonQuery();
            }
            [DataObjectMethod(DataObjectMethodType.Select)]
            internal List<Modelo.Usuario> Select(string id)
            {
                Modelo.Usuario aUsuario;
                List<Modelo.Usuario> aListUsuario = new List<Modelo.Usuario>();
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "Select * from usuario Where id = @id";
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        aUsuario = new Modelo.Usuario(Alternadores.AlternadorI(dr["id"].ToString()), dr["senha"].ToString(), Alternadores.AlternadorI(dr["tipo_Usuario"].ToString()), dr["nome"].ToString(), (byte[])dr["foto"], dr["email"].ToString(), dr["telefone"].ToString());
                        aListUsuario.Add(aUsuario);
                    }
                }
                dr.Close();
                conn.Close();
                return aListUsuario;
            }
        }
    }
}
