using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FP2.DAL;

namespace FP2
{
    public partial class ChangePin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void change_pin_bal(object sender, EventArgs e)
        {
            int currentPin;
            Int32.TryParse(TextBox1.Text, out currentPin);

            int newPin1;
            Int32.TryParse(TextBox2.Text, out newPin1);

            int newPin2;
            Int32.TryParse(TextBox3.Text, out newPin2);

            if (newPin1 != newPin2)
                label3.Text = "PIN Numbers don't match";
            else
            {
                myDAL objmydal = new myDAL();
                int accno;
                Int32.TryParse(Session["AccountNo"].ToString(), out accno); //get account number
                int b = objmydal.change_pin_dal(accno, currentPin, newPin1);

                if (b == 1)
                    label3.Text = "Old Pin Incorrect";
                else if (b == -1)
                    label3.Text = "Error in Execution";
                else
                    label3.Text = "PIN updated successfully";

            }
        }
    }
}