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
public partial class manage_graph : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            myDataBind();//绑定数据
        }
    }
    //分页
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        myDataBind();
    }
    //删除
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "del")
        {
            string id = e.CommandArgument.ToString();
            try
            {
                Implement.DeletePicCate (id);
                myDataBind();
            }
            catch
            { }
        }
    }
    //绑定数据源
    private void myDataBind()
    {
        GridView1.DataSource = Implement.GetAllCategory();
        GridView1.DataBind();
    }
  //添加类别
    protected void Button1_Click(object sender, EventArgs e) 
    {
        bool  result;
        result = Implement.AddCategory(TextBox1.Text, TextBox2.Text, TextBox3.Text);
        string msg = "alert('操作错误！')";
        if (result)//如果操作成功，提示
        {
            TextBox3.Text = TextBox2.Text = TextBox1.Text = "";
            msg = "alert('操作成功！')";
            myDataBind();
        }
        //客户端提示
        ClientScript.RegisterStartupScript(this.GetType(), "asdf", msg, true);
    }
}
