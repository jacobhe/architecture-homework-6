using System;
using System.Data.OleDb;
using System.Data;
using System.Web;
using System.Web.Configuration;
using System.Data.SqlClient;
//���ݿ����������
public sealed class DBQuery
{
    ////���ݿ��ļ���·��
    //static string path = HttpContext.Current.Server.MapPath(HttpContext.Current.Request.ApplicationPath + "/app_data/db.mdb");
    //static string str = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + path + ";Persist Security Info=False";
    ////���ݿ�����
    //static OleDbConnection conn = new OleDbConnection(str);
    
    //ִ�����ݲ�ѯ���ܣ�����һ�����ݱ�

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
            da.Fill(ds);//ִ�в�ѯ
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            da.Dispose();//�ͷ���Դ
        }
        return ds;
    }
    //ִ�зǲ�ѯ���ݿ����
    public static void ExceuteNonQuery(string sql)
    {
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        try
        {
            cmd.ExecuteNonQuery();//ִ��
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            cmd.Dispose();//�ͷ���Դ
            conn.Close();//�ر�����
        }
    }
}

