using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
// 相册的业务层
public class Implement
{
    public Implement()
    {
    }
    //检验账号密码
    public static bool CheckPass(string username, string pass)
    {
        pass = Tools.Encrypt(pass, "12345678");//加密密码
        DataTable dt = DBQuery.OpenQuery("select adminid from admin where adminname='" + username + "' and adminpws='" + pass + "' ");
        if (dt.Rows.Count > 0)//密码正确
            return true;
        else
            return false;
    }
    //添加管理员
    public static bool AddAdmin(string username, string pass)
    {
        bool b = false;//操作成功与否的标志
        pass = Tools.Encrypt(pass, "12345678");//加密密码
        try
        {
            DBQuery.ExceuteNonQuery("insert into admin(adminname,adminpws)values('" + username + "','" + pass + "')");
            b = true;//操作成功
        }
        catch
        { }
        return b;
    }
    //上传图片,返回0失败；1保存上传文件和数据库操作有一项失败；2操作成功
    public static int UpLoad(FileUpload fu, string name,string desc,string group,string userName)
    {
        //string userName = Convert.ToString(Session["username"].ToString());
        int flag = 0;//操作成功与否的标志
        string exname = fu.FileName.Substring(fu.FileName.LastIndexOf("."));//上传文件的扩展名
        string newName = "uploadpic/" + Guid.NewGuid().ToString() + exname;//上传的路径
        try
        {
            fu.SaveAs(HttpContext.Current.Server.MapPath(HttpContext.Current.Request.ApplicationPath) + "/" + newName);//上传
            flag++;
        }
        catch
        { }
        if (flag == 1)//保存成功
        {
            string sql = "insert into graph(name,userName,url,[desc],groupid) values ('" + name + "','";
            sql += userName + "','" + newName + "','" + desc + "'," + group + ")";
            try
            {
                DBQuery.ExceuteNonQuery(sql);//插入数据库，保存纪录
                flag++;
            }
            catch
            { }
        }
        return flag;
    }
    //插入图片类别
    public static bool AddCategory(string name, string vip, string alt)
    {
        bool flag = false;//操作成功与否的标志

        string sql = "insert into GraphGroup (name,alt,vip) values ('" + name + "','";
        sql += alt + "'," + vip + ")";
        
        try
        {
            DBQuery.ExceuteNonQuery(sql);//插入数据库，保存纪录
            flag = true;
        }
        catch
        { }

        return flag;
    }
    //更改用户密码
    public static bool ChangePass(string user, string newPass)
    {
        bool flag = false;//操作成功与否的标志
        newPass = Tools.Encrypt(newPass, "12345678");
        string sql = "update [admin] set adminpws='" + newPass + "' where adminname='" + user + "'";
        try
        {
            DBQuery.ExceuteNonQuery(sql);//插入数据库，保存纪录
            flag = true;
        }
        catch
        { }

        return flag;
    }
    //删除图片,返回0失败；1删除上传文件和数据库操作有一项失败；2操作成功
    public static int DeletePic(string url)
    {
        int flag = 0;//操作成功与否的标志
        try
        {
            //删除图片文件
            File.Delete(HttpContext.Current.Server.MapPath(HttpContext.Current.Request.ApplicationPath + "/" + url));
            flag++;
        }
        catch
        {
        }
        try
        {
            //删除图片的数据库纪录
            DBQuery.ExceuteNonQuery("DELETE FROM graph WHERE url  ='" + url + "'");
            flag++;
        }
        catch
        {
        }
        return flag;
    }
    //获得所有图片的数据
    public static DataTable GetAllPic()
    {
        DataTable dt = new DataTable();
        try
        {
            //查询数据
            dt = DBQuery.OpenQuery("select * from graph order by id desc");
        }
        catch { }
        return dt;
    }
    //获得特定类别的图片数据
    public static DataTable GetCatePic(string groupid)
    {
        DataTable dt = new DataTable();//用于返回数据的datatable
        try
        {
            dt = DBQuery.OpenQuery("select * from graph where groupid=" + groupid + " order by id desc");
        }
        catch { }
        return dt;
    }
    //获得所有图片类别的数据
    public static DataTable GetAllCategory()
    {
        DataTable dt = new DataTable();
        try
        {
            //查询结果
            //dt = DBQuery.OpenQuery("select * from [group] order by vip");
            dt = DBQuery.OpenQuery("select * from GraphGroup order by vip");
        
        }
        catch { }
        return dt;
    }
    //删除图片的类别，同时删除该类别的图片,返回0失败；1删除该类别的图片和删除该类别操作有一项失败；2操作成功
    public static int DeletePicCate(string id)
    {
        int flag = 0;//操作成功与否的标志
        try
        {
            //删除该类别的图片
            DBQuery.ExceuteNonQuery("DELETE FROM graph WHERE groupid  =" + id);
            flag++;
        }
        catch
        {
        }
        try
        {
            //删除该类别
            DBQuery.ExceuteNonQuery("DELETE FROM GraphGroup WHERE id  =" + id);
            flag++;
        }
        catch
        {
        }
        return flag;
    }
}
