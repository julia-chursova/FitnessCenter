using FitnessCenter.DataAccess;
using FitnessCenter.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FitnessCenter.Controllers
{
    public class DayOfWeek
    {
        public string Title { get; set; }
        public int Day { get; set; }
    }

    public class TimetableController : Controller
    {
        // GET: Timetable
        public ActionResult Index()
        {
            var timetables = TimetableDal.GetTimetables();
            return View(timetables);
        }

        // GET: Timetable/Details/5
        public ActionResult Details(int id)
        {
            var timetable = TimetableDal.GetTimetable(id);
            return View(timetable);
        }

        // GET: Timetable/Create
        public ActionResult Create()
        {
            ViewBag.RoomId = new SelectList(RoomDal.GetRooms(), "Id", "Name");
            ViewBag.ActivityId = new SelectList(ActivityDal.GetActivities(), "Id", "Name");
            ViewBag.EmployeeId = new SelectList(EmployeeDal.GetEmployees().Where(e => e.Position.Id == 3), "Id", "FullName");
            var days = new List<DayOfWeek>() { new DayOfWeek { Title = "Понедельник", Day = 1 },
                new DayOfWeek { Title = "Вторник", Day = 2 },
                new DayOfWeek { Title = "Среда", Day = 3 },
                new DayOfWeek { Title = "Четверг", Day = 4 },
                new DayOfWeek { Title = "Пятница", Day = 5 },
                new DayOfWeek { Title = "Суббота", Day = 6 },
                new DayOfWeek { Title = "Воскресенье", Day = 7 }};
            ViewBag.DayOfWeek = new SelectList(days, "Day", "Title");
            return View(new TimetableItem());
        }

        // POST: Timetable/Create
        [HttpPost]
        public ActionResult Create(TimetableItem model)
        {
            if (ModelState.IsValid)
            {
                TimetableDal.InsertTimetable(model);
                return RedirectToAction("Index");
            }
            ViewBag.RoomId = new SelectList(RoomDal.GetRooms(), "Id", "Name");
            ViewBag.ActivityId = new SelectList(ActivityDal.GetActivities(), "Id", "Name");
            ViewBag.EmployeeId = new SelectList(EmployeeDal.GetEmployees().Where(e => e.Position.Id == 3), "Id", "FullName");
            var days = new List<DayOfWeek>() { new DayOfWeek { Title = "Понедельник", Day = 1 },
                new DayOfWeek { Title = "Вторник", Day = 2 },
                new DayOfWeek { Title = "Среда", Day = 3 },
                new DayOfWeek { Title = "Четверг", Day = 4 },
                new DayOfWeek { Title = "Пятница", Day = 5 },
                new DayOfWeek { Title = "Суббота", Day = 6 },
                new DayOfWeek { Title = "Воскресенье", Day = 7 }};
            ViewBag.DayOfWeek = new SelectList(days, "Day", "Title");
            return View(model);
        }

        // GET: Timetable/Edit/5
        public ActionResult Edit(int id)
        {
            var timetable = TimetableDal.GetTimetable(id);
            var rooms = RoomDal.GetRooms();
            var activities = ActivityDal.GetActivities();
            var employees = EmployeeDal.GetEmployees().Where(e => e.Position.Id == 3);
            ViewBag.SelectedRoomId = new SelectList(rooms, "Id", "Name", rooms.FirstOrDefault(r => r.ID == timetable.RoomId));
            ViewBag.SelectedActivityId = new SelectList(activities, "Id", "Name", activities.FirstOrDefault(a => a.ID == timetable.ActivityId));
            ViewBag.SelectedEmployeeId = new SelectList(employees, "Id", "FullName", employees.FirstOrDefault(e => e.ID == timetable.EmployeeId));
            var days = new List<DayOfWeek>() { new DayOfWeek { Title = "Понедельник", Day = 1 },
                new DayOfWeek { Title = "Вторник", Day = 2 },
                new DayOfWeek { Title = "Среда", Day = 3 },
                new DayOfWeek { Title = "Четверг", Day = 4 },
                new DayOfWeek { Title = "Пятница", Day = 5 },
                new DayOfWeek { Title = "Суббота", Day = 6 },
                new DayOfWeek { Title = "Воскресенье", Day = 7 }};
            ViewBag.SelectedDayOfWeek = new SelectList(days, "Day", "Title", days.FirstOrDefault(d => d.Day == timetable.DayOfWeek));
            return View(timetable);
        }

        // POST: Timetable/Edit/5
        [HttpPost]
        public ActionResult Edit(TimetableItem model)
        {
            if (ModelState.IsValid)
            {
                TimetableDal.UpdateTimetable(model);
                return RedirectToAction("Index");
            }
            var rooms = RoomDal.GetRooms();
            var activities = ActivityDal.GetActivities();
            var employees = EmployeeDal.GetEmployees().Where(e => e.Position.Id == 3);
            ViewBag.SelectedRoomId = new SelectList(rooms, "Id", "Name", rooms.FirstOrDefault(r => r.ID == model.RoomId));
            ViewBag.SelectedActivityId = new SelectList(activities, "Id", "Name", activities.FirstOrDefault(a => a.ID == model.ActivityId));
            ViewBag.SelectedEmployeeId = new SelectList(employees, "Id", "FullName", employees.FirstOrDefault(e => e.ID == model.EmployeeId));
            var days = new List<DayOfWeek>() { new DayOfWeek { Title = "Понедельник", Day = 1 },
                new DayOfWeek { Title = "Вторник", Day = 2 },
                new DayOfWeek { Title = "Среда", Day = 3 },
                new DayOfWeek { Title = "Четверг", Day = 4 },
                new DayOfWeek { Title = "Пятница", Day = 5 },
                new DayOfWeek { Title = "Суббота", Day = 6 },
                new DayOfWeek { Title = "Воскресенье", Day = 7 }};
            ViewBag.SelectedDayOfWeek = new SelectList(days, "Day", "Title", days.FirstOrDefault(d => d.Day == model.DayOfWeek));
            return View(model);
        }

        // GET: Timetable/Delete/5
        public ActionResult Delete(int id)
        {
            var timetable = TimetableDal.GetTimetable(id);
            return View(timetable);
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            TimetableDal.DeleteTimetable(id);
            return RedirectToAction("Index");
        }
    }
}
