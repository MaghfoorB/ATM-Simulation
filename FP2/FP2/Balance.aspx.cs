using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FP2.DAL;

namespace FP2
{
    public partial class Balance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AccountNo"] != null)       //if logged in
            {
                myDAL objmydal = new myDAL();

                int accountNo;
                Int32.TryParse(Session["AccountNo"].ToString(), out accountNo);

                int b = objmydal.check_balance_dal(accountNo);

                if (b != -1)
                {
                    string bal = b.ToString();
                    string message = "Your current balance is Rs. ";
                    message = message + bal;
                    label.Text = message;
                }
                else label.Text = "Error in Execution";
            }
        }

    }
}