using FitnessCenter.DataAccess;
using FitnessCenter.Entities;
using FitnessCenter.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FitnessCenter.Controllers
{
    public class ReportController : Controller
    {
        // GET: Report
        public ActionResult Index()
        {
            return View();
        }

        public FilePathResult Activities()
        {
            string path = Path.Combine(Server.MapPath("~/Content/Documents"), "Сотрудники.doc");
            ExportHelper.CreateActivitiesReport(path);
            return File(path, "text/plain", "Услуги.doc");
        }

        public FilePathResult Clients()
        {
            string path = Path.Combine(Server.MapPath("~/Content/Documents"), "Сотрудники.doc");
            ExportHelper.CreateClientsReport(path);
            return File(path, "text/plain", "Клиенты.doc");
        }

        public FilePathResult Employees()
        {
            var employees = EmployeeDal.GetEmployees();
            string path = Path.Combine(Server.MapPath("~/Content/Documents"), "Сотрудники.doc");
            ExportHelper.CreateEmployeesReport(path, employees, "Сотрудники");
            return File(path, "text/plain", "Сотрудники.doc");
        }

        public FilePathResult InstructorsReport()
        {
            var employees = EmployeeDal.GetEmployees().Where(e => e.Position.Id == 3).ToList();
            string path = Path.Combine(Server.MapPath("~/Content/Documents"), "Сотрудники.doc");
            ExportHelper.CreateEmployeesReport(path, employees, "Инструктора");
            return File(path, "text/plain", "Сотрудники.doc");
        }

        public FilePathResult Managers()
        {
            var employees = EmployeeDal.GetEmployees().Where(e => e.Position.Id == 2).ToList();
            string path = Path.Combine(Server.MapPath("~/Content/Documents"), "Сотрудники.doc");
            ExportHelper.CreateEmployeesReport(path, employees, "Менеджеры");
            return File(path, "text/plain", "Сотрудники.doc");
        }

        public ActionResult Rooms()
        {
            List<Room> rooms = new List<Room>();
            var rIds = TimetableDal.GetTimetables().Select(t => t.Room.ID).Distinct();
            foreach (var id in rIds)
            {
                rooms.Add(RoomDal.GetRoom(id));
            }
            return View(rooms);
        }

        public ActionResult Instructors()
        {
            List<Employee> instructors = new List<Employee>();
            var eIds = TimetableDal.GetTimetables().Select(t => t.Employee.ID).Distinct();
            foreach (var id in eIds)
            {
                instructors.Add(EmployeeDal.GetEmployee(id));
            }
            return View(instructors);
        }

        public FilePathResult TimetableRoom(int roomID)
        {
            var room = RoomDal.GetRoom(roomID);
            var timetable = TimetableDal.GetTimetables().Where(t => t.Room.ID == roomID).ToList();
            string path = Path.Combine(Server.MapPath("~/Content/Documents"), "Сотрудники.doc");
            ExportHelper.CreateTimetableReport(path, timetable, room.Name);
            return File(path, "text/plain", "Расписание.doc");
        }

        public FilePathResult TimetableInstructor(int employeeID)
        {
            var instructor = EmployeeDal.GetEmployee(employeeID);
            var timetable = TimetableDal.GetTimetables().Where(t => t.Employee.ID == employeeID).ToList();
            string path = Path.Combine(Server.MapPath("~/Content/Documents"), "Сотрудники.doc");
            ExportHelper.CreateTimetableReport(path, timetable, instructor.FullName);
            return File(path, "text/plain", "Расписание.doc");
        }

        public FilePathResult TicketOrderMonth()
        {
            var date = DateTime.Now.Date;
            var orders = TicketOrderDal.GetTicketOrders().Where(o => o.OrderDate > date.AddMonths(-1) && o.OrderDate <= date);
            string path = Path.Combine(Server.MapPath("~/Content/Documents"), "Сотрудники.doc");
            ExportHelper.CreateTicketOrderReport(path, orders.ToList(), "Клубные карты, проданные за месяц");
            return File(path, "text/plain", "Отчет.doc");
        }

        public FilePathResult TicketOrderYear()
        {
            var date = DateTime.Now.Date;
            var orders = TicketOrderDal.GetTicketOrders().Where(o => o.OrderDate > date.AddYears(-1) && o.OrderDate <= date);
            string path = Path.Combine(Server.MapPath("~/Content/Documents"), "Сотрудники.doc");
            ExportHelper.CreateTicketOrderReport(path, orders.ToList(), "Клубные карты, проданные за год");
            return File(path, "text/plain", "Отчет.doc");
        }

        public FilePathResult TicketOrderDetail()
        {
            var date = DateTime.Now.Date;
            var orders = TicketOrderDal.GetTicketOrders().Where(o => o.OrderDate > date.AddMonths(-1) && o.OrderDate <= date);
            string path = Path.Combine(Server.MapPath("~/Content/Documents"), "Сотрудники.doc");
            ExportHelper.CreateTicketOrderDetailReport(path, orders.ToList());
            return File(path, "text/plain", "Отчет.doc");
        }

        public FilePathResult TicketOrderManager()
        {
            var date = DateTime.Now.Date;
            var orders = TicketOrderDal.GetTicketOrders().Where(o => o.OrderDate > date.AddMonths(-1) && o.OrderDate <= date);
            string path = Path.Combine(Server.MapPath("~/Content/Documents"), "Сотрудники.doc");
            ExportHelper.CreateTicketOrderReport(path, orders.ToList());
            return File(path, "text/plain", "Отчет.doc");
        }
    }
}