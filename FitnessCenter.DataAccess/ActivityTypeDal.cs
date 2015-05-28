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
    public class ActivityTypeDal
    {
        protected static string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            }
        }

        public static List<ActivityType> GetActivityTypes()
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetActivityTypes";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            List<ActivityType> result = new List<ActivityType>();

            while (reader.Read())
            {
                result.Add(new ActivityType()
                {
                    Id = reader.GetInt32(0),
                    Name = reader.GetString(1),
                    Description = !reader.IsDBNull(2) ? reader.GetString(2) : String.Empty
                });
            }

            return result;
        }

        public static ActivityType GetActivityType(int id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetActivityType";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = id });

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            ActivityType result = null;

            if (reader.Read())
            {
                result = new ActivityType()
                {
                    Id = reader.GetInt32(0),
                    Name = reader.GetString(1),
                    Description = !reader.IsDBNull(2) ? reader.GetString(2) : String.Empty
                };
            }

            return result;
        }

        public static void UpdateActivityType(ActivityType activityType)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "UpdateActivityType";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = activityType.Id });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Name", Value = activityType.Name });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Description", Value = (object)activityType.Description ?? DBNull.Value });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();
        }

        public static void DeleteActivityType(int id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "DeleteActivityType";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = id });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();
        }

        public static int InsertActivityType(ActivityType activityType)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "InsertActivityType";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            var id = new SqlParameter() { ParameterName = "@Id", Direction = ParameterDirection.Output, SqlDbType = SqlDbType.Int };

            cmd.Parameters.Add(id);
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Name", Value = activityType.Name });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Description", Value = (object)activityType.Description ?? DBNull.Value });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();

            return (int)id.Value;
        }
    }
}
