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
        [AllowAnonymous]
        public ActionResult Create(int? id)
        {
            if (Session["UserId"] != null)
            {
                if (id > 0)
                {
                    Donor d = db.Donors.Find(id);
                    DateTime firstDonation = (DateTime)d.Date;
                    int monthsApart = 12 * (DateTime.Now.Year - firstDonation.Year) + DateTime.Now.Month - firstDonation.Month;
                    if (monthsApart > 6)
                    {
                        d.CanDonate = 1;
                        d.Date = DateTime.Now;
                        db.Entry(d).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();
                        TempData["msg"] = "Donated Successdfully";
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        TempData["msg"] = "This Donor Have Donate Less than 6 Month";
                        return RedirectToAction("Index");
                    }
                }
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
            if (ModelState.IsValid)
            {
                if (d.Donate_Type == "P")
                {
                    ModelState.AddModelError("Patient Name", "Please Enter Patient Name");
                    ModelState.AddModelError("Patient_Relation_No", "Select Patient Relation");
                }
                else
                {
                    var chkid = (from q in db.Donors.ToList() where q.National_ID == d.National_ID select q);
                    if (chkid.Count() == 0)
                    {
                        d.User_No = int.Parse(Session["UserId"].ToString());
                        d.Date = DateTime.Now;
                        db.Donors.Add(d);
                        db.SaveChanges();
                        return RedirectToAction("EditDonor");
                    }
                    else
                    {
                        ViewBag.data = "The National Id Provided is Existed";
                    }
                }
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
            int monthsApart = 12 * (DateTime.Now.Year - firstDonation.Year) + DateTime.Now.Month - firstDonation.Month;
            if (monthsApart > 6)
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
                TempData["msg"] = "This Donor Have Donate Less than 6 Month";
                return RedirectToAction("Index", "Donor");
            }
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
            if (ModelState.IsValid)
            {
                db.Entry(obj).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("AllDonors");
            }
            ViewBag.Patient_Relation_No = new SelectList(db.Patient_Relation, "Patient_Relation_Id", "Patient_Relation_Name", obj.Patient_Relation_No);
            return View();
        }
        public ActionResult Index()        
        {           
            return View();
        }
        [HttpPost]
        public ActionResult Index(string NatId)
        {
            Donor d = db.Donors.Find(NatId);           
            var chkId = from q in db.Donors.ToList() where q.National_ID == NatId select q;
            if (chkId.Count() > 0)
            {               
                ViewBag.data = "This Donor is Already Registered";
                
                return View(chkId);
            }
            else
            {
                ViewBag.data = "No record for this Id, Please Register first";
                return View();
            }
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
    }
}