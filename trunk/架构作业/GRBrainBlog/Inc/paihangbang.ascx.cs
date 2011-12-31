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
public partial class Inc_paihangbang : System.Web.UI.UserControl
{
    SqlConnection conn = SqlHelper.creation();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string sql = "select top 10 * from content order by b_id desc";
            //SqlCommand cmd = new SqlCommand(sql, conn);
            //conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "content");
            GridView1.DataSource = ds.Tables["content"].DefaultView;
            GridView1.DataBind();
            //SqlDataReader dr = cmd.ExecuteReader();
            //this.GridView1 .DataSource = dr;
            //this.GridView1 .DataBind();
            conn.Close();
        }
        
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int ordid = e.Row.RowIndex + 1;
        e.Row.Cells[0].Text = ordid.ToString();
    }
    public string CutString(string content)
    {
        if (content.Length > 10)
        {
            return content.Substring(0, 10) + ".....";
        }
        else
        {
            return content;
        }
    }
}
