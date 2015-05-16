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
    public class EmployeeController : Controller
    {
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
    }
}