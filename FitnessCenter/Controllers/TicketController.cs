using FitnessCenter.DataAccess;
using FitnessCenter.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FitnessCenter.Controllers
{
    public class TicketController : Controller
    {
        // GET: Ticket
        public ActionResult Index()
        {
            return View(TicketDal.GetTickets());
        }

        // GET: Ticket/Details/5
        public ActionResult Details(int id)
        {
            return View(TicketDal.GetTicket(id));
        }

        // GET: Ticket/Create
        public ActionResult Create()
        {
            ViewBag.ActivityTypeId = new SelectList(ActivityTypeDal.GetActivityTypes(), "Id", "Name");
            return View(new Ticket());
        }

        // POST: Ticket/Create
        [HttpPost]
        public ActionResult Create(Ticket model)
        {
            if (ModelState.IsValid)
            {
                TicketDal.InsertTicket(model);
                return RedirectToAction("Index");
            }
            ViewBag.ActivityTypeId = new SelectList(ActivityTypeDal.GetActivityTypes(), "Id", "Name");
            return View(model);
        }

        // GET: Ticket/Edit/5
        public ActionResult Edit(int id)
        {
            var model = TicketDal.GetTicket(id);
            var activities = ActivityTypeDal.GetActivityTypes();
            ViewBag.ActivityTypeId = new SelectList(activities, "Id", "Name", activities.FirstOrDefault(a => a.Id == model.ActivityType.Id));
            return View(model);
        }

        // POST: Ticket/Edit/5
        [HttpPost]
        public ActionResult Edit(Ticket model)
        {
            if (ModelState.IsValid)
            {
                TicketDal.UpdateTicket(model);
                return RedirectToAction("Index");
            }
            ViewBag.ActivityTypeId = new SelectList(ActivityTypeDal.GetActivityTypes(), "Id", "Name", model.ActivityType.Id);
            return View(model);
        }

        // GET: Ticket/Delete/5
        public ActionResult Delete(int id)
        {
            return View(TicketDal.GetTicket(id));
        }

        // POST: Ticket/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            TicketDal.DeleteTicket(id);
            return RedirectToAction("Index");
        }
    }
}
