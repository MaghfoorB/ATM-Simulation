using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FP2.DAL;

namespace FP2
{
    public partial class Transactions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            myDAL objmydal = new myDAL();
            int ac;
            if (Session["AccountNo"] != null)        //if logged in
            {
                Int32.TryParse(Session["AccountNo"].ToString(), out ac);

                grid1.DataSource = objmydal.transfers(ac);
                grid1.DataBind();
                grid2.DataSource = objmydal.withdrawals(ac);
                grid2.DataBind();
            }
        }
    }
}