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
            return View(db.Donors.OrderByDescending(o => o.Donar_Id).Where(x=> x.CanDonate==1).ToList());
        }
        [HttpPost]
        public ActionResult Index(string NationalId)
        {
            List<Donor> d = new List<Donor>();
            d = db.Donors.OrderByDescending(o => o.Donar_Id).Where(x => x.National_ID.Contains(NationalId) && x.CanDonate == 1).ToList();
            if(string.IsNullOrEmpty(NationalId))
            {
                d = db.Donors.OrderByDescending(o => o.Donar_Id).Where(x=> x.CanDonate == 1).ToList();
            }
            return View(d);
        }
        public ActionResult QuestionForm(int Donor_No)
        {
            return View();
        }
        [HttpPost]
        public ActionResult QuestionForm(Donor_Information di)
        {
            if (ModelState.IsValid)
            {
                UpdateCanDonate(GetUrlId());
                di.Donor_No = GetUrlId();
                di.User_No= int.Parse(Session["UserId"].ToString());
                di.Date = DateTime.Now;
                db.Donor_Information.Add(di);
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }
        public ActionResult TodayDonor()
        {
            DateTime d = Convert.ToDateTime(DateTime.Now.ToShortDateString());
            return View(db.Donor_Information.Where(x=> x.Date==d && x.IsDonate==0).ToList());
        }
        public ActionResult CollectBlood(int? id)
        {
            ViewBag.Blood_Type_No = new SelectList(db.Blood_Type, "Blood_Type_Id", "Type_Name");
            return View();
        }
        [HttpPost]
        public ActionResult CollectBlood(Collected_Blood c)
        {
            DateTime d = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                c.Donor_No = 
                c.User_No = int.Parse(Session["UserId"].ToString());
                db.Collected_Blood.Add(c);
                db.SaveChanges();
                int id = db.Donor_Information.Where(x => x.IsDonate == 0 && x.Date == d && x.Donor_No == c.Donor_No).ToList().FirstOrDefault().DonorInfo_Id;
                updateIsDonate(id);
                if (c.Blood_Status_No)
                {
                    Incoming_Blood inc = new Incoming_Blood();
                    inc.Collection_No = c.ColIection_Id;
                    inc.Date = DateTime.Now;
                    inc.ExpirationDate = DateTime.Now.AddYears(1);
                    inc.User_No = int.Parse(Session["UserId"].ToString());
                    db.Incoming_Blood.Add(inc);
                    db.SaveChanges();
                }            
            return RedirectToAction("TodayDonor");
        }
        public ActionResult Collected()
        {
            return View(db.Collected_Blood.Where(c=> c.Blood_Status_No==false).ToList());
        }

        public ActionResult Virus(int? ColId)
        {        
            return View();
        }
        [HttpPost]
        public ActionResult Virus(Virus v)
        {
            if (ModelState.IsValid)
            {               
                v.Collection_No = GetUrlId();
                UpdateBloodStatus(v.Collection_No);
                if(v.HBV==false && v.HCV==false && v.HIV==false && v.VDRL==false)
                {
                    Incoming_Blood inc = new Incoming_Blood();
                    inc.Collection_No = v.Collection_No;
                    inc.Date = DateTime.Now;
                    inc.ExpirationDate = DateTime.Now.AddYears(1);
                    inc.User_No= int.Parse(Session["UserId"].ToString());
                    db.Incoming_Blood.Add(inc);
                    db.SaveChanges();
                }
                else
                {
                    v.User_No= int.Parse(Session["UserId"].ToString());
                    db.Viruses.Add(v);
                    db.SaveChanges();
                }
               
            }
            return RedirectToAction("Collected");
        }

        [NonAction]
        public void updateIsDonate(int di_Id)
        {
            Donor_Information d = db.Donor_Information.Find(di_Id);
            d.IsDonate = 1; ;
            db.Entry(d).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }
        [NonAction]
        public void UpdateCanDonate(int Donor_Id)
        {                   
            Donor donor = db.Donors.Find(Donor_Id);
            donor.CanDonate = 0;
            db.Entry(donor).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }
        [NonAction]
        public int GetUrlId()
        {
            string id = Request.Url.Query;
            string Url = Request.Url.ToString();
            if (id=="")
            {
                return int.Parse(Url.Substring(Url.LastIndexOf("/")));
            }
            return int.Parse(id.Substring(id.LastIndexOf('=') + 1));
        }
        [NonAction]
        public void UpdateBloodStatus(int ColId)
        {
            Collected_Blood c = db.Collected_Blood.Find(ColId);
            c.Blood_Status_No = true;
            db.Entry(c).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }
    }
}