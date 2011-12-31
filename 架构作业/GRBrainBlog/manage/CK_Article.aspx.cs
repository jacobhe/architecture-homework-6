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
public partial class manage_CK_Article : System.Web.UI.Page
{
    SqlConnection conn = SqlHelper.creation();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.bind();
        }
    }
    public void bind()
    {
        string sql = "select * from content order by b_id desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, conn);

        DataSet ds = new DataSet();
        da.Fill(ds, "content");
        this.DataGrid1.DataKeyField = "b_id";
        this.DataGrid1.DataSource = ds.Tables["content"].DefaultView;
        this.DataGrid1.DataBind();
        conn.Close();

    }
    protected void DataGrid1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        this.DataGrid1.CurrentPageIndex = e.NewPageIndex;
        this.bind();
    }
    protected void DataGrid1_DeleteCommand(object source, DataGridCommandEventArgs e)
    {

        string strID = this.DataGrid1.DataKeys[e.Item.ItemIndex].ToString();
        string sqlstrDel = "delete from content where b_id=" + strID;
        conn.Open();
        SqlCommand cmddel = new SqlCommand(sqlstrDel, conn);
        cmddel.ExecuteNonQuery();
        conn.Close();
        Page.RegisterStartupScript("ms", "<script>alert('删除成功！')</script>");
        this.bind();
    }
    protected void DataGrid1_ItemCreated(object sender, DataGridItemEventArgs e)
    {
        LinkButton del = new LinkButton();
        switch (e.Item.ItemType)
        {

            case (ListItemType.Item):

                del = (System.Web.UI.WebControls.LinkButton)e.Item.FindControl("cmdDel");
                del.Attributes.Add("OnClick", "return confirm('确定要删除吗？');");
                break;

            case (ListItemType.AlternatingItem):

                del = (System.Web.UI.WebControls.LinkButton)e.Item.FindControl("cmdDel");
                del.Attributes.Add("OnClick", "return confirm('确定要删除吗？');");
                break;
        } 
    }
}
