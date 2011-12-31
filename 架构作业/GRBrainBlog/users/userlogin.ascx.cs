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
using System.Data.SqlClient;
public partial class users_userlogin : System.Web.UI.UserControl
{
    SqlConnection conn = SqlHelper.creation();

    public string url;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            this.Panel_Login.Visible = true;
            this.Panel_Ok.Visible = false;
            
        }
        if (Session["UserLoginName"] != null)
        {
            this.Panel_Ok.Visible = true;
            
            this.Label1.Text = Session["UserLoginName"].ToString();
            this.Panel_Login .Visible =false ;
        }
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (TextBox1.Text == "")
            {
                Page.RegisterStartupScript("mm", "<script>alert('用户名不能为空！')</script>");
            }
            else if (TextBox2.Text == "")
            {

                Page.RegisterStartupScript("mm", "<script>alert('密码不能为空！')</script>");
            }
            else
            {
                string sql = "select User_ID, UserName,UserPass from Users where UserName='" + this.TextBox1.Text.Trim().Replace("'","'") + "' and UserPass='" + this.TextBox2.Text.Trim().Replace ("'","'") + "'";
                url = Request.UrlReferrer.ToString();
                try
                {
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    conn.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        Session["UserID"] = dr["User_ID"].ToString();
                        Session["UserLoginName"] = dr["UserName"].ToString();
                        this.Label1.Text = Session["UserLoginName"].ToString();
                        this.Panel_Login.Visible = false;
                        this.Panel_Ok.Visible = true;
                        dr.Close();
                        conn.Close();
                        Response.Redirect(url);

                    }
                    else
                    {

                        Page.RegisterStartupScript("mm", "<script>alert('登陆失败,请检查用户名或密码！')</script>");
                        this.TextBox1.Text = "";
                        this.TextBox2.Text = "";
                        
                    }

                }
                catch (SqlException err)
                {
                    Page.RegisterStartupScript("mm", "<script>alert('登陆失败！')</script>");
                    this.TextBox1.Text = "";
                    this.TextBox2.Text = "";
                }
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        this.TextBox1.Text = "";
        this.TextBox2.Text = "";
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("index.aspx");
    }
}
