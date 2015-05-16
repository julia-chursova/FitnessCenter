using FitnessCenter.DataAccess;
using FitnessCenter.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FitnessCenter.Controllers
{
    public class RoomController : Controller
    {
        // GET: Employee
        public ActionResult Index()
        {
            var list = RoomDal.GetRooms();
            return View(list);
        }

        public ActionResult Edit(int id)
        {
            return View(RoomDal.GetRoom(id));
        }

        [HttpPost]
        public ActionResult Edit(Room room)
        {
            if (ModelState.IsValid)
            {
                RoomDal.UpdateRoom(room);
                return RedirectToAction("Index");
            }
            return View(room);
        }

        public ActionResult Delete(int id)
        {
            return View(RoomDal.GetRoom(id));
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            RoomDal.DeleteRoom(id);
            return RedirectToAction("Index");
        }

        public ActionResult Details(int id)
        {
            return View(RoomDal.GetRoom(id));
        }

        public ActionResult Create()
        {
            return View(new Room());
        }

        [HttpPost]
        public ActionResult Create(Room room)
        {
            if (ModelState.IsValid)
            {
                RoomDal.InsertRoom(room);
                return RedirectToAction("Index");
            }
            return View(room);
        }
    }
}