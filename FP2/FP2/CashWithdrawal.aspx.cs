using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FP2.DAL;

namespace FP2
{
    public partial class CashWithdrawal : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        bool IsDigitsOnly(string str)
        {
            foreach (char c in str)
            {
                if (c < '0' || c > '9')
                    return false;
            }

            return true;
        }
        
        public void reset(object sender , EventArgs e)
        {
            TextBox1.Text = "";
        }
        
        public void validate_amount_bal(object sender, EventArgs e)
        {
            string amount = TextBox1.Text.ToString();
            
            if (IsDigitsOnly(amount) && !string.IsNullOrEmpty(amount) && amount.Length < 8)
            {
                myDAL objmydal = new myDAL();
                
                int ac = 0;
                Int32.TryParse(Session["AccountNo"].ToString(), out ac);

                int am = 0;
                Int32.TryParse(amount, out am);

                int b = objmydal.validate_amount_dal(ac, am);

                if (b == 0)
                    label1.Text = "Withdrawal Successful";
                else if (b == -1)
                    label1.Text = "Error in execution";
                else if (b == 1)
                    label1.Text = "Not enough balance in your account";
                else if (b == 2)
                    label1.Text = "Not enough cash in dispenser";
                
            }
            else label1.Text = "Incorrect Amount";

        }

        public void validate_Amount_bal2(object sender, EventArgs e)
        {
            myDAL objmydal = new myDAL();

            Button button = (Button)sender;
            string buttonId = button.ID;
            
            int ac = 0;
            Int32.TryParse(Session["AccountNo"].ToString(), out ac);

            int am = 0;

            if (buttonId == "Button4")
                am = 1000;
            else if (buttonId == "Button3")
                am = 5000;
            else if (buttonId == "Button2")
                am = 15000;
            else if (buttonId == "Button1")
                am = 20000;

            int b = objmydal.validate_amount_dal(ac, am);

            label1.Text = b.ToString();         //if b == 0 redirect to withdrawal success page

        }
    }
}