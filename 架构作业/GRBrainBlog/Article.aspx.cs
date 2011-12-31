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
public partial class Article : System.Web.UI.Page
{
    SqlConnection conn = SqlHelper.creation();
    public DataRow dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.GetArticle();
            //this.GetClass();
            this.datalistping();
        }
    }
    public string FormatString(string str)
    {
        str = str.Replace(" ", "&nbsp;&nbsp");//控制格式含数
        str = str.Replace("<", "&lt;");
        str = str.Replace(">", "&glt;");
        str = str.Replace('\n'.ToString(), "<br>");
        return str;
    }
    public void GetArticle()
    {
        int bowen_id = Convert.ToInt32(Request.QueryString["b_id"].ToString());
       
        SqlDataAdapter da = new SqlDataAdapter("select * from content where b_id=" + bowen_id, conn);
        DataSet ds = new DataSet();
        da.Fill(ds, "content");
        dr = ds.Tables["content"].Rows[0];
        this.FormView1.DataSource = ds.Tables["content"].DefaultView;
        this.FormView1.DataBind();
        SqlCommand clickcmd = new SqlCommand("select b_click from content where b_id=" + bowen_id, conn);//51^aspx
        clickcmd.Connection.Open();
        SqlDataReader reader = clickcmd.ExecuteReader();
        //将访问次数转换成整数，然后加1
        int i = Convert.ToInt32(dr["b_click"]);
        i++;
        reader.Close();
        //重新定义语句，更新访问次数

        clickcmd.CommandText = "update  content set b_click='" + i.ToString() + "'where b_id =" + bowen_id;
        clickcmd.ExecuteNonQuery();
        clickcmd.Connection.Close();
        conn.Close();
    }
    public void datalistping() //获取评论
    {
         int bowen_id = Convert.ToInt32(Request.QueryString["b_id"].ToString());
        string sqlping = "select * from reply where b_id="+bowen_id ;
        SqlDataAdapter daping = new SqlDataAdapter(sqlping, conn);
        DataSet dsping = new DataSet();
        daping.Fill(dsping, "reply");
        this.DataList1.DataSource = dsping.Tables["reply"].DefaultView;
        this.DataList1.DataBind();
        conn.Close();
    }
}
