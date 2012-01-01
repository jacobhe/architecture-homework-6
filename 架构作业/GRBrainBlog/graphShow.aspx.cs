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

public partial class graphShow : System.Web.UI.Page
{
    public string groupStr = "";//所有相片的显示字符串
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = Implement.GetAllCategory();//获取所有类别
            int i = 0;
            for (int x = 0; x < dt.Rows.Count; x++)//遍历每个类别，显示所有图片
            {
                i++;
                DataRow dr = dt.Rows[x];
                DataTable dt2 = Implement.GetCatePic(dr["id"].ToString());
                groupStr += "<div><h3 onclick=\"showgroup('group" + i.ToString() + "')\"> "+dr["name"].ToString()+"</h3><ul id=\"group" + i.ToString() + "\">";
                //把每个图片都添加到字符串中
                for (int y = 0; y < dt2.Rows.Count; y++)
                {
                    DataRow dr2 = dt2.Rows[y];
                    groupStr += "<li><a title=\"" + dr2["desc"].ToString() + "\" href=\"" + dr2["url"].ToString() + "\" rel=\"lightbox[" + i + "]\">" + dr2["name"].ToString() + "      --上传者： " + dr2["userName"].ToString() + "</a></li>";
                }
                groupStr += "</ul></div>";
            }
        }
    }
}
