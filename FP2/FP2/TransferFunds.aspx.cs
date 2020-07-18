using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FP2.DAL;

namespace FP2
{
    public partial class TransferFunds : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void validate(object sender , EventArgs e)
        {
            myDAL objmydal = new myDAL();

            int seAccountno = 0;
            Int32.TryParse(Session["AccountNo"].ToString(), out seAccountno);
            
            int reAccountno = 0;
            Int32.TryParse(TextBox1.Text, out reAccountno);

            int amount = 0;
            Int32.TryParse(TextBox2.Text, out amount);

            int b = objmydal.validate_transfer_dal(seAccountno, reAccountno, amount);

            if (b == 0)
                emessage.Text = "Transfer Successful.";
            else if (b == -1)
                emessage.Text = "Error in execution.";
            else if (b == 1)
                emessage.Text = "Reciever Account No not found.";
            else if (b == 2)
                emessage.Text = "Not enough balance in your account.";
            else if (b == 3)
                emessage.Text = "Not enough cash in dispenser.";


        }
    }
}