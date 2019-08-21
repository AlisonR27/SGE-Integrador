﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebAppSGE.DAL
{
    internal class DALSport
    {
        Alternadores a = new Alternadores();
        string connectionString = "";

        internal DALSport()
        {
            connectionString = ConfigurationManager.ConnectionStrings
                      ["SGEConnectionString"].ConnectionString;
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        internal List<Modelo.Sports> SelectAll()
        {
            Modelo.Sports aSports;
            List<Modelo.Sports> aListSports = new List<Modelo.Sports>();
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from atividadeEsportiva";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aSports = new Modelo.Sports(
                        a.AlternadorI(dr["id"].ToString()),
                        dr["nome"].ToString());
                    aListSports.Add(aSports);
                }
            }
            dr.Close();
            conn.Close();
            return aListSports;
        }
        [DataObjectMethod(DataObjectMethodType.Delete)]
        internal void Delete(Modelo.Sports obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("DELETE FROM atividadeEsportiva WHERE id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.ExecuteNonQuery();

        }
        [DataObjectMethod(DataObjectMethodType.Insert)]
        internal void Insert(Modelo.Sports obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("INSERT INTO atividadeEsportiva (nome) VALUES(@nome)", conn);
            cmd.Parameters.AddWithValue("@nome", obj.nome);
            cmd.ExecuteNonQuery();
        }
        [DataObjectMethod(DataObjectMethodType.Update)]
        internal void Update(Modelo.Sports obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("UPDATE atividadeEsportiva SET nome = @nome WHERE id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.Parameters.AddWithValue("@nome", obj.nome);
            cmd.ExecuteNonQuery();
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        internal List<Modelo.Sports> Select(string id)
        {
            Modelo.Sports aSports;
            List<Modelo.Sports> aListSports = new List<Modelo.Sports>();
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from atividadeEsportiva Where id = @id";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aSports = new Modelo.Sports(a.AlternadorI(dr["id"].ToString()), dr["nome"].ToString());
                    aListSports.Add(aSports);
                }
            }
            dr.Close();
            conn.Close();
            return aListSports;
        }
    }
}

