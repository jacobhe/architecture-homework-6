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
public partial class test : System.Web.UI.Page
{
    SqlConnection conn = SqlHelper.creation();
    protected void Page_Load(object sender, EventArgs e)
    {
        string sqlstr = Convert.ToString(Request.Cookies["key"].ToString());
        string sql = "select * from Users where Answer =" + sqlstr;
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            this.lbl_result.Text = dr["Answer"].ToString();
            dr.Close();
            conn.Close();
        }
        else
        {
            lbl_result.Text = "对不起，没有找到您的密码,请联系管理员！";
        }
    }
}
