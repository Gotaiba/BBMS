using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BBMS.Models;

namespace BBMS.Controllers
{
    public class DoctorController : Controller
    {
        // GET: Doctor
        BBMSdbEntities db = new BBMSdbEntities();
        public ActionResult Index()
        {        
            return View();
        }
        [HttpPost]
        public ActionResult Index(string NationalId)
        {
            List<Donor> d = new List<Donor>();
            d = db.Donors.Where(x => x.National_ID == NationalId).ToList();
            return View(d);
        }
        public ActionResult QuestionForm()
        {
            
            return View();
        }
        [HttpPost]
        public ActionResult QuestionForm(Donor_Information di)
        {
            if (ModelState.IsValid)
            {
                di.Date = DateTime.Now;
                db.Donor_Information.Add(di);
                db.SaveChanges();
                ViewBag.DonorInfoId = di.DonorInfo_Id;
            }
            return View();
        }
        public ActionResult TodayDonor()
        {
            DateTime d = Convert.ToDateTime(DateTime.Now.ToShortDateString());
            return View(db.Donor_Information.Where(x=> x.Date==d && x.IsDonate==0).ToList());
        }
        public ActionResult CollectBlood(int? id)
        {
            ViewBag.Blood_Type_No = new SelectList(db.Blood_Type, "Blood_Type_Id", "Type_Name");
            ViewBag.donorNo = id;
            return View();
        }
        [HttpPost]
        public ActionResult CollectBlood(Collected_Blood c)
        {
            DateTime d = Convert.ToDateTime(DateTime.Now.ToShortDateString());
            if (ModelState.IsValid)
            {
                db.Collected_Blood.Add(c);
                db.SaveChanges();
                int id = db.Donor_Information.Where(x => x.IsDonate == 0 && x.Date == d && x.Donor_No == c.Donor_No).ToList().FirstOrDefault().DonorInfo_Id;
                updateIsDonate(id);
            }
            ViewBag.Blood_Type_No = new SelectList(db.Blood_Type, "Blood_Type_Id", "Type_Name", c.Blood_Type_No);    
            return View();
        }
        [NonAction]
        public void updateIsDonate(int di_Id)
        {
            var _DonorInfo = new Donor_Information() { DonorInfo_Id = di_Id, IsDonate = 1 };
            using (var context = new BBMSdbEntities())
            {
                context.Donor_Information.Attach(_DonorInfo);
                context.Entry(_DonorInfo).Property(x => x.IsDonate).IsModified = true;
                context.SaveChanges();
            }
        }
    }
}