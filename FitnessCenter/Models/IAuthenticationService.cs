using FitnessCenter.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FitnessCenter.Models
{
    public interface IAuthenticationService
    {
        bool Login(string username, string password);
        void Logout(User user);
    }
}