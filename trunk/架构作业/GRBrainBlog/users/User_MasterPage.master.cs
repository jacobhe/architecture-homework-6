using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class users_User_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserLoginName"] == null)
        {
            Response.Redirect("../index.aspx");
        }
        if (!IsPostBack)
        {
            this.Label1.Text = Session["UserLoginName"].ToString(); ;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("../index.aspx");
    }
}
