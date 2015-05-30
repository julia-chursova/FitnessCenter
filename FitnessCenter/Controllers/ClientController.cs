using FitnessCenter.DataAccess;
using FitnessCenter.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FitnessCenter.Controllers
{
    public class ClientController : Controller
    {
        Func<object, string> GetDisplayName = o =>
        {
            var result = null as string;
            var display = o.GetType()
                           .GetMember(o.ToString()).First()
                           .GetCustomAttributes(false)
                           .OfType<DisplayAttribute>()
                           .LastOrDefault();
            if (display != null)
            {
                result = display.GetName();
            }

            return result ?? o.ToString();
        };

        // GET: Client
        public ActionResult Index()
        {
            var clients = ClientDal.GetClients();
            return View(clients);
        }

        // GET: Client/Details/5
        public ActionResult Details(int id)
        {
            var client = ClientDal.GetClient(id);
            return View(client);
        }

        // GET: Client/Create
        public ActionResult Create()
        {
            ViewBag.GenderId = Enum.GetValues(typeof(Genders)).Cast<object>()
                     .Select(v => new SelectListItem
                     {
                         Selected = false,
                         Text = GetDisplayName(v),
                         Value = ((int)Enum.Parse(typeof(Genders), v.ToString())).ToString()
                     });
            return View(new Client());
        }

        // POST: Client/Create
        [HttpPost]
        public ActionResult Create(Client model)
        {
            if (ModelState.IsValid)
            {
                ClientDal.InsertClient(model);
                return RedirectToAction("Index");
            }
            ViewBag.GenderId = Enum.GetValues(typeof(Genders)).Cast<object>()
                     .Select(v => new SelectListItem
                     {
                         Selected = false,
                         Text = GetDisplayName(v),
                         Value = ((int)Enum.Parse(typeof(Genders), v.ToString())).ToString()
                     });
            return View(model);
        }

        // GET: Client/Edit/5
        public ActionResult Edit(int id)
        {
            var client = ClientDal.GetClient(id);
            var sl = Enum.GetValues(typeof(Genders)).Cast<object>()
                     .Select(v => new SelectListItem
                     {
                         Selected = v.ToString() == client.Gender.ToString(),
                         Text = GetDisplayName(v),
                         Value = ((int)Enum.Parse(typeof(Genders), v.ToString())).ToString()
                     }).ToList();
            ViewBag.GenderId = new SelectList(sl, "Value", "Text", sl.FirstOrDefault(s => s.Selected));
            //ViewBag.GenderId = sl;
            return View(client);
        }

        // POST: Client/Edit/5
        [HttpPost]
        public ActionResult Edit(Client model)
        {
            if (ModelState.IsValid)
            {
                ClientDal.UpdateClient(model);
                return RedirectToAction("Index");
            }
            ViewBag.GenderId = Enum.GetValues(typeof(Genders)).Cast<object>()
                     .Select(v => new SelectListItem
                     {
                         Selected = v.ToString() == model.Gender.ToString(),
                         Text = GetDisplayName(v),
                         Value = ((int)Enum.Parse(typeof(Genders), v.ToString())).ToString()
                     });
            return View(model);
        }

        // GET: Client/Delete/5
        public ActionResult Delete(int id)
        {
            var client = ClientDal.GetClient(id);
            return View(client);
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            ClientDal.DeleteClient(id);
            return RedirectToAction("Index");
        }
    }
}
