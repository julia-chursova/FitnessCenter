using FitnessCenter.DataAccess;
using FitnessCenter.Entities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FitnessCenter.Controllers
{
    public class RoomController : Controller
    {
        static List<Entities.RoomFile> Files;

        // GET: Employee
        public ActionResult Index()
        {
            var list = RoomDal.GetRooms();
            return View(list);
        }

        public ActionResult Edit(int id)
        {
            var room = RoomDal.GetRoom(id);
            Files = room.FileNames;
            return View(room);
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
            var room = RoomDal.GetRoom(id);
            Files = room.FileNames;
            return View(room);
        }

        public ActionResult Create()
        {
            Files = new List<RoomFile>();
            return View(new Room());
        }

        [HttpPost]
        public ActionResult Create(Room room)
        {
            if (ModelState.IsValid)
            {
                room.FileNames = Files;
                RoomDal.InsertRoom(room);
                return RedirectToAction("Index");
            }
            return View(room);
        }

        [HttpPost]
        public ActionResult PostImg(HttpPostedFileBase upload, Room model)
        {
            var filename = Guid.NewGuid().ToString() + Path.GetExtension(upload.FileName);
            upload.SaveAs(Path.Combine(Server.MapPath("~/Content/Images"), filename));
            var file = new Entities.RoomFile { FileName = filename, Room = model };
            if (model.ID > 0)
            {
                RoomDal.InsertRoomImage(filename, model.ID);
            }
            else
            {
                Files.Add(file);
            }
            ViewData.TemplateInfo.HtmlFieldPrefix = "filename";
            return PartialView("~/Views/Shared/EditorTemplates/RoomFile.cshtml", file);
        }

        [HttpPost]
        public ActionResult DeleteFile([Bind(Prefix = "filename")] Entities.RoomFile file)
        {
            RoomDal.DeleteRoomImage(file.FileName);

            return RedirectToAction("Edit", new { id = file.Room.ID });
        }
    }
}