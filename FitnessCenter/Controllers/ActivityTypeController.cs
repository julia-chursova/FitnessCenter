using FitnessCenter.DataAccess;
using FitnessCenter.Entities;
using FitnessCenter.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FitnessCenter.Controllers
{
    public class ActivityTypeController : Controller
    {
        // GET: Employee
        public ActionResult Index()
        {
            var list = ActivityTypeDal.GetActivityTypes();
            return View(list);
        }

        public ActionResult Edit(int id)
        {
            var activityType = ActivityTypeDal.GetActivityType(id);
            return View(activityType);
        }

        [HttpPost]
        public ActionResult Edit(ActivityType model)
        {
            if (ModelState.IsValid)
            {
                ActivityTypeDal.UpdateActivityType(model);                
                return RedirectToAction("Index");
            }
            return View(model);
        }

        public ActionResult Delete(int id)
        {
            return View(ActivityTypeDal.GetActivityType(id));
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            ActivityTypeDal.DeleteActivityType(id);
            return RedirectToAction("Index");
        }

        public ActionResult Details(int id)
        {
            var activityType = ActivityTypeDal.GetActivityType(id);            
            return View(activityType);
        }

        public ActionResult Create()
        {            
            return View(new ActivityType());
        }

        [HttpPost]
        public ActionResult Create(ActivityType model)
        {
            if (ModelState.IsValid)
            {
                int typeId = ActivityTypeDal.InsertActivityType(model);
                return RedirectToAction("Index");
            }
            return View(model);
        }
    }
}
