using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BBMS.Models;
using System.Web.Security;

namespace BBMS.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        BBMSdbEntities db = new BBMSdbEntities();          
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(string Password, string Username)
        {
            if (ModelState.IsValid)
            {
                List<User> all = db.Users.ToList();
                var u = (from q in all where q.Username.Equals(Username) && q.Password.Equals(Password) select q);
                if (u.Count() > 0)
                {
                    Session["aut"] = u.FirstOrDefault().Authority;
                    Session["UserId"] = u.FirstOrDefault().Id;
                    foreach (var c in u)
                    {
                        switch (c.Authority)
                        {
                            case 1:
                                return RedirectToAction("../User/Index");
                            case 2:
                                return RedirectToAction("../Doctor/Index");
                            default:
                                return RedirectToAction("../Donor/AllDonors");
                        }
                    }
                }
                else
                {
                    ViewBag.data = "Invalid Username or Password";
                }
            }
            return View();
        }
    }
}