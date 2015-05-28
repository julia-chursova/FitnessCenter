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
                var client = new Client()
                {
                    Id = reader.GetInt32(0),
                    Name = reader.GetString(1),
                    Surname = reader.GetString(2),
                    MiddleName = !reader.IsDBNull(3) ? reader.GetString(3) : String.Empty,
                    BirthdayDate = !reader.IsDBNull(4) ? (DateTime?)reader.GetDateTime(4) : null,
                    Address = !reader.IsDBNull(5) ? reader.GetString(5) : String.Empty,
                    Phone = !reader.IsDBNull(6) ? reader.GetString(6) : String.Empty
                };

                if (!reader.IsDBNull(7))
                {
                    if (reader.GetBoolean(7))
                    {
                        client.Gender = Genders.Female;
                    }
                    else
                    {
                        client.Gender = Genders.Male;
                    }
                }

                sqlConnection.Close();

                result.Add(client);
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
                    BirthdayDate = !reader.IsDBNull(4) ? (DateTime?)reader.GetDateTime(4) : null,
                    Address = !reader.IsDBNull(5) ? reader.GetString(5) : String.Empty,
                    Phone = !reader.IsDBNull(6) ? reader.GetString(6) : String.Empty
                };

                if (!reader.IsDBNull(7))
                {
                    if (reader.GetBoolean(7))
                    {
                        result.Gender = Genders.Female;
                    }
                    else
                    {
                        result.Gender = Genders.Male;
                    }
                }
            }

            sqlConnection.Close();

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

            object gender;

            if (client.Gender == null)
            {
                gender = DBNull.Value;
            }
            else
            {
                gender = client.Gender == Genders.Female;
            }

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Direction = ParameterDirection.Output, SqlDbType = SqlDbType.Int });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Name", Value = client.Name });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Surname", Value = client.Surname});
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Middlename", Value = (object)client.MiddleName ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@BirthdayDate", Value = (object)client.BirthdayDate ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Address", Value = (object)client.Address ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Phone", Value = (object)client.Phone ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Gender", Value = gender });
            

            sqlConnection.Open();

            cmd.ExecuteNonQuery();

            sqlConnection.Close();
        }

        public static void UpdateClient(Client client)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "UpdateClient";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            object gender;

            if (client.Gender == null)
            {
                gender = DBNull.Value;
            }
            else
            {
                gender = client.Gender == Genders.Female;
            }

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = client.Id });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Name", Value = client.Name });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Surname", Value = client.Surname });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Middlename", Value = (object)client.MiddleName ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@BirthdayDate", Value = (object)client.BirthdayDate ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Address", Value = (object)client.Address ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Phone", Value = (object)client.Phone ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Gender", Value = gender });


            sqlConnection.Open();

            cmd.ExecuteNonQuery();

            sqlConnection.Close();
        }

        public static void DeleteClient(int id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "DeleteClient";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = id });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();
        }
    }
}
