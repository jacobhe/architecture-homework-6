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
public partial class About : System.Web.UI.Page
{
    SqlConnection conn = SqlHelper.creation();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            this.GWbind();
        }
    }
    public void GWbind()//绑定main文章
    {
        int curpage = Convert.ToInt32(this.labPage.Text);
        PagedDataSource ps = new PagedDataSource();
        conn.Open();


        string sql = "select * from content order by b_id desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, conn);
        da.Fill(ds, "content");
        ps.DataSource = ds.Tables["content"].DefaultView;
        ps.AllowPaging = true; //是否可以分页 
        ps.PageSize = 30; //显示的数量 
        ps.CurrentPageIndex = curpage - 1; //取得当前页的页码 
        this.lnkbtnUp.Enabled = true;
        this.lnkbtnNext.Enabled = true;
        this.lnkbtnBack.Enabled = true;
        this.lnkbtnOne.Enabled = true;
        if (curpage == 1)
        {
            this.lnkbtnOne.Enabled = false;//不显示第一页按钮 
            this.lnkbtnUp.Enabled = false;//不显示上一页按钮 
        }

        if (curpage == ps.PageCount)
        {
            this.lnkbtnNext.Enabled = false;//不显示下一页 
            this.lnkbtnBack.Enabled = false;//不显示最后一页 
        }
        this.labBackPage.Text = Convert.ToString(ps.PageCount);//51@aspx
        this.DataList1.DataSource = ps;
        this.DataList1.DataKeyField = "b_id";
        this.DataList1.DataBind();
        conn.Close();
    }
    protected void lnkbtnOne_Click(object sender, EventArgs e)
    {
        this.labPage.Text = "1";
        this.GWbind();
    }
    protected void lnkbtnUp_Click(object sender, EventArgs e)
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) - 1);
        this.GWbind();
    }
    protected void lnkbtnNext_Click(object sender, EventArgs e)
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) + 1);
        this.GWbind();
    }
    protected void lnkbtnBack_Click(object sender, EventArgs e)
    {
        this.labPage.Text = this.labBackPage.Text;
        this.GWbind();
    }
}
