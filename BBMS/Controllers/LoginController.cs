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
                    FormsAuthentication.RedirectFromLoginPage(u.FirstOrDefault().Username, true,ReturnUrl);
                    if(ReturnUrl==null)
                    {
                        return RedirectToAction("Index", "Home");
                    }
                    return Redirect(ReturnUrl);
                }
                else
                {
                    ViewBag.data = "Invalid Username or Password";
                    return View();
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