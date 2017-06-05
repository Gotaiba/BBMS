using BBMS.Controllers;
using BBMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace BBMS
{
    public class MvcApplication : System.Web.HttpApplication
    {
        BBMSdbEntities db = new BBMSdbEntities();
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        { 
            if (Request.IsAuthenticated)
            {
                string Ident = User.Identity.Name.ToString();
                string[] roles = null;               
                var authType = db.Users.Where(r => r.Username == User.Identity.Name.ToString()).FirstOrDefault().Authority;            
                if (authType == 1)
                {
                    roles = new string[] { "Admin" };
                }
                else if (authType == 2)
                {
                    roles = new string[] { "Doctor" };
                }
                else if (authType == 3)
                {
                    roles = new string[] { "Nurse" };
                }
                else if(authType==4)
                {
                    roles = new string[] { "Receptionist" };
                }                                  
                Context.User = new System.Security.Principal.GenericPrincipal(User.Identity, roles);
            }

        }
    }
}
