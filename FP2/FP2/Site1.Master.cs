using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FP2
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {   
            if (!IsPostBack)
            {
                if (Session["AccountNo"] == null)
                    Response.Redirect("SignIn.aspx");
                else
                {
                    Response.ClearHeaders();
                    Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                    Response.AddHeader("Pragma", "no-cache");
                }
            }
            
        }

        public void home_button(object sender, EventArgs e)
        {
            if (Session["AccountNo"].ToString() == "10")
                Response.Redirect("Admin.aspx");
            else Response.Redirect("Home.aspx");
        }
       
    }
}