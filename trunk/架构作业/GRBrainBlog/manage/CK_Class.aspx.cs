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
public partial class manage_CK_Class : System.Web.UI.Page
{
    SqlConnection conn = SqlHelper.creation();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.setbind();
        }
    }
    public void setbind()
    {
        string sqlsel = "select * from class order by class_id desc";
        SqlCommand cmd = new SqlCommand(sqlsel, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        this.DataGrid1.DataKeyField = "class_id";//5|1|a|s|p|x
        this.DataGrid1.DataSource = dr;
        this.DataGrid1.DataBind();
        conn.Close();
        
    }
    protected void DataGrid1_CancelCommand(object source, DataGridCommandEventArgs e)
    {
        this.DataGrid1.EditItemIndex = -1;
        this.setbind();

    }
    protected void DataGrid1_DeleteCommand(object source, DataGridCommandEventArgs e)
    {
        string ID = this.DataGrid1.DataKeys[e.Item.ItemIndex].ToString();
        string sqldel = "delete from class where class_id=" + ID;
        conn.Open();
        SqlCommand cmddel = new SqlCommand(sqldel, conn);
        cmddel.ExecuteNonQuery();
        conn.Close();
        Page.RegisterStartupScript("ms", "<script>alert('删除成功！')</script>");
        this.setbind();
    }
    protected void DataGrid1_EditCommand(object source, DataGridCommandEventArgs e)
    {
        this.DataGrid1.EditItemIndex = e.Item.ItemIndex;
        this.setbind();
    }
    protected void DataGrid1_UpdateCommand(object source, DataGridCommandEventArgs e)
    {
        string ID = this.DataGrid1.DataKeys[e.Item.ItemIndex].ToString();
        string classname = ((TextBox)e.Item.Cells[1].Controls[0]).Text;
        string sqlupdate = "update class set class_name='" + classname + "' where class_id=" + ID;
        conn.Open();
        SqlCommand cmdup = new SqlCommand(sqlupdate, conn);
        cmdup.ExecuteNonQuery();
        conn.Close();
        this.DataGrid1.EditItemIndex = -1;
        this.setbind();
        Page.RegisterStartupScript("ms", "<script>alert('更新成功！')</script>");
    }
    protected void DataGrid1_ItemDataBound(object sender, DataGridItemEventArgs e)
    {

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
