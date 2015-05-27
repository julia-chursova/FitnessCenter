using FitnessCenter.DataAccess;
using FitnessCenter.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FitnessCenter.Models
{
    public static class HtmlHelpers
    {
        public static bool SecurityTrim<TModel>(this HtmlHelper<TModel> source, Roles requiredRoles)
        {
            var authorizationService = new FormsAuthorizationService();
            var user = (User)HttpContext.Current.Session["CurrentUser"];
            return authorizationService.Authorize(user, requiredRoles);
        }

        public static bool SecurityTrim(Roles requiredRoles)
        {
            var authorizationService = new FormsAuthorizationService();
            var user = UserDal.GetUser(HttpContext.Current.User.Identity.Name);
            return HttpContext.Current.User.Identity.IsAuthenticated && authorizationService.Authorize(user, requiredRoles);
        }
    }
}