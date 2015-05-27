using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FitnessCenter.DataAccess
{
    public class TicketOrderDal
    {
        protected static string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            }
        }

        public static void InsertTicketOrder(int ticketId, int clientId)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "InsertTicketOrder";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Direction = ParameterDirection.Output, SqlDbType = SqlDbType.Int });

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@TicketId", Value = ticketId });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@ValidFrom", Value = DateTime.Now });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@ValidTo", Value = DateTime.Now.AddMonths(1) });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@OrderDate", Value = DateTime.Now });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@ClientId", Value = clientId });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();
        }
    }
}
