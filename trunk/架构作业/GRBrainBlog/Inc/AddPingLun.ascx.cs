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
public partial class Inc_AddPingLun : System.Web.UI.UserControl
{
    SqlConnection conn = SqlHelper.creation();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Panel1.Visible = true;
        }
        if (Session["UserLoginName"] != null)
        {
            TextBox1.Text = Session["UserLoginName"].ToString();
            Panel1.Visible = false;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //int[] bowen_id = new int[2];
        if (Session["UserLoginName"].ToString() == "")
        {
            Response.Write("<script>alert('请登陆！')</script>");
        }
        else
        {
            TextBox1.Text = Session["UserLoginName"].ToString();
            int bowen_id = Convert.ToInt32(Request.QueryString["b_id"][0].ToString());
            string SqlStrping = "insert into reply (re_name,re_title,re_content,b_id) values('" + this.TextBox1.Text.Trim() + "','" + this.TextBox2.Text.Trim() + "','" + this.TextBox3.Text.Trim() + "','" + bowen_id + "')";
            SqlCommand cmdping = new SqlCommand(SqlStrping, conn);
            conn.Open();
            cmdping.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("index.aspx");
        }
        
    }
}
