using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Web;


namespace WebAppSGE.DAL
{
    string connectionString = "";
    public class DALArea
    {
        connectionString = ConfigurationManager.ConnectionStrings["SGEConnectionString"].ConnectionString;
    }
}