using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BBMS.Models;
using System.Data.Entity.Validation;

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
        public ActionResult Create(Donor d,string Patient_Relation_No)
        {
            int age = CalculateAge(d.Date_of_Birth);
            if (d.Donate_Type == "P")
            {
                if(string.IsNullOrWhiteSpace(d.Patient.Patiant_Name))
                    ModelState.AddModelError("Patient_Name", "Please Enter Patient Name");
                if(Patient_Relation_No == "")
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
                    if (d.Donate_Type == "P")
                    {
                        //Patient p = new Patient();
                        //p.Patiant_Name = d.Patient.Patiant_Name;
                        //p.Patient_Relation_No = int.Parse(Patient_Relation_No);
                        //db.Patients.Add(p);
                        //db.SaveChanges();
                        //d.Patient_No = p.Patiant_Id;
                        d.Patient.Patient_Relation_No = int.Parse(Patient_Relation_No);
                    }
                    d.User_No = int.Parse(Session["UserId"].ToString());
                    d.Date = DateTime.Now;                   
                    d.CanDonate = 1;                   
                    db.Donors.Add(d);
                    try
                    {
                        db.SaveChanges();
                    }
                    catch (DbEntityValidationException ex)
                    {
                        foreach (var entityValidationErrors in ex.EntityValidationErrors)
                        {
                            foreach (var validationError in entityValidationErrors.ValidationErrors)
                            {
                                Response.Write("Property: " + validationError.PropertyName + " Error: " + validationError.ErrorMessage);
                            }
                        }
                    }
                    //ViewBag.Patient_Relation_No = new SelectList(db.Patient_Relation, "Patient_Relation_Id", "Patient_Relation_Name");
                    return RedirectToAction("EditDonor");
                }

            }
            else
            {
                ViewBag.data = "The National Id Provided is Existed";
            }
            ViewBag.Patient_Relation_No = new SelectList(db.Patient_Relation, "Patient_Relation_Id", "Patient_Relation_Name", Patient_Relation_No);
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
        public ActionResult DonateAgain(char DonateType, string Patient_Relation_No, string Patiant_Name)
        {
            ViewBag.Patient_Relation_No = new SelectList(db.Patient_Relation, "Patient_Relation_Id", "Patient_Relation_Name");
            Donor d = db.Donors.Find(GetUrlId());
            Patient p = new Patient();
            DateTime firstDonation = (DateTime)d.Date;
            int weeks=Convert.ToInt32((DateTime.Now - firstDonation).TotalDays / 7);
            //int monthsApart = 12 * (DateTime.Now.Year - firstDonation.Year) + DateTime.Now - firstDonation.Month;
            if (weeks >= 2)
            {
                if(DonateType == 'P')
                {
                    if (string.IsNullOrWhiteSpace(Patiant_Name))
                        ModelState.AddModelError("Patiant_Name", "Please Enter Patient Name");
                    else
                        p.Patiant_Name = Patiant_Name;
                    if (Patient_Relation_No == "")
                        ModelState.AddModelError("Patient_Relation_No", "Select Patient Relation");
                    else
                        p.Patient_Relation_No = int.Parse(Patient_Relation_No);
                }
                if (ModelState.IsValid)
                {
                    db.Patients.Add(p);
                    db.SaveChanges();
                    d.Patient_No = p.Patiant_Id;
                    d.CanDonate = 1;
                    d.Date = DateTime.Now;
                    d.Donate_Type = DonateType.ToString();
                    db.Entry(d).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();
                    TempData["msg"] = "Donated Successdfully";
                    return RedirectToAction("Index", "Donor");
                }
                else
                    return View();
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
            if (d.Patient_No == null)
            {
                ViewBag.Patient_Relation_No = new SelectList(db.Patient_Relation, "Patient_Relation_Id", "Patient_Relation_Name");
            }
            else
               ViewBag.Patient_Relation_No = new SelectList(db.Patient_Relation, "Patient_Relation_Id", "Patient_Relation_Name", d.Patient.Patient_Relation_No);        
            return View(d);
        }
        [HttpPost]
        public ActionResult Edit(Donor obj,string Patient_Relation_No)
        {
            int age = CalculateAge(obj.Date_of_Birth);
            if (obj.Donate_Type == "P")
            {
                if (string.IsNullOrWhiteSpace(obj.Patient.Patiant_Name))
                    ModelState.AddModelError("Patient_Name", "Please Enter Patient Name");
                if (Patient_Relation_No == null)
                    ModelState.AddModelError("Patient_Relation_No", "Select Patient Relation");
            }
            if (age < 20 || age > 50)
            {
                ModelState.AddModelError("Date_of_Birth", "Donor Age is Not Valid");
            }
            if (ModelState.IsValid)
            {
                if (obj.Donate_Type == "P")
                {
                    Patient p = new Patient();
                    p.Patiant_Name = obj.Patient.Patiant_Name;
                    p.Patient_Relation_No = int.Parse(Patient_Relation_No);
                    db.Patients.Add(p);
                    db.SaveChanges();
                    obj.Patient_No = p.Patiant_Id;
                }
                obj.User_No = int.Parse(Session["UserId"].ToString());
                db.Entry(obj).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("EditDonor");
            }                
            ViewBag.Patient_Relation_No = new SelectList(db.Patient_Relation, "Patient_Relation_Id", "Patient_Relation_Name", Patient_Relation_No);
            return View();
        }
        public ActionResult Index()        
        {           
            return View();
        }
  
        [AllowAnonymous]
        public JsonResult SearchNId(string NatId)
        {
            var data = db.Donors.Where(x => x.National_ID.Contains(NatId) && x.CanDonate==0).Select(x => new
            {
                x.Donar_Id,
                x.National_ID,
                x.First_Name,
                x.Last_Name,
                x.Donate_Type,
                x.Patient.Patiant_Name
            }).ToList();
            return Json(data,JsonRequestBehavior.AllowGet);
        }
        public ActionResult Withdrawal()
        {
            List<vwStatusInfo> vw = new List<vwStatusInfo>();
            vw = db.vwStatusInfoes.Where(x => x.Blood_Status_No == true).ToList();
            return View(vw);
        }
        [HttpPost]
        public ActionResult Withdrawal(int Collection,int Donor_No)
        {
            Incoming_Blood inc = new Incoming_Blood();         
            Donor donor = new Donor();
            inc = GetIncominginfo(Collection);
            donor = GetDonorInfo(Donor_No);
            Outgoing_Blood outg = new Outgoing_Blood();
            inc.IsUsed = true;
            db.Entry(inc).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            outg.Collection_No = Collection;
            outg.Patient_No = (int)donor.Patient_No;
            outg.Date = DateTime.Now;
            db.Outgoing_Blood.Add(outg);
            db.SaveChanges();
            TempData["msg"] = "Checkout Successdfully";
            return View();
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
        [NonAction]
        public void UpdateCanDonate(int Donor_Id)
        {
            Donor donor = db.Donors.Find(Donor_Id);
            donor.CanDonate = 0;
            db.Entry(donor).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }
        [NonAction]
        public Incoming_Blood GetIncominginfo(int collectionId)
        {
            Incoming_Blood inc = db.Incoming_Blood.Where(i => i.Collection_No == collectionId).FirstOrDefault();
            return inc;
        }
        [NonAction]
        public Donor GetDonorInfo(int DonorId)
        {
            Donor d = db.Donors.Find(DonorId);
            return d;
        }
    }
}