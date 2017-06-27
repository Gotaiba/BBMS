using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BBMS.Controllers
{
    public class ReportController : Controller
    {
        // GET: Report
        public ActionResult Donors()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Donors(char DonateType, DateTime From, DateTime To)               
        {
            return View();
        }
        public ActionResult DetailedDonor()
        {
            return View();
        }
        public ActionResult BloodStock()
        {
            return View();
        }
        public ActionResult InfectedBlood()
        {
            return View();
        }
        public ActionResult OutgoingBlood()
        {
            return View();
        }
        public ActionResult UserEntries()
        {
            return View();
        }
    }
}