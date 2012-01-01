using System;
using System.Data.OleDb;
using System.Data;
using System.Web;
using System.Web.Configuration;
using System.Data.SqlClient;
//数据库操作工具类
public sealed class DBQuery
{
    ////数据库文件的路径
    //static string path = HttpContext.Current.Server.MapPath(HttpContext.Current.Request.ApplicationPath + "/app_data/db.mdb");
    //static string str = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + path + ";Persist Security Info=False";
    ////数据库连接
    //static OleDbConnection conn = new OleDbConnection(str);
    
    //执行数据查询功能，返回一个数据表

    static SqlConnection conn = SqlHelper.creation();
    static DataTable ds;
    public static DataTable OpenQuery(string sql)
    {
        //OleDbDataAdapter da = new OleDbDataAdapter(sql, conn);
        SqlDataAdapter da = new SqlDataAdapter(sql, conn);
        //dt = new DataTable();
        ds = new DataTable();
        try
        {
            da.Fill(ds);//执行查询
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            da.Dispose();//释放资源
        }
        return ds;
    }
    //执行非查询数据库操作
    public static void ExceuteNonQuery(string sql)
    {
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        try
        {
            cmd.ExecuteNonQuery();//执行
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            cmd.Dispose();//释放资源
            conn.Close();//关闭连接
        }
    }
}

