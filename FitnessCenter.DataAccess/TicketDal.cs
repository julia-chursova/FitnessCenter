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
    public class TicketDal
    {
        protected static string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            }
        }

        public static List<Ticket> GetTickets()
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetTickets";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            List<Ticket> result = new List<Ticket>();

            while (reader.Read())
            {
                result.Add(new Ticket()
                {
                    Id = reader.GetInt32(0),
                    Name = reader.GetString(1),
                    Cost = reader.GetDecimal(2),
                    AvailableFrom = !reader.IsDBNull(3) ? (TimeSpan?)reader.GetTimeSpan(3) : null,
                    AvailableTo = !reader.IsDBNull(4) ? (TimeSpan?)reader.GetTimeSpan(4) : null,
                    Duration = reader.GetInt32(5)
                });
            }

            sqlConnection.Close();

            return result;
        }

        public static Ticket GetTicket(int id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetTicket";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = id });

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            Ticket result = null;

            if (reader.Read())
            {
                result = new Ticket()
                {
                    Id = reader.GetInt32(0),
                    Name = reader.GetString(1),
                    Cost = reader.GetDecimal(2),
                    AvailableFrom = !reader.IsDBNull(3) ? (TimeSpan?)reader.GetTimeSpan(3) : null,
                    AvailableTo = !reader.IsDBNull(4) ? (TimeSpan?)reader.GetTimeSpan(4) : null,
                    Duration = reader.GetInt32(5)
                };
            }

            sqlConnection.Close();

            return result;
        }

        public static void UpdateTicket(Ticket ticket)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "UpdateTicket";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = ticket.Id });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Name", Value = ticket.Name });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Cost", Value = ticket.Cost });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@AvailableFrom", Value = (object)ticket.AvailableFrom ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@AvailableTo", Value = (object)ticket.AvailableTo ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Duration", Value = ticket.Duration });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();

            sqlConnection.Close();
        }

        public static void DeleteTicket(int id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "DeleteTicket";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = id });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();

            sqlConnection.Close();
        }

        public static void InsertTicket(Ticket ticket)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "InsertTicket";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Direction = ParameterDirection.Output, SqlDbType = SqlDbType.Int });

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Name", Value = ticket.Name });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Cost", Value = ticket.Cost });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@AvailableFrom", Value = (object)ticket.AvailableFrom ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@AvailableTo", Value = (object)ticket.AvailableTo ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Duration", Value = ticket.Duration });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();

            sqlConnection.Close();
        }
    }
}
