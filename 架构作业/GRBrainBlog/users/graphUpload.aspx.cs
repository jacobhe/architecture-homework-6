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

public partial class users_graphUpload : System.Web.UI.Page
{
    //上传图片
    protected void Button1_Click1(object sender, EventArgs e)
    {
        //上传文件
        string msg;
        if (Session["UserLoginName"] != null)
        {
            string userName = Convert.ToString(Session["UserLoginName"].ToString());
            //string userName = "rongrong";
           // Response.Write(userName);
            int result = Implement.UpLoad(FileUpload1, TextBox1.Text, TextBox2.Text, DropDownList1.SelectedValue, userName);
            if (result != 2)//如果出现错误，提示
                msg = "alert('上传出现错误')";
            else
                msg = "alert('上传成功')";

        }
        else
        {   //Response.Redirect("Article_List.aspx");
            //string url = "Article_List.aspx";
            // Response.Write("<a href=" + url + ">请先登录！</a>");
            msg = "alert('您还未登陆！')";
        }
         ClientScript.RegisterStartupScript(this.GetType(), "asdf", msg, true);
    }
}