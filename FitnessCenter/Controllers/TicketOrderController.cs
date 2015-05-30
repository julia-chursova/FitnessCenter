using FitnessCenter.DataAccess;
using FitnessCenter.Entities;
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
        public ActionResult Index()
        {
            var ticketOrders = TicketOrderDal.GetTicketOrders();
            return View(ticketOrders);
        }

        // GET: TicketOrder/Details/5
        public ActionResult Details(int id)
        {
            var ticketOrder = TicketOrderDal.GetTicketOrder(id);
            return View(ticketOrder);
        }

        // GET: TicketOrder/Create
        public ActionResult Create()
        {
            ViewBag.TicketId = new SelectList(TicketDal.GetTickets(), "Id", "Name");
            ViewBag.ClientId = new SelectList(ClientDal.GetClients(), "Id", "FullName");
            ViewBag.ManagerId = new SelectList(EmployeeDal.GetEmployees().Where(e => e.Position.Id == 2), "Id", "FullName");
            return View(new TicketOrder());
        }

        // POST: TicketOrder/Create
        [HttpPost]
        public ActionResult Create(TicketOrder model)
        {
            if (ModelState.IsValid)
            {
                TicketOrderDal.InsertTicketOrder(model);
                return RedirectToAction("Index");
            }
            ViewBag.TicketId = new SelectList(TicketDal.GetTickets(), "Id", "Name");
            ViewBag.ClientId = new SelectList(ClientDal.GetClients(), "Id", "FullName");
            ViewBag.ManagerId = new SelectList(EmployeeDal.GetEmployees().Where(e => e.Position.Id == 2), "Id", "FullName");
            return View(model);
        }

        // GET: TicketOrder/Edit/5
        public ActionResult Edit(int id)
        {
            var ticketOrder = TicketOrderDal.GetTicketOrder(id);
            var tickets = TicketDal.GetTickets();
            var clients = ClientDal.GetClients();
            var managers = EmployeeDal.GetEmployees().Where(e => e.Position.Id == 2);
            ViewBag.SelectedTicketId = new SelectList(tickets, "Id", "Name", tickets.FirstOrDefault(t => t.Id == ticketOrder.TicketId));
            ViewBag.SelectedClientId = new SelectList(clients, "Id", "FullName", clients.FirstOrDefault(c => c.Id == ticketOrder.ClientId));
            ViewBag.SelectedManagerId = new SelectList(managers, "Id", "FullName", managers.FirstOrDefault(m => m.ID == ticketOrder.ManagerId));
            return View(ticketOrder);
        }

        // POST: TicketOrder/Edit/5
        [HttpPost]
        public ActionResult Edit(TicketOrder model)
        {
            if (ModelState.IsValid)
            {
                TicketOrderDal.UpdateTicketOrder(model);
                return RedirectToAction("Index");
            }
            var tickets = TicketDal.GetTickets();
            var clients = ClientDal.GetClients();
            var managers = EmployeeDal.GetEmployees().Where(e => e.Position.Id == 2);
            ViewBag.SelectedTicketId = new SelectList(tickets, "Id", "Name", tickets.FirstOrDefault(t => t.Id == model.TicketId));
            ViewBag.SelectedClientId = new SelectList(clients, "Id", "FullName", clients.FirstOrDefault(c => c.Id == model.ClientId));
            ViewBag.SelectedManagerId = new SelectList(managers, "Id", "FullName", managers.FirstOrDefault(m => m.ID == model.ManagerId));
            return View(model);
        }

        // GET: TicketOrder/Delete/5
        public ActionResult Delete(int id)
        {
            var ticketOrder = TicketOrderDal.GetTicketOrder(id);
            return View(ticketOrder);
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            TicketOrderDal.DeleteTicketOrder(id);
            return RedirectToAction("Index");
        }
    }
}