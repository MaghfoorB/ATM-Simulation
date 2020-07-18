using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using FP2.DAL;

namespace FP2
{
    public partial class SuspendUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void suspend_bal(object sender, EventArgs e)
        {
            string ac = TextBox1.Text;
            int accno;
            Int32.TryParse(ac, out accno);
            myDAL objmydal = new myDAL();
            int b = objmydal.suspend_dal(accno);

            if (b == 0)
                label1.Text = "Successfull";
            else if (b == 1)
                label1.Text = "Account Number not found";
            else label1.Text = "Error in execution";

        }
    }
}