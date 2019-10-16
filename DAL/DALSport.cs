using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppSGE.DAL
{
    public class DALSport
    {
        string connectionString = "";

        public DALSport()
        {
            connectionString = ConfigurationManager.ConnectionStrings["nomeBDConnectionString"].ConnectionString;
        }
    }
}