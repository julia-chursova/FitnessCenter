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
    public class EmployeePositionDal
    {
        protected static string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            }
        }

        public static List<EmployeePosition> GetPositions()
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetPositions";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            List<EmployeePosition> result = new List<EmployeePosition>();

            while (reader.Read())
            {
                result.Add(new EmployeePosition()
                {
                    Id = reader.GetInt32(0),
                    Name = reader.GetString(1)
                });
            }

            sqlConnection.Close();

            return result;
        }

        public static EmployeePosition GetPosition(int id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetPosition";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = id });

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            EmployeePosition result = null;

            if (reader.Read())
            {
                result = new EmployeePosition()
                {
                    Id = reader.GetInt32(0),
                    Name = reader.GetString(1)
                };
            }

            sqlConnection.Close();

            return result;
        }
    }
}
