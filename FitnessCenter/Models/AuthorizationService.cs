using FitnessCenter.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FitnessCenter.Models
{
    public class AuthorizationService : IAuthorizationService
    {
        public bool Authorize(User userSession, Roles requiredRoles)
        {
            return userSession != null && userSession.Roles.Any(r => r.Id == (int)requiredRoles);
        }
    }
}