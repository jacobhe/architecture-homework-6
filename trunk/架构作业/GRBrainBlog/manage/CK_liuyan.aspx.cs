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
public partial class manage_CK_liuyan : System.Web.UI.Page
{
    SqlConnection conn = SqlHelper.creation();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.messbind();
        }
        
    }
    public void messbind()
    {
        string sqlstr = "select * from message order by m_datetime desc";
        SqlDataAdapter da = new SqlDataAdapter(sqlstr, conn);
        da.Fill(ds, "message");
        this.DataGrid1.DataSource = ds;
        this.DataGrid1.DataKeyField = "m_id";
        this.DataGrid1.DataBind();
        conn.Close();
    }
    protected void DataGrid1_DeleteCommand(object source, DataGridCommandEventArgs e)
    {
        string  id = this.DataGrid1.DataKeys[e.Item.ItemIndex].ToString();
        string sqldel = "delete from message where m_id=" + id;
        SqlCommand cmdel = new SqlCommand(sqldel, conn);
        conn.Open();
        cmdel.ExecuteNonQuery();
        conn.Close();
        Page.RegisterStartupScript("mm", "<script>alet('删除成功！')</script>");
        this.messbind();

    }
    protected void DataGrid1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        this.DataGrid1.CurrentPageIndex = e.NewPageIndex;
        this.messbind();
    }
    protected void DataGrid1_ItemCreated(object sender, DataGridItemEventArgs e)
    {
        LinkButton del = new LinkButton();
        switch (e.Item.ItemType)
        {

            case (ListItemType.Item):

                del = (System.Web.UI.WebControls.LinkButton)e.Item.FindControl("CmdDel");
                del.Attributes.Add("OnClick", "return confirm('确定要删除吗？');");
                break;

            case (ListItemType.AlternatingItem):

                del = (System.Web.UI.WebControls.LinkButton)e.Item.FindControl("CmdDel");
                del.Attributes.Add("OnClick", "return confirm('确定要删除吗？');");
                break;
        } 
    }
}
