using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FP2.DAL;

namespace FP2
{
    public partial class AddAccount : System.Web.UI.Page
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
        
        public void add_user_bal(object sender, EventArgs e)
        {
            string uid = TextBox1.Text;
            string acno = TextBox2.Text;
            string bal = TextBox3.Text;

            if (IsDigitsOnly(uid) && IsDigitsOnly(acno) && IsDigitsOnly(bal) && !string.IsNullOrEmpty(uid) && !string.IsNullOrEmpty(acno) && !string.IsNullOrEmpty(bal))
            {
                int userid;
                Int32.TryParse(uid, out userid);

                int accno;
                Int32.TryParse(acno, out accno);

                int balance;
                Int32.TryParse(bal, out balance);

                if (balance <= 500)
                {
                    myDAL objmydal = new myDAL();

                    int b = objmydal.add_account_dal(userid, accno, balance);

                    if (b == 0)
                        label1.Text = "Account Added Successfully";
                    else if (b == 1)
                        label1.Text = "User ID not found in database";
                    else if (b == 2)
                        label1.Text = "Account Number already exists";
                    else if (b == -1)
                        label1.Text = "Error in execution";

                }
                else label1.Text = "Initial balance cannot be over 500";

            }
            else label1.Text = "Incorrect Values in Fields";

        }
    }
}