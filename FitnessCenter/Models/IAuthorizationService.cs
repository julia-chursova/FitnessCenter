using FitnessCenter.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FitnessCenter.Models
{
    public interface IAuthorizationService
    {
        bool Authorize(User user, Roles requiredRoles);
    }
}