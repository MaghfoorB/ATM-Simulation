using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FP2.DAL;

namespace FP2
{
    public partial class AddCash : System.Web.UI.Page
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
        
        public void add_cash_bal(object sender, EventArgs e)
        {
            string s = TextBox1.Text;
            if (IsDigitsOnly(s) && !string.IsNullOrEmpty(s))
            {
                int amount;
                Int32.TryParse(s, out amount);
                if (amount != 0)
                {
                    myDAL objmydal = new myDAL();
                    int b = objmydal.add_cash_dal(amount);
                    if (b == 0)
                        label1.Text = "Successfully updated";
                    else label1.Text = "Error in execution";
                }
                else label1.Text = "Amount must be > 0";
            }
            else label1.Text = "Incorrect Amount";
        }
    }
}