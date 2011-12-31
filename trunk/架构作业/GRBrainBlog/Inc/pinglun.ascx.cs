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
public partial class Inc_pinglun : System.Web.UI.UserControl
{
    SqlConnection conn = SqlHelper.creation();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string sqlstrping = "select top 6 reply.* from reply order by re_id desc";
            SqlDataAdapter daping = new SqlDataAdapter(sqlstrping, conn);
            daping.Fill(ds, "reply");
            this.DataList1.DataSource = ds.Tables["reply"].DefaultView;
            this.DataList1.DataBind();
            conn.Close();
        }

    }
    public string CutString(string content)
    {
        if (content.Length > 150)
        {
            return content.Substring(0, 150) + ".......";
        }
        else
        {
            return content;
        }
    }
}
