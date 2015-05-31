using FitnessCenter.DataAccess;
using FitnessCenter.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace FitnessCenter.Models
{
    public static class HtmlHelpers
    {
        public static bool SecurityTrim<TModel>(this HtmlHelper<TModel> source, Roles requiredRoles)
        {
            var authorizationService = new FormsAuthorizationService();
            var user = UserDal.GetUser(HttpContext.Current.User.Identity.Name);
            return HttpContext.Current.User.Identity.IsAuthenticated && authorizationService.Authorize(user, requiredRoles);
        }

        public static bool SecurityTrim(Roles requiredRoles)
        {
            var authorizationService = new FormsAuthorizationService();
            var user = UserDal.GetUser(HttpContext.Current.User.Identity.Name);
            return HttpContext.Current.User.Identity.IsAuthenticated && authorizationService.Authorize(user, requiredRoles);
        }

        public static MvcHtmlString MyActonLink(
        this HtmlHelper html,
        string linkText,
        string action,
        string controller,
        object routeValues,
        object htmlAttributes
    )
        {
            var urlHelper = new UrlHelper(html.ViewContext.RequestContext);
            var url = urlHelper.Action(action, controller, routeValues);
            var anchor = new TagBuilder("a");
            anchor.InnerHtml = linkText;
            anchor.Attributes["href"] = url;
            anchor.MergeAttributes(new RouteValueDictionary(htmlAttributes));
            return MvcHtmlString.Create(anchor.ToString());
        }
    }
}