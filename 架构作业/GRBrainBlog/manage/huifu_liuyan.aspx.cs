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
public partial class manage_huifu_liuyan : System.Web.UI.Page
{
    SqlConnection conn = SqlHelper.creation();

    protected void Page_Load(object sender, EventArgs e)
    {
        string ID = Convert.ToString(Request.QueryString["m_id"]);
        string sql = "select * from message where m_id=" + ID;
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            TextBox2.Text = dr["m_name"].ToString();
            TextBox3.Text = dr["m_subject"].ToString();
            TextBox4.Text = dr["m_content"].ToString();
        }
        dr.Close();
        conn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string ID = Convert.ToString(Request.QueryString["m_id"]);
        string sqlstr = "update message set m_reply='" + TextBox1.Text.Trim() + "' where m_id=" + ID;
        SqlCommand cmdstr = new SqlCommand(sqlstr, conn);
        conn.Open();
        cmdstr.ExecuteNonQuery();
        conn.Close();
        Response.Redirect("CK_liuyan.aspx");
    }
}
