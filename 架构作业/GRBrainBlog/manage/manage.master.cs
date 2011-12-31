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

public partial class manage_manage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
    //    if (Session["UserPower"].ToString() == "0")
    //    {

    //        this.Label1.Text = Session["username"].ToString();
    //        this.Label2.Text = "当前权限为：" + Session["UserPower"].ToString() + "为管理员";
    //    }
    //    else
    //    {
    //        //Response.Write("<script>alert('对不起，你是非法用户！')</script>");
    //        Response.Redirect("logon.aspx");
    //    }
        if (Session["UserPower"] == null || Session["username"].ToString() == "")
        {

            Response.Redirect("logon.aspx");
        }
        else if (Session["UserPower"].ToString() == "0")
        {
            this.Label1.Text = Session["username"].ToString();
            this.Label2.Text = "当前权限为：" + Session["UserPower"].ToString() + "为管理员";
        }
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("../index.aspx");
    }
}
