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
    public class EmployeeController : Controller
    {
        public List<string> Images { get; set; }

        // GET: Employee
        public ActionResult Index()
        {
            var list = EmployeeDal.GetEmployees().Select(e => new EmployeeViewModel() { Model = e });
            return View(list);
        }

        public ActionResult Edit(int id)
        {
            return View(new EmployeeViewModel() { Model = EmployeeDal.GetEmployee(id) });
        }

        [HttpPost]
        public ActionResult Edit(EmployeeViewModel viewModel)
        {
            if (ModelState.IsValid)
            {
                EmployeeDal.UpdateEmployee(viewModel.Model);
                return RedirectToAction("Index");
            }
            return View(viewModel);
        }

        public ActionResult Delete(int id)
        {
            return View(new EmployeeViewModel() { Model = EmployeeDal.GetEmployee(id) });
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
           EmployeeDal.DeleteEmployee(id);
           return RedirectToAction("Index");
        }

        public ActionResult Details(int id)
        {
            return View(new EmployeeViewModel() { Model = EmployeeDal.GetEmployee(id) });
        }

        public ActionResult Create()
        {
            Images = new List<string>();
            return View(new EmployeeViewModel() { Model = new Employee() });
        }

        [HttpPost]
        public ActionResult Create(EmployeeViewModel viewModel, HttpPostedFileBase upload)
        {
            if (ModelState.IsValid)
            {
                EmployeeDal.InsertEmployee(viewModel.Model);
                return RedirectToAction("Index");
            }
            return View(viewModel);
        }

        [HttpPost]
        public ActionResult PostImg(HttpPostedFileBase upload)
        {
            var filename = Guid.NewGuid().ToString() + Path.GetExtension(upload.FileName);
            upload.SaveAs(Path.Combine(Server.MapPath("~/Content/Images"), upload.FileName));

            return Json(new { name = upload.FileName });
        }
    }
}