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
                    Description = !reader.IsDBNull(1) ? reader.GetString(1) : String.Empty,
                    Capacity = !reader.IsDBNull(3) ? (int?)reader.GetInt32(3) : null,
                    Area = !reader.IsDBNull(4) ? (decimal?)reader.GetDecimal(4) : null
                });
            }

            sqlConnection.Close();

            foreach (var room in result)
            {
                cmd = new SqlCommand();

                cmd.CommandText = "GetRoomImages";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 600;
                cmd.Connection = sqlConnection;

                cmd.Parameters.Add(new SqlParameter() { ParameterName = "@RoomId", Value = room.ID });

                sqlConnection.Open();

                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    room.FileNames.Add(
                        new RoomFile { FileName = reader.GetString(1), Room = room });
                }

                sqlConnection.Close();
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
                    Description = !reader.IsDBNull(1) ? reader.GetString(1) : String.Empty,
                    Capacity = !reader.IsDBNull(4) ? (int?)reader.GetInt32(4) : null,
                    Area = !reader.IsDBNull(4) ? (decimal?)reader.GetDecimal(4) : null
                };
            }

            sqlConnection.Close();

            cmd = new SqlCommand();

            cmd.CommandText = "GetRoomImages";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@RoomId", Value = id });

            sqlConnection.Open();

            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                result.FileNames.Add(
                    new RoomFile { FileName = reader.GetString(1), Room = result });
            }

            sqlConnection.Close();

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
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Capacity", Value = (object)employee.Capacity ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Area", Value = (object)employee.Area ?? DBNull.Value });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();

            sqlConnection.Close();
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

            sqlConnection.Close();
        }

        public static void InsertRoom(Room room)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "InsertRoom";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            var id = new SqlParameter()
            {
                ParameterName = "@Id",
                Direction = ParameterDirection.Output,
                SqlDbType = SqlDbType.Int
            };
            cmd.Parameters.Add(id);
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Name", Value = room.Name });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Description", Value = (object)room.Description ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Capacity", Value = (object)room.Capacity ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Area", Value = (object)room.Area ?? DBNull.Value });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();

            foreach (var image in room.FileNames)
            {
                cmd = new SqlCommand();

                cmd.CommandText = "InsertRoomImage";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 600;
                cmd.Connection = sqlConnection;

                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@Id",
                    Direction = ParameterDirection.Output,
                    SqlDbType = SqlDbType.Int
                });

                cmd.Parameters.Add(new SqlParameter() { ParameterName = "@RoomId", Value = (int)id.Value });

                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@FileName",
                    Value = image.FileName
                });

                cmd.ExecuteNonQuery();
            }

            sqlConnection.Close();
        }

        public static void InsertRoomImage(string path, int roomId)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "InsertRoomImage";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter()
            {
                ParameterName = "@Id",
                Direction = ParameterDirection.Output,
                SqlDbType = SqlDbType.Int
            });

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@RoomId", Value = roomId });

            cmd.Parameters.Add(new SqlParameter()
            {
                ParameterName = "@FileName",
                Value = path
            });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();

            sqlConnection.Close();
        }

        public static void DeleteRoomImage(string path)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "DeleteRoomImage";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@FileName", Value = path });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();

            sqlConnection.Close();
        }
    }
}
