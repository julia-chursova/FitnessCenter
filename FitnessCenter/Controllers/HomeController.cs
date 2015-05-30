using FitnessCenter.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FitnessCenter.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }

        public ActionResult Instructors()
        {
            var instructors = EmployeeDal.GetEmployees().Where(e => e.Position.Id == 3);
            return View(instructors);
        }

        public ActionResult Rooms()
        {
            var rooms = RoomDal.GetRooms();
            return View(rooms);
        }

        public ActionResult Discounts()
        {
            var discounts = DiscountDal.GetDiscounts().Where(d => d.StartDate <= DateTime.Now.Date && d.EndDate >= DateTime.Now.Date);
            return View(discounts);
        }

        public ActionResult Tickets()
        {
            var tickets = TicketDal.GetTickets();
            return View(tickets);
        }

        public ActionResult Timetable()
        {
            var timetable = TimetableDal.GetTimetables();
            return View(timetable);
        }
    }
}