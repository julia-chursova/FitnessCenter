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
    public class UserDal
    {
        protected static string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            }
        }

        public static User GetUser(string login, string password)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetUserByLoginPassword";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Login", Value = login });
            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Password", Value = password });

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            User result = null;

            if (reader.Read())
            {
                result = new User()
                {
                    Id = reader.GetInt32(0),
                    Login = reader.GetString(2),
                    Password = reader.GetString(3)
                };                
            }

            sqlConnection.Close();

            if (result != null)
            {
                cmd = new SqlCommand();

                cmd.CommandText = "GetUserRoles";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 600;
                cmd.Connection = sqlConnection;

                cmd.Parameters.Add(new SqlParameter() { ParameterName = "@UserId", Value = result.Id });

                sqlConnection.Open();

                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    result.Roles.Add(new Role()
                    {
                        Id = reader.GetInt32(0),
                        Name = reader.GetString(1)
                    });
                }
            }

            sqlConnection.Close();

            return result;
        }

        public static User GetUser(string login)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "GetUserByLogin";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 600;
            cmd.Connection = sqlConnection;

            cmd.Parameters.Add(new SqlParameter() { ParameterName = "@Login", Value = login });

            sqlConnection.Open();

            var reader = cmd.ExecuteReader();

            User result = null;

            if (reader.Read())
            {
                result = new User()
                {
                    Id = reader.GetInt32(0),
                    Login = reader.GetString(2),
                    Password = reader.GetString(3)
                };
            }

            sqlConnection.Close();

            if (result != null)
            {
                cmd = new SqlCommand();

                cmd.CommandText = "GetUserRoles";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 600;
                cmd.Connection = sqlConnection;

                cmd.Parameters.Add(new SqlParameter() { ParameterName = "@UserId", Value = result.Id });

                sqlConnection.Open();

                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    result.Roles.Add(new Role()
                    {
                        Id = reader.GetInt32(0),
                        Name = reader.GetString(1)
                    });
                }
            }

            sqlConnection.Close();

            return result;
        }
    }
}
