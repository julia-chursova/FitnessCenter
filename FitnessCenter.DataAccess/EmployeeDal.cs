﻿using FitnessCenter.Entities;
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
    public class EmployeeDal
    {
        protected static string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            }
        }

        public static List<Employee> GetEmployees()
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetEmployees";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            List<Employee> result = new List<Employee>();

            while (reader.Read())
            {
                result.Add(new Employee()
                    {
                        ID = reader.GetInt32(0),
                        Name = reader.GetString(1),
                        Surname = reader.GetString(2),
                        MiddleName = !reader.IsDBNull(3) ? reader.GetString(3) : String.Empty,
                        Description = !reader.IsDBNull(4) ? reader.GetString(4) : String.Empty
                    });
            }

            return result;
        }

        public static Employee GetEmployee(int id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetEmployee";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = id });

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            Employee result = null;

            if (reader.Read())
            {
                result = new Employee()
                {
                    ID = reader.GetInt32(0),
                    Name = reader.GetString(1),
                    Surname = reader.GetString(2),
                    MiddleName = !reader.IsDBNull(3) ? reader.GetString(3) : String.Empty,
                    Description = !reader.IsDBNull(4) ? reader.GetString(4) : String.Empty
                };
            }

            return result;
        }

        public static void UpdateEmployee(Employee employee)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "UpdateEmployee";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = employee.ID });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Name", Value = employee.Name });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Surname", Value = employee.Surname });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@MiddleName", Value = (object)employee.MiddleName ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Description", Value = (object)employee.Description ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@PhotoFileName", Value = (object)employee.Description ?? DBNull.Value });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();
        }

        public static void DeleteEmployee(int id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "DeleteEmployee";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", Value = id });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();
        }

        public static void InsertEmployee(Employee employee)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "InsertEmployee";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Id", 
                Direction = ParameterDirection.Output, 
                SqlDbType = SqlDbType.Int });

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Name", Value = employee.Name });
            
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Surname", 
                Value = employee.Surname });
            
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@MiddleName", 
                Value = (object)employee.MiddleName ?? DBNull.Value });

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Description", Value = (object)employee.Description ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@PhotoFileName", Value = (object)employee.PhotoFileName ?? DBNull.Value });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();
        }
    }
}
