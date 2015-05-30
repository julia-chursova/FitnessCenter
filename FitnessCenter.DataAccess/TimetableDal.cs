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
    public class TimetableDal
    {
        protected static string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            }
        }

        public static List<TimetableItem> GetTimetables()
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetTimetables";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            List<TimetableItem> result = new List<TimetableItem>();

            while (reader.Read())
            {
                result.Add(new TimetableItem()
                {
                    Id = reader.GetInt32(0),
                    RoomId = reader.GetInt32(1),
                    Room = RoomDal.GetRoom(reader.GetInt32(1)),
                    ActivityId = reader.GetInt32(2),
                    Activity = ActivityDal.GetActivity(reader.GetInt32(2)),
                    EmployeeId = reader.GetInt32(3),
                    Employee = EmployeeDal.GetEmployee(reader.GetInt32(3)),
                    StartTime = reader.GetTimeSpan(4),
                    DayOfWeek = reader.GetInt32(5)
                });
            }

            return result;
        }

        public static TimetableItem GetTimetable(int id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetTimetable";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = id });

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            TimetableItem result = null;

            if (reader.Read())
            {
                result = new TimetableItem()
                {
                    Id = reader.GetInt32(0),
                    RoomId = reader.GetInt32(1),
                    Room = RoomDal.GetRoom(reader.GetInt32(1)),
                    ActivityId = reader.GetInt32(2),
                    Activity = ActivityDal.GetActivity(reader.GetInt32(2)),
                    EmployeeId = reader.GetInt32(3),
                    Employee = EmployeeDal.GetEmployee(reader.GetInt32(3)),
                    StartTime = reader.GetTimeSpan(4),
                    DayOfWeek = reader.GetInt32(5)
                };
            }

            return result;
        }

        public static void UpdateTimetable(TimetableItem timetable)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "UpdateTimetable";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = timetable.Id });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@RoomId", Value = timetable.RoomId });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@ActivityId", Value = timetable.ActivityId });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@EmployeeId", Value = timetable.EmployeeId });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@StartTime", Value = timetable.StartTime });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@DayOfWeek", Value = timetable.DayOfWeek });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();
        }

        public static void DeleteTimetable(int id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "DeleteTimetable";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = id });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();
        }

        public static void InsertTimetable(TimetableItem timetable)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "InsertTimetable";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Direction = ParameterDirection.Output, SqlDbType = SqlDbType.Int });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@RoomId", Value = timetable.RoomId });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@ActivityId", Value = timetable.ActivityId });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@EmployeeId", Value = timetable.EmployeeId });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@StartTime", Value = timetable.StartTime });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@DayOfWeek", Value = timetable.DayOfWeek });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();
        }
    }
}
