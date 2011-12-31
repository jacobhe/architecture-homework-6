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
public partial class manage_Default : System.Web.UI.Page
{
    SqlConnection conn = SqlHelper.creation();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (TextBox1.Text == "")
        {
            Page.RegisterStartupScript("ms", "<script>alert('用户名不能为空！')</script>");
        }
        else if (TextBox2.Text == "")
        {

            Page.RegisterStartupScript("ms", "<script>alert('密码不能为空！')</script>");
        }
        else
        {
            string sql = "select * from Users where UserName='" + this.TextBox1.Text.Replace('"', '"') + "'and UserPass='" + this.TextBox2.Text.Replace('"', '"') + "'";
            SqlCommand cmd = new SqlCommand(sql, conn);
            try
            {
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Session["UserPower"] = dr["UserPower"].ToString();

                    if (Session["UserPower"].ToString() == "0")
                    {
                        Session["username"] = dr["UserName"].ToString();
                        Response.Redirect("admin_index.aspx");
                        dr.Close();
                        conn.Close();
                    }
                    else
                    {
                        Page.RegisterStartupScript("ms", "<script>alert('权限不正确,请联系管理员！')</script>");
                    }
                }
                else
                {

                    Page.RegisterStartupScript("ms", "<script>alert('对不起，用户名或密码错误！')</script>");
                    this.TextBox2.Text = "";
                    TextBox1.Text = "";
                }


            }
            catch (SqlException ex)
            {
                Page.RegisterStartupScript("ms", "<script>alert('对不起，用户名或密码错误！')</script>");
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
    }
}
