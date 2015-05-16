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
    public class RoomDal
    {
        protected static string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            }
        }

        public static List<Room> GetRooms()
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetRooms";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            List<Room> result = new List<Room>();

            while (reader.Read())
            {
                result.Add(new Room()
                {
                    ID = reader.GetInt32(0),
                    Name = reader.GetString(2),
                    Description = !reader.IsDBNull(1) ? reader.GetString(1) : String.Empty
                });
            }

            return result;
        }

        public static Room GetRoom(int id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetRoom";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = id });

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            Room result = null;

            if (reader.Read())
            {
                result = new Room()
                {
                    ID = reader.GetInt32(0),
                    Name = reader.GetString(2),
                    Description = !reader.IsDBNull(1) ? reader.GetString(1) : String.Empty
                };
            }

            return result;
        }

        public static void UpdateRoom(Room employee)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "UpdateRoom";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = employee.ID });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Name", Value = employee.Name });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Description", Value = (object)employee.Description ?? DBNull.Value });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();
        }

        public static void DeleteRoom(int id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "DeleteRoom";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = id });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();
        }

        public static void InsertRoom(Room employee)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "InsertRoom";
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
