using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using FP2.DAL;

namespace FP2
{

    public partial class SignIn : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //functions in here automatically get called every time the page is loaded

            if (Session["AccountNo"] != null)       //if logged in
            {
                if (Session["AccountNo"].ToString() == "10")
                    Response.Redirect("Admin.aspx");
                else Response.Redirect("Home.aspx");
            }
            else
            {
                Session.Clear();
                FormsAuthentication.SignOut();
            }
        }

        public void authenticate_bal(object sender, EventArgs e)
        {
   
            myDAL objmydal = new myDAL();

            int a = 0;
            Int32.TryParse(accountno.Text, out a);  //convert to int
            
            int p = 0;
            Int32.TryParse(pin.Text, out p);        //convert to int
            
            int b;
            b = objmydal.authenticate_dal(a, p);

            if (b == 0)
            {
                Session["AccountNo"] = accountno.Text;

                if (a == 10)
                    Response.Redirect("Admin.aspx");
                else Response.Redirect("Home.aspx");     //authenticated
            }
            else if (b == -1)
                errorMessage.Text = "Error in execution";
            else if (b == 1)
                errorMessage.Text = "Account Number not found";
            else if (b == 2)
                errorMessage.Text = "You have been blocked from the machine";
            else if (b == 3)
                errorMessage.Text = "Incorrect PIN";
            
        }

    }
}