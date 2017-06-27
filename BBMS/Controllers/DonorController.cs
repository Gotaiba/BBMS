using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BBMS.Models;

namespace BBMS.Controllers
{
    [Authorize(Roles = "Admin,Nurse,Receptionist")]
    public class DonorController : Controller
    {
        // GET: Donor
        BBMSdbEntities db = new BBMSdbEntities();
        public ActionResult AllDonors()
        {           
            DateTime d = Convert.ToDateTime(DateTime.Now.ToShortDateString());
            return View(db.Donor_Information.Where(x => x.Date == d && x.IsDonate == 0).ToList());
        }
        public ActionResult EditDonor()
        {
            return View(db.Donors.ToList());
        }
        public ActionResult Create(int? id)
        {
            if (Session["UserId"] != null)
            {                
                ViewBag.Patient_Relation_No = new SelectList(db.Patient_Relation, "Patient_Relation_Id", "Patient_Relation_Name");
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Login");
            }
}
        [HttpPost]
        public ActionResult Create(Donor d)
        {
            int age = CalculateAge(d.Date_of_Birth);
            if (d.Donate_Type == "P")
            {
                if(string.IsNullOrWhiteSpace(d.Patient_Name))
                    ModelState.AddModelError("Patient_Name", "Please Enter Patient Name");
                if(d.Patient_Relation_No==null)
                    ModelState.AddModelError("Patient_Relation_No", "Select Patient Relation");
            }
            if (age < 20 || age > 50)
            {
                ModelState.AddModelError("Date_of_Birth", "Donor Age is Not Valid");
            }
            var chkid = (from q in db.Donors.ToList() where q.National_ID == d.National_ID select q);
            if (chkid.Count() == 0)
            {
                if (ModelState.IsValid)
                {
                    d.User_No = int.Parse(Session["UserId"].ToString());
                    d.Date = DateTime.Now;
                    d.CanDonate = 1;
                    db.Donors.Add(d);
                    db.SaveChanges();
                    return RedirectToAction("EditDonor");
                }

            }
            else
            {
                ViewBag.data = "The National Id Provided is Existed";
            }
            ViewBag.Patient_Relation_No = new SelectList(db.Patient_Relation, "Patient_Relation_Id", "Patient_Relation_Name", d.Patient_Relation_No);
            return View();
        }               
        public ActionResult DonateAgain(int? id)
        {
            if (id == null)
                return RedirectToAction("Index");
            ViewBag.Patient_Relation_No = new SelectList(db.Patient_Relation, "Patient_Relation_Id", "Patient_Relation_Name");
            return View();
        }
        [HttpPost]
        public ActionResult DonateAgain(Donor donor)
        {
            ViewBag.Patient_Relation_No = new SelectList(db.Patient_Relation, "Patient_Relation_Id", "Patient_Relation_Name");
            Donor d = db.Donors.Find(GetUrlId());
            DateTime firstDonation = (DateTime)d.Date;
            int weeks=Convert.ToInt32((DateTime.Now - firstDonation).TotalDays / 7);
            //int monthsApart = 12 * (DateTime.Now.Year - firstDonation.Year) + DateTime.Now - firstDonation.Month;
            if (weeks >= 2)
            {
                d.CanDonate = 1;
                d.Date = DateTime.Now;
                d.Donate_Type = donor.Donate_Type;
                d.Patient_Name = donor.Patient_Name;
                d.Patient_Relation_No = donor.Patient_Relation_No;
                db.Entry(d).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                TempData["msg"] = "Donated Successdfully";
                return RedirectToAction("Index","Donor");
            }
            else
            {
                TempData["msg"] = "This Donor Have Donate Less than 2 weeks";
                return RedirectToAction("Index", "Donor");
            }
        }
        public ActionResult DonorStatus()
        {           
            return View(db.vwStatusInfoes.ToList());
        }
        public ActionResult Details(int? id)     
        {
            return View(db.Donors.Find(id));
        }
        public ActionResult Edit(int? id)
        {
            Donor d = db.Donors.Find(id);
            ViewBag.Patient_Relation_No = new SelectList(db.Patient_Relation, "Patient_Relation_Id", "Patient_Relation_Name",d.Patient_Relation_No);
            return View(d);
        }
        [HttpPost]
        public ActionResult Edit(Donor obj)
        {
            int age = CalculateAge(obj.Date_of_Birth);
            if (obj.Donate_Type == "P")
            {
                if (string.IsNullOrWhiteSpace(obj.Patient_Name))
                    ModelState.AddModelError("Patient_Name", "Please Enter Patient Name");
                if (obj.Patient_Relation_No == null)
                    ModelState.AddModelError("Patient_Relation_No", "Select Patient Relation");
            }
            if (age < 20 || age > 50)
            {
                ModelState.AddModelError("Date_of_Birth", "Donor Age is Not Valid");
            }
            if (ModelState.IsValid)
            {
                obj.User_No = int.Parse(Session["UserId"].ToString());
                db.Entry(obj).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("EditDonor");
            }                
            ViewBag.Patient_Relation_No = new SelectList(db.Patient_Relation, "Patient_Relation_Id", "Patient_Relation_Name", obj.Patient_Relation_No);
            return View();
        }
        public ActionResult Index()        
        {           
            return View();
        }
  
        [AllowAnonymous]
        public JsonResult SearchNId(string NatId)
        {
            var data = db.Donors.Where(x => x.National_ID.Contains(NatId)).Select(x => new
            {
                x.Donar_Id,
                x.National_ID,
                x.First_Name,
                x.Last_Name,
                x.Donate_Type,
                x.Patient_Name
            }).ToList();
            return Json(data,JsonRequestBehavior.AllowGet);
        }
        public ActionResult Delete(int? id)
        {
            return View(db.Donors.Find(id));
        }
        [HttpPost,ActionName("Delete")]
        public ActionResult DeleteConfirm(int? id)
        {
            db.Donors.Remove(db.Donors.Find(id));
            db.SaveChanges();
            return RedirectToAction("AllDonors");
        }
        [NonAction]
        public int GetUrlId()
        {
            string id = Request.Url.Query;
            return int.Parse(id.Substring(id.LastIndexOf('=') + 1));
        }
        [NonAction]
        public int CalculateAge(DateTime DoB)
        {
            int age = DateTime.Now.Year - DoB.Year;
            return age;
        }
    }
}