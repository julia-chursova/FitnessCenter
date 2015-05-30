using FitnessCenter.DataAccess;
using FitnessCenter.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FitnessCenter.Controllers
{
    public class DiscountController : Controller
    {
        // GET: Discount
        public ActionResult Index()
        {
            var discounts = DiscountDal.GetDiscounts();
            return View(discounts);
        }

        // GET: Discount/Details/5
        public ActionResult Details(int id)
        {
            var discount = DiscountDal.GetDiscount(id);
            return View(discount);
        }

        // GET: Discount/Create
        public ActionResult Create()
        {
            ViewBag.TicketId = new SelectList(TicketDal.GetTickets(), "Id", "Name");
            return View(new Discount());
        }

        // POST: Discount/Create
        [HttpPost]
        public ActionResult Create(Discount model)
        {
            if (ModelState.IsValid)
            {
                DiscountDal.InsertDiscount(model);
                return RedirectToAction("Index");
            }
            ViewBag.TicketId = new SelectList(TicketDal.GetTickets(), "Id", "Name");
            return View(model);
        }

        // GET: Discount/Edit/5
        public ActionResult Edit(int id)
        {
            var discount = DiscountDal.GetDiscount(id);
            var tickets = TicketDal.GetTickets();
            ViewBag.TicketId = new SelectList(tickets, "Id", "Name", tickets.FirstOrDefault(t => t.Id == discount.TicketId));
            return View(discount);
        }

        // POST: Discount/Edit/5
        [HttpPost]
        public ActionResult Edit(Discount model)
        {
            if (ModelState.IsValid)
            {
                DiscountDal.UpdateDiscount(model);
                return RedirectToAction("Index");
            }
            var tickets = TicketDal.GetTickets();
            ViewBag.TicketId = new SelectList(tickets, "Id", "Name", tickets.FirstOrDefault(t => t.Id == model.TicketId));
            return View(model);
        }

        // GET: Discount/Delete/5
        public ActionResult Delete(int id)
        {
            var discount = DiscountDal.GetDiscount(id);
            return View(discount);
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            DiscountDal.DeleteDiscount(id);
            return RedirectToAction("Index");
        }
    }
}
