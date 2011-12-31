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
public partial class ShowPic : System.Web.UI.Page
{
    public DataRow dr;
    SqlConnection conn = SqlHelper.creation();
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["b_id"].ToString());

        string sqlstr = "select * from content where b_id=" + id;
        SqlCommand cmd = new SqlCommand(sqlstr, conn);
        SqlDataAdapter da = new SqlDataAdapter(sqlstr, conn);
        DataSet ds = new DataSet();
        da.Fill(ds, "content");
        dr = ds.Tables["content"].Rows[0];
        FormView1.DataSource = ds.Tables["content"].DefaultView;
        FormView1.DataBind();
    }
}
