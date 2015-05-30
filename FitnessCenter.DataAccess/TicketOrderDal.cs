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

        public static List<TicketOrder> GetTicketOrders()
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetTicketOrders";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            List<TicketOrder> result = new List<TicketOrder>();

            while (reader.Read())
            {
                result.Add(new TicketOrder()
                {
                    Id = reader.GetInt32(0),
                    TicketId = reader.GetInt32(1),
                    Ticket = TicketDal.GetTicket(reader.GetInt32(1)),
                    ActivationDate = reader.GetDateTime(2),
                    OrderDate = reader.GetDateTime(3),
                    ClientId = reader.GetInt32(4),
                    Client = ClientDal.GetClient(reader.GetInt32(4)),
                    ManagerId = reader.GetInt32(5),
                    Manager = EmployeeDal.GetEmployee(reader.GetInt32(5))
                });
            }

            return result;
        }

        public static TicketOrder GetTicketOrder(int id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetTicketOrder";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = id });

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            TicketOrder result = null;

            if (reader.Read())
            {
                result = new TicketOrder()
                {
                    Id = reader.GetInt32(0),
                    TicketId = reader.GetInt32(1),
                    Ticket = TicketDal.GetTicket(reader.GetInt32(1)),
                    ActivationDate = reader.GetDateTime(2),
                    OrderDate = reader.GetDateTime(3),
                    ClientId = reader.GetInt32(4),
                    Client = ClientDal.GetClient(reader.GetInt32(4)),
                    ManagerId = reader.GetInt32(5),
                    Manager = EmployeeDal.GetEmployee(reader.GetInt32(5))
                };
            }

            return result;
        }

        public static void DeleteTicketOrder(int id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "DeleteTicketOrder";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = id });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();
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
