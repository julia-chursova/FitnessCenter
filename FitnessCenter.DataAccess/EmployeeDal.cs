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
                        Description = !reader.IsDBNull(4) ? reader.GetString(4) : String.Empty,
                        Salary = !reader.IsDBNull(5) ? (decimal?)reader.GetDecimal(5) : null,
                        PositionId = reader.GetInt32(6),
                        Position = EmployeePositionDal.GetPosition(reader.GetInt32(6)),
                        Address = !reader.IsDBNull(7) ? reader.GetString(7) : String.Empty,
                        Phone = !reader.IsDBNull(8) ? reader.GetString(8) : String.Empty,
                        BirthdayDate = !reader.IsDBNull(9) ? (DateTime?)reader.GetDateTime(9) : null,
                        AcceptanceDate = reader.GetDateTime(10),
                        LeaveDate = !reader.IsDBNull(11) ? (DateTime?)reader.GetDateTime(11) : null,
                        Education = !reader.IsDBNull(12) ? reader.GetString(12) : String.Empty
                    });
            }

            sqlConnection.Close();

            foreach (var employee in result)
            {
                cmd = new SqlCommand();

                cmd.CommandText = "GetEmployeeImages";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 600;
                cmd.Connection = sqlConnection;

                cmd.Parameters.Add(new SqlParameter() { ParameterName = "@EmployeeId", Value = employee.ID });

                sqlConnection.Open();

                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    employee.FileNames.Add(
                        new EmployeeFile { FileName = reader.GetString(2), Employee = employee });
                }

                sqlConnection.Close();
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
                    Description = !reader.IsDBNull(4) ? reader.GetString(4) : String.Empty,
                    Salary = !reader.IsDBNull(5) ? (decimal?)reader.GetDecimal(5) : null,
                    PositionId = reader.GetInt32(6),
                    Position = EmployeePositionDal.GetPosition(reader.GetInt32(6)),
                    Address = !reader.IsDBNull(7) ? reader.GetString(7) : String.Empty,
                    Phone = !reader.IsDBNull(8) ? reader.GetString(8) : String.Empty,
                    BirthdayDate = !reader.IsDBNull(9) ? (DateTime?)reader.GetDateTime(9) : null,
                    AcceptanceDate = reader.GetDateTime(10),
                    LeaveDate = !reader.IsDBNull(11) ? (DateTime?)reader.GetDateTime(11) : null,
                    Education = !reader.IsDBNull(12) ? reader.GetString(12) : String.Empty
                };
            }

            sqlConnection.Close();

            cmd = new SqlCommand();

            cmd.CommandText = "GetEmployeeImages";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@EmployeeId", Value = id });

            sqlConnection.Open();

            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                result.FileNames.Add(
                    new EmployeeFile { FileName = reader.GetString(2), Employee = result });
            }

            sqlConnection.Close();

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
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Salary", Value = (object)employee.Salary ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@PositionId", Value = employee.PositionId });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Address", Value = (object)employee.Address ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Phone", Value = (object)employee.Phone ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@BirthdayDate", Value = (object)employee.BirthdayDate ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@AcceptanceDate", Value = employee.AcceptanceDate });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@LeaveDate", Value = (object)employee.LeaveDate ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Education", Value = (object)employee.Education ?? DBNull.Value });
                       
            sqlConnection.Open();

            cmd.ExecuteNonQuery();

            sqlConnection.Close();
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

            sqlConnection.Close();
        }

        public static void InsertEmployee(Employee employee)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "InsertEmployee";
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

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Name", Value = employee.Name });
            
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Surname", 
                Value = employee.Surname });
            
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@MiddleName", 
                Value = (object)employee.MiddleName ?? DBNull.Value });

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Description", Value = (object)employee.Description ?? DBNull.Value });

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Salary", Value = (object)employee.Salary ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@PositionId", Value = employee.PositionId });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Address", Value = (object)employee.Address ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Phone", Value = (object)employee.Phone ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@BirthdayDate", Value = (object)employee.BirthdayDate ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@AcceptanceDate", Value = employee.AcceptanceDate });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@LeaveDate", Value = (object)employee.LeaveDate ?? DBNull.Value });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Education", Value = (object)employee.Education ?? DBNull.Value });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();

            foreach (var image in employee.FileNames)
            {
                cmd = new SqlCommand();

                cmd.CommandText = "InsertEmployeeImage";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 600;
                cmd.Connection = sqlConnection;

                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@Id",
                    Direction = ParameterDirection.Output,
                    SqlDbType = SqlDbType.Int
                });

                cmd.Parameters.Add(new SqlParameter() { ParameterName = "@EmployeeId", Value = (int)id.Value });

                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@FileName",
                    Value = image.FileName
                });

                cmd.ExecuteNonQuery();
            }

            sqlConnection.Close();
        }

        public static void InsertEmployeeImage(string path, int employeeId)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "InsertEmployeeImage";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter()
            {
                ParameterName = "@Id",
                Direction = ParameterDirection.Output,
                SqlDbType = SqlDbType.Int
            });

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@EmployeeId", Value = employeeId });

            cmd.Parameters.Add(new SqlParameter()
            {
                ParameterName = "@FileName",
                Value = path
            });

            sqlConnection.Open();

            cmd.ExecuteNonQuery();

            sqlConnection.Close();
        }

        public static void DeleteEmployeeImage(string path)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "DeleteEmployeeImage";
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
