using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Dapper;
using BBMS.Models;



namespace BBMS.Controllers
{
    public class ReportController : Controller
    {       
        // GET: Report        
        BBMSdbEntities db = new BBMSdbEntities();
        public ActionResult Donors()
        {                          
            return View();
        }
        [HttpPost]
        public ActionResult Donors(char? DonateType, DateTime? DateFrom, DateTime? DateTo)               
        {
            string sql = "Select * from vwRegisteredDonors Where 1=1 ";
            if(DonateType!=null)
            {
                sql+="And Donate_Type='" + DonateType + "'";
            }
            if(DateFrom != null && DateTo == null)
            {
                sql += " And Date>='" + DateFrom+"'";
            }
            if(DateFrom == null && DateTo != null)
            {
                sql += " And Date>='" + DateTo+"'";
            }
            if(DateFrom != null && DateTo != null)
            {
                sql += " And Date Between '" + DateFrom + "' And '" + DateTo + "'";
            }
            return View(db.Database.Connection.Query(sql).ToList());
        }
        public ActionResult DetailedDonor()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DetailedDonor(string IsUsed, double? RangeFrom, double? RangeTo, char? DonateType, DateTime? DateFrom, DateTime? DateTo)
        {
            string sql = "Select * from vwStatusInfo Where 1=1 ";
            if (DonateType != null)
            {
                sql += "And Donate_Type='" + DonateType + "'";
            }
            if (DateFrom != null && DateTo == null)
            {
                sql += " And Date>='" + DateFrom + "'";
            }
            if (DateFrom == null && DateTo != null)
            {
                sql += " And Date>='" + DateTo + "'";
            }
            if (DateFrom != null && DateTo != null)
            {
                sql += " And Date Between '" + DateFrom + "' And '" + DateTo + "'";
            }
            if (IsUsed != null)
            {
                sql += " And IsUsed='" + IsUsed + "'";
            }
            if (RangeFrom != null && RangeTo == null)
            {
                sql += " And Hemo >=" + RangeFrom;
            }
            if (RangeFrom == null && RangeTo != null)
            {
                sql += " And Hemo<=" + RangeTo;
            }
            if (RangeFrom != null && RangeTo != null)
            {
                sql += " And Hemo Between " + RangeFrom + " And " + RangeTo;
            }
            return View(db.Database.Connection.Query(sql).ToList());
        }
        public ActionResult BloodStock()
        {
            return View();
        }
        [HttpPost]
        public ActionResult BloodStock( string IsUsed,double? RangeFrom, double? RangeTo)
        {
            string sqlwhere = "";
            if (IsUsed != null)
            {
                sqlwhere = " And IsUsed='" + IsUsed+"'";
            }
            if (RangeFrom != null && RangeTo == null)
            {
                sqlwhere = " And Hemo >=" + RangeFrom;
            }
            if (RangeFrom == null && RangeTo != null)
            {
                sqlwhere = " And Hemo<=" + RangeTo;
            }
            if (RangeFrom != null && RangeTo != null)
            {
                sqlwhere = " And Hemo Between " + RangeFrom + " And " + RangeTo;
            }           
            string sql = string.Format("with TypeData as(select Type_Name, Donar_Id from vwIncomingInfo where 1=1 {0}), groupType as" +
" (select Type_Name, Donar_Id, case when Type_Name = 'A-' then 'A-'" +

                                 " When Type_Name = 'A+' then 'A+'" +

                                 " When Type_Name = 'B+' then 'B+'" +

                                 " When Type_Name = 'B-' then 'B-'" +

                                 " When Type_Name = 'O-' then 'O-'" +

                                 " When Type_Name = 'O+' then 'O+'" +

                                 " When Type_Name = 'AB+' then 'AB+'" +

                                 " Else 'AB-' End as TypeGroup" +

    " From TypeData as TypeData_1)" +

    " select count(Donar_Id) as Stock, TypeGroup" +

    " from groupType as groupType_1" +

    " Group by TypeGroup",sqlwhere);

            return View(db.Database.Connection.Query(sql).ToList());
        }
        public ActionResult InfectedBlood()
        {
            return View();
        }
        public ActionResult UserEntries()
        {
            return View();
        }
    }
}