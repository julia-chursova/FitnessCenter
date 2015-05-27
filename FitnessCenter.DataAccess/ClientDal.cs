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
    public class ClientDal
    {
        protected static string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            }
        }

        public static List<Client> GetClients()
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetClients";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            List<Client> result = new List<Client>();

            while (reader.Read())
            {
                result.Add(new Client()
                {
                    Id = reader.GetInt32(0),
                    Name = reader.GetString(1),
                    Surname = reader.GetString(2),
                    MiddleName = !reader.IsDBNull(3) ? reader.GetString(3) : String.Empty,
                    Password = reader.GetString(4),
                    Login = reader.GetString(5)
                });
            }

            return result;
        }

        public static Client GetClient(int id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetClient";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = id });

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            Client result = null;

            if (reader.Read())
            {
                result = new Client()
                {
                    Id = reader.GetInt32(0),
                    Name = reader.GetString(1),
                    Surname = reader.GetString(2),
                    MiddleName = !reader.IsDBNull(3) ? reader.GetString(3) : String.Empty,
                    Password = reader.GetString(4),
                    Login = reader.GetString(5)
                };
            }

            return result;
        }

        public static Client GetClientByLoginPassword(string login, string password)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetClientByLoginPassword";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Login", Value = login });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Password", Value = password });

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            Client result = null;

            if (reader.Read())
            {
                result = new Client()
                {
                    Id = reader.GetInt32(0),
                    Name = reader.GetString(1),
                    Surname = reader.GetString(2),
                    MiddleName = !reader.IsDBNull(3) ? reader.GetString(3) : String.Empty,
                    Password = reader.GetString(4),
                    Login = reader.GetString(5)
                };
            }

            return result;
        }

        public static Client GetClientByLogin(string login)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetClientByLogin";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Login", Value = login });

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            Client result = null;

            if (reader.Read())
            {
                result = new Client()
                {
                    Id = reader.GetInt32(0),
                    Name = reader.GetString(1),
                    Surname = reader.GetString(2),
                    MiddleName = !reader.IsDBNull(3) ? reader.GetString(3) : String.Empty,
                    Password = reader.GetString(4),
                    Login = reader.GetString(5)
                };
            }

            return result;
        }

        public static void InsertClient(Client client)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "InsertClient";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Direction = ParameterDirection.Output, SqlDbType = SqlDbType.Int });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Name", Value = client.Name });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Surname", Value = client.Surname});
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Middlename", Value = (object)client.MiddleName ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Password", Value = client.Password });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Login", Value = client.Login });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();
        }
    }
}
