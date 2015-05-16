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
    public class ActivityDal
    {
        protected static string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            }
        }

        public static List<Activity> GetActivities()
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetActivities";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            List<Activity> result = new List<Activity>();

            while (reader.Read())
            {
                result.Add(new Activity()
                {
                    ID = reader.GetInt32(0),
                    Name = reader.GetString(1),
                    Description = !reader.IsDBNull(2) ? reader.GetString(2) : String.Empty
                });
            }

            return result;
        }

        public static Activity GetActivity(int id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetActivity";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = id });

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            Activity result = null;

            if (reader.Read())
            {
                result = new Activity()
                {
                    ID = reader.GetInt32(0),
                    Name = reader.GetString(1),
                    Description = !reader.IsDBNull(2) ? reader.GetString(2) : String.Empty
                };
            }

            return result;
        }

        public static void UpdateActivity(Activity employee)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "UpdateActivity";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = employee.ID });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Name", Value = employee.Name });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Description", Value = (object)employee.Description ?? DBNull.Value });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();
        }

        public static void DeleteActivity(int id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "DeleteActivity";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = id });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();
        }

        public static void InsertActivity(Activity employee)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "InsertActivity";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Direction = ParameterDirection.Output, SqlDbType = SqlDbType.Int });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Name", Value = employee.Name });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Description", Value = (object)employee.Description ?? DBNull.Value });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();
        }
    }
}
