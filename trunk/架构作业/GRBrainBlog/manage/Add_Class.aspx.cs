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
public partial class manage_Add_Class : System.Web.UI.Page
{
    SqlConnection conn = SqlHelper.creation();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Page.RegisterStartupScript("mm", "<script>alert('类别不能为空！')</script>");

        }
        else
        {
            string sqlinsert = "insert into class (class_name) values('" + this.TextBox1.Text.ToString().Trim() + "')";
            SqlCommand cmd = new SqlCommand(sqlinsert, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Page.RegisterStartupScript("ms", "<script>alert('添加成功！')</script>");
            this.TextBox1.Text = "";
        }
    }
}
