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
        static List<Entities.EmployeeFile> Files;

        // GET: Employee
        public ActionResult Index()
        {
            var list = EmployeeDal.GetEmployees();
            return View(list);
        }

        public ActionResult Edit(int id)
        {
            var employee = EmployeeDal.GetEmployee(id);
            Files = employee.FileNames;
            return View(employee);
        }

        [HttpPost]
        public ActionResult Edit(Employee model)
        {
            if (ModelState.IsValid)
            {
                EmployeeDal.UpdateEmployee(model);
                return RedirectToAction("Index");
            }
            return View(model);
        }

        public FilePathResult Export()
        {
            string path = Path.Combine(Server.MapPath("~/Content/Documents"), "Сотрудники.doc");
            EmployeeExporter.GetDocument(path);
            return File(path, "text/plain", "Сотрудники.doc");
        }

        public ActionResult Delete(int id)
        {
            return View(EmployeeDal.GetEmployee(id));
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
           EmployeeDal.DeleteEmployee(id);
           return RedirectToAction("Index");
        }

        public ActionResult Details(int id)
        {
            var employee = EmployeeDal.GetEmployee(id);
            Files = employee.FileNames;
            return View(employee);
        }

        public ActionResult Create()
        {
            Files = new List<Entities.EmployeeFile>();
            return View(new Employee());
        }

        [HttpPost]
        public ActionResult Create(Employee model)
        {
            if (ModelState.IsValid)
            {
                model.FileNames = Files;
                EmployeeDal.InsertEmployee(model);
                return RedirectToAction("Index");
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult PostImg(HttpPostedFileBase upload, Employee model)
        {
            var filename = Guid.NewGuid().ToString() + Path.GetExtension(upload.FileName);
            upload.SaveAs(Path.Combine(Server.MapPath("~/Content/Images"), filename));
            var file = new Entities.EmployeeFile { FileName = filename };
            if (model.ID > 0)
            {
                EmployeeDal.InsertEmployeeImage(filename, model.ID);
            }
            else
            {
                Files.Add(file);
            }

            return PartialView("~/Views/Shared/EditorTemplates/EmployeeFile.cshtml", file);
        }

        [HttpPost]
        public ActionResult SaveImg(HttpPostedFileBase upload, Employee model)
        {
            var filename = Guid.NewGuid().ToString() + Path.GetExtension(upload.FileName);
            upload.SaveAs(Path.Combine(Server.MapPath("~/Content/Images"), filename));
            EmployeeDal.InsertEmployeeImage(filename, model.ID);

            return RedirectToAction("Edit", model.ID);
        }

        [HttpPost]
        public ActionResult DeleteFile([Bind(Prefix = "filename")] Entities.EmployeeFile file)
        {
            EmployeeDal.DeleteEmployeeImage(file.FileName);

            return RedirectToAction("Edit", new { id = file.Employee.ID });
        }
    }
}