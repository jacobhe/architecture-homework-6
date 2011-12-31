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
public partial class manage_CK_pinglun : System.Web.UI.Page
{
    SqlConnection conn = SqlHelper.creation();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.dlbind();
        }
    }
    public void dlbind()
    {
        string sqlstr = "select * from reply order by re_id desc";
        SqlDataAdapter da = new SqlDataAdapter(sqlstr, conn);
        da.Fill(ds, "reply");
        this.DataGrid1.DataKeyField = "re_id";
        this.DataGrid1.DataSource = ds;
        this.DataGrid1.DataBind();
        conn.Close();
    }
    protected void DataGrid1_DeleteCommand(object source, DataGridCommandEventArgs e)
    {
        string strid = this.DataGrid1.DataKeys[e.Item.ItemIndex].ToString();
        string sqldel = "delete from reply where re_id=" + strid;
        SqlCommand cmddel = new SqlCommand(sqldel, conn);
        conn.Open();
        cmddel.ExecuteNonQuery();
        conn.Close();
        Page.RegisterStartupScript("ms","<script>alert('删除成功！')</script>");
        this.dlbind();
    }
    protected void DataGrid1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        this.DataGrid1.CurrentPageIndex = e.NewPageIndex;
        this.dlbind();
    }
    //protected void DataGrid1_ItemCreated(object sender, DataGridItemEventArgs e)
    //{
    //    //LinkButton del = new LinkButton();
    //    //switch (e.Item.ItemType)
    //    //{

    //    //    case (ListItemType.Item):

    //    //        del = (System.Web.UI.WebControls.LinkButton)e.Item.FindControl("cmdDel");
    //    //        del.Attributes.Add("OnClick", "return confirm('确定要删除吗？');");
    //    //        break;

    //    //    case (ListItemType.AlternatingItem):

    //    //        del = (System.Web.UI.WebControls.LinkButton)e.Item.FindControl("cmdDel");
    //    //        del.Attributes.Add("OnClick", "return confirm('确定要删除吗？');");
    //    //        break;
    //    //} 
    //}
}
