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
public partial class Inc_Register : System.Web.UI.Page
{
    SqlConnection conn = SqlHelper.creation();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (IsValid)
        {
            string Username=TextBox1 .Text .Trim ();
            string Userpass=TextBox2 .Text .Trim ();
            string usersex = DropDownList1.SelectedItem.Text.ToString();
            string email=TextBox4 .Text .Trim ();
            string question = DropDownList2.SelectedItem.Text.ToString();
            string answer=TextBox8 .Text .Trim ();
            string beizhu=TextBox7 .Text .Trim ();
            string riqi=TextBox5 .Text .Trim ();
            string dizhi=TextBox6 .Text .Trim ();
            string sqlinsert = "insert into Users(UserName,UserPass,UserSex,UserEmail,Question,Answer,UserBeizhu,UserBirthday,UserAddress) values('" + Username + "','" + Userpass + "','" + usersex + "','" + email + "','" + question + "','" + answer + "','" + beizhu + "','" + riqi + "','" + dizhi + "')";
            SqlCommand InsertCmd = new SqlCommand(sqlinsert, conn);
            conn.Open();
            InsertCmd.ExecuteNonQuery();
            conn.Close();
            Page.RegisterStartupScript("mm", "<script>alert('注册成功！')</script>");
            this.Label1.Text = "请记录好的安全问题答案，以便日后查找密码！:" + "你的安全问题答案为：" + TextBox8.Text;
            TextBox8.Text = "";
            TextBox7.Text = "";
            TextBox6.Text = "";
            TextBox5.Text = "";
            TextBox4.Text = "";
            TextBox2.Text = "";
            TextBox1.Text = "";
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox8.Text = "";
        TextBox7.Text = "";
        TextBox6.Text = "";
        TextBox5.Text = "";
        TextBox4.Text = "";
        TextBox2.Text = "";
        TextBox1.Text = "";
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string sql = "select * from Users where UserName='" + TextBox1.Text.Trim() + "'";
        SqlCommand cmdsql = new SqlCommand(sql, conn);
        conn.Open();
        SqlDataReader dr = cmdsql.ExecuteReader();
        if (dr.Read())
        {
            //Page.RegisterStartupScript("mm", "<script>alert('用户名已被注册,请更换！')</script>");
            this.Label2.Text = "用户名已被注册！";
            TextBox1.Text = "";
        }
        else
        {

            this.Label2.Text = "用户名可以注册！";
        }
        dr.Close();
        conn.Close();
    }
}
