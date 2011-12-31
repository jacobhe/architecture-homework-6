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
public partial class Inc_ArticleCunDang : System.Web.UI.UserControl
{
    SqlConnection conn = SqlHelper.creation();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string sql = "select convert(varchar(10),b_time,120) from content order by b_id desc";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            da.Fill(ds, "content");
            this.DataList1.DataSource = ds.Tables["content"].DefaultView;
            this.DataList1.DataBind();
            conn.Close();
        }
    }
}
