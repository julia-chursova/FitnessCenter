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
            var model = new ActivityTypeModel()
            {
                ActivityType = activityType,
                Activities = ActivityDal.GetActivities().Select(a => new SelectionActivityModel()
                {
                    Activity = a,
                    IsSelected = activityType.Activities.Any(e => e.ID == a.ID)
                }).ToList()
            };
            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(ActivityTypeModel model)
        {
            if (ModelState.IsValid)
            {
                var activityType = ActivityTypeDal.GetActivityType(model.ActivityType.Id);
                ActivityTypeDal.UpdateActivityType(model.ActivityType);
                foreach (var selectionActivity in model.Activities)
                {
                    if (selectionActivity.IsSelected && !activityType.Activities.Any(a => a.ID == selectionActivity.Activity.ID))
                    {
                        ActivityDal.InsertActivityToType(selectionActivity.Activity.ID, model.ActivityType.Id);
                    }
                    if (!selectionActivity.IsSelected && activityType.Activities.Any(a => a.ID == selectionActivity.Activity.ID))
                    {
                        ActivityDal.DeleteActivityToType(selectionActivity.Activity.ID, model.ActivityType.Id);
                    }
                }
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
            var model = new ActivityTypeModel()
            {
                ActivityType = activityType,
                Activities = ActivityDal.GetActivities().Select(a => new SelectionActivityModel() 
                { 
                    Activity = a,
                    IsSelected = activityType.Activities.Any(e => e.ID == a.ID)
                }).ToList()
            };
            return View(activityType);
        }

        public ActionResult Create()
        {
            var model = new ActivityTypeModel()
            {
                ActivityType = new ActivityType(),
                Activities = ActivityDal.GetActivities().Select(a => new SelectionActivityModel()
                {
                    Activity = a,
                    IsSelected = false
                }).ToList()
            };
            return View(model);
        }

        [HttpPost]
        public ActionResult Create(ActivityTypeModel model)
        {
            if (ModelState.IsValid)
            {
                int typeId = ActivityTypeDal.InsertActivityType(model.ActivityType);
                foreach (var selectionActivity in model.Activities)
                {
                    if (selectionActivity.IsSelected)
                    {
                        ActivityDal.InsertActivityToType(selectionActivity.Activity.ID, typeId);
                    }
                }
                return RedirectToAction("Index");
            }
            return View(model);
        }
    }
}
