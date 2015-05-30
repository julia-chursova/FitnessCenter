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
    public class DiscountDal
    {
        protected static string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            }
        }

        public static List<Discount> GetDiscounts()
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetDiscounts";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            List<Discount> result = new List<Discount>();

            while (reader.Read())
            {
                result.Add(new Discount()
                {
                    Id = reader.GetInt32(0),
                    TicketId = reader.GetInt32(1),
                    Ticket = TicketDal.GetTicket(reader.GetInt32(1)),
                    Value = reader.GetInt32(2),
                    StartDate = reader.GetDateTime(3),
                    EndDate = reader.GetDateTime(4)
                });
            }

            sqlConnection.Close();

            return result;
        }

        public static Discount GetDiscount(int id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetDiscount";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = id });

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            Discount result = null;

            if (reader.Read())
            {
                result = new Discount()
                {
                    Id = reader.GetInt32(0),
                    TicketId = reader.GetInt32(1),
                    Ticket = TicketDal.GetTicket(reader.GetInt32(1)),
                    Value = reader.GetInt32(2),
                    StartDate = reader.GetDateTime(3),
                    EndDate = reader.GetDateTime(4)
                };
            }

            sqlConnection.Close();

            return result;
        }

        public static void UpdateDiscount(Discount discount)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "UpdateDiscount";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = discount.Id });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@TicketId", Value = discount.TicketId });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Value", Value = discount.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@StartDate", Value = discount.StartDate });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@EndDate", Value = discount.EndDate });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();

            sqlConnection.Close();
        }

        public static void DeleteDiscount(int id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "DeleteDiscount";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = id });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();

            sqlConnection.Close();
        }

        public static void InsertDiscount(Discount discount)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "InsertDiscount";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Direction = ParameterDirection.Output, SqlDbType = SqlDbType.Int });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@TicketId", Value = discount.TicketId });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Value", Value = discount.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@StartDate", Value = discount.StartDate });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@EndDate", Value = discount.EndDate });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();

            sqlConnection.Close();
        }
    }
}
