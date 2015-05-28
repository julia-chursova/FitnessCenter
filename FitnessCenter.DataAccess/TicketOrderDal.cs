using FitnessCenter.Entities;
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

        public static void InsertTicketOrder(TicketOrder ticketOrder)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "InsertTicketOrder";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Direction = ParameterDirection.Output, SqlDbType = SqlDbType.Int });

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@TicketId", Value = ticketOrder.TicketId });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@ActivationDate", Value = ticketOrder.ActivationDate });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@OrderDate", Value = ticketOrder.OrderDate });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@ManagerId", Value = ticketOrder.ManagerId });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@ClientId", Value = ticketOrder.ClientId });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();
        }

        public static void UpdateTicketOrder(TicketOrder ticketOrder)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "UpdateTicketOrder";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = ticketOrder.Id });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@TicketId", Value = ticketOrder.TicketId });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@ActivationDate", Value = ticketOrder.ActivationDate });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@OrderDate", Value = ticketOrder.OrderDate });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@ManagerId", Value = ticketOrder.ManagerId });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@ClientId", Value = ticketOrder.ClientId });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();
        }
    }
}
