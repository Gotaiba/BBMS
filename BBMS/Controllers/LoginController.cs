using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BBMS.Models;
using System.Web.Security;
using System.Net;

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
        public ActionResult Index(string Password, string Username,string ReturnUrl)
        {
            if (ModelState.IsValid)
            {
                var u = db.Users.Where(r => r.Username == Username && r.Password == Password).ToList();
                if (u.Count() > 0)
                {
                    //Session["aut"] = u.FirstOrDefault().Authority;
                    //Session["UserId"] = u.FirstOrDefault().Id;
                    //foreach (var c in u)
                    //{
                    //    switch (c.Authority)
                    //    {
                    //        case 1:
                    //            return RedirectToAction("../User/Index");
                    //        case 2:
                    //            return RedirectToAction("../Doctor/Index");
                    //        default:
                    //            return RedirectToAction("../Donor/AllDonors");
                    //    }
                    //}
                    FormsAuthentication.RedirectFromLoginPage(u.FirstOrDefault().Username, true,ReturnUrl);
                }
                else
                {
                    ViewBag.data = "Invalid Username or Password";
                }
            }
            return RedirectToAction("Index", "Home");
        }
        public ActionResult LogOut()
        {
            FormsAuthentication.SignOut();          
            Session.Abandon();
            return RedirectToAction("Index", "Login");

        }
    }
}