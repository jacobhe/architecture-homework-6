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
public partial class search : System.Web.UI.Page
{
    SqlConnection conn = SqlHelper.creation();
    protected void Page_Load(object sender, EventArgs e)
    {
        string result = Request.Cookies["key"].Value;
       
        string sql = "select * from content where b_title like '%" + result + "%'";
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        this.DataList1 .DataSource = dr;
        this.DataList1  .DataBind();
        dr.Close();
        conn.Close();
        if (this.DataList1 .Items .Count== 0)
        {

            this.Label1.Text = "对不起，没有找到符合条件的文章！";
            
        }
    }
}
