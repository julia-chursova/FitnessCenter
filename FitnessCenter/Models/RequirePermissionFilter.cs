using FitnessCenter.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FitnessCenter.Models
{
    public class RequirePermissionFilter : IAuthorizationFilter
    {
        private readonly IAuthorizationService authorizationService;
        private readonly Roles permissions;

        public RequirePermissionFilter(IAuthorizationService authorizationService, Roles requiredRoles)
        {
            this.authorizationService = authorizationService;
            this.permissions = requiredRoles;
        }

        private IAuthorizationService CreateAuthorizationService(HttpContextBase httpContext)
        {
            return this.authorizationService ?? new FormsAuthorizationService(httpContext);
        }

        public void OnAuthorization(AuthorizationContext filterContext)
        {
            var authSvc = this.CreateAuthorizationService(filterContext.HttpContext);
            // Get the current user... you could store in session or the HttpContext if you want too. It would be set inside the FormsAuthenticationService.
            var userSession = (User)filterContext.HttpContext.Session["CurrentUser"];

            

            var success = authSvc.Authorize(userSession, this.permissions);

            if (success)
            {
                // Since authorization is performed at the action level, the authorization code runs
                // after the output caching module. In the worst case this could allow an authorized user
                // to cause the page to be cached, then an unauthorized user would later be served the
                // cached page. We work around this by telling proxies not to cache the sensitive page,
                // then we hook our custom authorization code into the caching mechanism so that we have
                // the final say on whether or not a page should be served from the cache.
                var cache = filterContext.HttpContext.Response.Cache;
                cache.SetProxyMaxAge(new TimeSpan(0));
                cache.AddValidationCallback((HttpContext context, object data, ref HttpValidationStatus validationStatus) =>
                {
                    validationStatus = this.OnCacheAuthorization(new HttpContextWrapper(context));
                }, null);
            }
            else
            {
                this.HandleUnauthorizedRequest(filterContext);
            }
        }

        private void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            // Ajax requests will return status code 500 because we don't want to return the result of the
            // redirect to the login page.
            if (filterContext.RequestContext.HttpContext.Request.IsAjaxRequest())
            {
                filterContext.Result = new HttpStatusCodeResult(500);
            }
            else
            {
                filterContext.Result = new HttpUnauthorizedResult();
            }
        }

        public HttpValidationStatus OnCacheAuthorization(HttpContextBase httpContext)
        {
            var authSvc = this.CreateAuthorizationService(httpContext);
            var userSession = (User)httpContext.Session["CurrentUser"];

            var success = authSvc.Authorize(userSession, this.permissions);

            if (success)
            {
                return HttpValidationStatus.Valid;
            }
            else
            {
                return HttpValidationStatus.IgnoreThisRequest;
            }
        }
    }
}