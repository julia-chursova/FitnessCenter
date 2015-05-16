using FitnessCenter.DataAccess;
using FitnessCenter.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FitnessCenter.Controllers
{
    public class ActivityController : Controller
    {
        // GET: Employee
        public ActionResult Index()
        {
            var list = ActivityDal.GetActivities();
            return View(list);
        }

        public ActionResult Edit(int id)
        {
            return View(ActivityDal.GetActivity(id));
        }

        [HttpPost]
        public ActionResult Edit(Activity activity)
        {
            if (ModelState.IsValid)
            {
                ActivityDal.UpdateActivity(activity);
                return RedirectToAction("Index");
            }
            return View(activity);
        }

        public ActionResult Delete(int id)
        {
            return View(ActivityDal.GetActivity(id));
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            ActivityDal.DeleteActivity(id);
            return RedirectToAction("Index");
        }

        public ActionResult Details(int id)
        {
            return View(ActivityDal.GetActivity(id));
        }

        public ActionResult Create()
        {
            return View(new Activity());
        }

        [HttpPost]
        public ActionResult Create(Activity activity)
        {
            if (ModelState.IsValid)
            {
                ActivityDal.InsertActivity(activity);
                return RedirectToAction("Index");
            }
            return View(activity);
        }
    }
}