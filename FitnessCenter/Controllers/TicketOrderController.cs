using FitnessCenter.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FitnessCenter.Controllers
{
    public class TicketOrderController : Controller
    {
        // GET: TicketOrder
        public ActionResult Order(int id)
        {
            //var client = ClientDal.GetClientByLogin(HttpContext.User.Identity.Name);
            //if (client != null)
            //{
            //    TicketOrderDal.InsertTicketOrder(id, client.Id);
            //}
            return RedirectToAction("Index", "Ticket");
        }
    }
}