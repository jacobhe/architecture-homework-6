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

public partial class findpass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //Response.Cookies["key"].Value = this.TextBox1.Text.Trim();//51&aspx
       // Response.Redirect("passresult.aspx");

        Session["key"] = this.TextBox1.Text.Trim();
        Server.Transfer("passresult.aspx"); 
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnection conn = SqlHelper.creation();
        string sqlstr = Convert.ToString(this.TextBox2.Text.Trim());
        string sql = "select * from Users where UserName = '" + sqlstr + "' ";
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            this.Label3.Text = "问题 ： " + dr["Question"].ToString();
            dr.Close();
            conn.Close();
        }
        else
        {
            Label3.Text = "对不起，您还没有注册，请先注册！";
        }

    }
}
