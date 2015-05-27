using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FitnessCenter.Models
{
    public class FormsAuthorizationService : IAuthorizationService
    {
        public bool Authorize(Entities.User user, Entities.Roles requiredRoles)
        {
            return user!= null && user.Roles.Any(r => r.Id == (int)requiredRoles); 
        }

        public FormsAuthorizationService(HttpContextBase context)
        {
        }

        public FormsAuthorizationService()
        {
        }
    }
}