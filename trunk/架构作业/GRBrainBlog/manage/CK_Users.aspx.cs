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
public partial class manage_CK_Users : System.Web.UI.Page
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
        string sql = "select * from Users order by User_ID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, conn);

        DataSet ds = new DataSet();
        da.Fill(ds, "Users");
        this.DataGrid1.DataKeyField = "User_ID";
        this.DataGrid1.DataSource = ds.Tables["Users"].DefaultView;
        this.DataGrid1.DataBind();
        conn.Close();

    }
    protected void DataGrid1_CancelCommand(object source, DataGridCommandEventArgs e)
    {
        this.DataGrid1.EditItemIndex = -1;
        this.bind();
    }
    protected void DataGrid1_EditCommand(object source, DataGridCommandEventArgs e)
    {
        this.DataGrid1.EditItemIndex = e.Item.ItemIndex;
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
    protected void DataGrid1_UpdateCommand(object source, DataGridCommandEventArgs e)
    {
        string ID = this.DataGrid1.DataKeys[e.Item.ItemIndex].ToString();
        string name = ((TextBox)e.Item.Cells[1].Controls[0]).Text;
        string  passtext = ((TextBox)e.Item.Cells[2].Controls[0]).Text;
        string power = ((TextBox)e.Item.Cells[3].Controls[0]).Text;
        string sqlupdate = "update Users set UserName='" + name + "',UserPass='"+passtext +"' ,UserPower='"+power+"' where User_ID=" + ID;
        conn.Open();
        SqlCommand cmdup = new SqlCommand(sqlupdate, conn);
        cmdup.ExecuteNonQuery();
        conn.Close();
        this.DataGrid1.EditItemIndex = -1;
        this.bind();
        Page.RegisterStartupScript("ms", "<script>alert('更新成功！')</script>");
    }
    protected void DataGrid1_DeleteCommand(object source, DataGridCommandEventArgs e)
    {
        string strID = this.DataGrid1.DataKeys[e.Item.ItemIndex].ToString();
        string sqlstrDel = "delete from Users where User_ID=" + strID;
        conn.Open();
        SqlCommand cmddel = new SqlCommand(sqlstrDel, conn);
        cmddel.ExecuteNonQuery();
        conn.Close();
        Page.RegisterStartupScript("ms", "<script>alert('删除成功！')</script>");
        this.bind();
    }
    protected void DataGrid1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        this.DataGrid1.CurrentPageIndex = e.NewPageIndex;
        this.bind();
    }
   
   
}
