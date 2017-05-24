using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BBMS.Models;
using System.Web.Security;
using System.Security.Principal;

namespace BBMS.Controllers
{
    [Authorize(Roles ="Admin")]
    public class UserController : Controller
    {
        // GET: User
        BBMSdbEntities db= new BBMSdbEntities();
        public ActionResult Index()
        {
            return View(db.Users.ToList());
        }

        // GET: User/Details/5
        public ActionResult Details(int Id)
        {           
            return View(db.Users.Find(Id));
        }

        // GET: User/Create
        public ActionResult Create()
        {
            ViewBag.User_Type_No = new SelectList(db.User_Type, "Id", "User_Type_Name");
            return View();
        }

        // POST: User/Create
        [HttpPost]
        public ActionResult Create(User u)
        {
            if (ModelState.IsValid)
            {
                if (u.Authority == 0)
                {
                    ModelState.AddModelError("Authority", "Select the Authority");
                }
                else
                {
                    db.Users.Add(u);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }

            ViewBag.User_Type_No = new SelectList(db.User_Type, "Id", "User_Type_Name", u.User_Type_No);
            return View(u);
        }

        // GET: User/Edit/5
        public ActionResult Edit(int Id)
        {
            User u = db.Users.Find(Id);
            ViewBag.User_Type_No = new SelectList(db.User_Type, "Id", "User_Type_Name", u.User_Type_No);                       
            return View(u);
        }

        // POST: User/Edit/5
        [HttpPost]
        public ActionResult Edit(int Id, User u)
        {
            try
            {               
                db.Entry(u).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                if(u.Username==User.Identity.Name)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    HttpContext.User = new GenericPrincipal(new GenericIdentity(string.Empty), null);
                    return RedirectToAction("Index", "Login");
                }                           
                
            }
            catch
            {
                return View();
            }
        }

        // GET: User/Delete/5
        public ActionResult Delete(int Id)
        {
            return View(db.Users.Find(Id));
        }

        // POST: User/Delete/5
        [HttpPost]
        [ActionName("Delete")]
        public ActionResult DeleteConfirm(int Id)
        {
            try
            {
                db.Users.Remove(db.Users.Find(Id));
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
