using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BBMS.Models;

namespace Utils
{
    public class Class1
    {
        BBMSdbEntities db = new BBMSdbEntities();
        public Boolean HasVirus(int collectionId)
        {
            List<Virus> virus = new List<Virus>();
            virus = db.Viruses.Where(x => x.Collection_No == collectionId).ToList();
            if (virus.Count >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
