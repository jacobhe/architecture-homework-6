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
public partial class MasterPage : System.Web.UI.MasterPage
{
    SqlConnection conn = SqlHelper.creation();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.DlBind();
            //this.dl2bind();
            //this.Panel_Login.Visible = true;
            //this.Panel_Ok.Visible = false;
        }
        //if (Session["UserLoginName"] != null)
        //{
        //    this.Label1.Text = Session["UserLoginName"].ToString();
        //    this.Panel_Ok.Visible = true;
        //}
        //else
        //{
        //    this.Panel_Login.Visible = true;
        //}
    }
    public void dl2bind()
    {
        //convert(varchar(10),b_time,120)
        string sql02= "select * from content order by b_id desc";
        SqlDataAdapter da02= new SqlDataAdapter(sql02, conn);
        da02.Fill(ds, "content");
        this.DataList1.DataSource = ds.Tables["content"].DefaultView;
        this.DataList1.DataBind();
        conn.Close();
    }
    public void DlBind()//绑定分类
    {
        string sql = "select * from class ";
        SqlDataAdapter da = new SqlDataAdapter(sql, conn);
        da.Fill(ds, "class");
        this.DataList1.DataSource = ds.Tables["class"].DefaultView;
        this.DataList1.DataBind();
        conn.Close();
    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{

    //    if (Page.IsValid)
    //    {
    //        if (this.t1 .Text == "")
    //        {
    //            Page.RegisterStartupScript("mm", "<script>alert('用户名不能为空！')</script>");
    //        }
    //        else if (this.t2.Text == "")
    //        {

    //            Page.RegisterStartupScript("mm", "<script>alert('密码不能为空！')</script>");
    //        }
    //        else
    //        {
    //            string sql = "select UserName,UserPass from Users where UserName='" + this.t1.Text.Trim().Replace("'", "'") + "' and UserPass='" + this.t2 .Text.Trim().Replace("'", "'") + "'";

    //            try
    //            {
    //                SqlCommand cmd = new SqlCommand(sql, conn);
    //                conn.Open();
    //                SqlDataReader dr = cmd.ExecuteReader();
    //                if (dr.Read())
    //                {
    //                    Session["UserLoginName"] = dr["UserName"].ToString();
    //                    Label1.Text = Session["UserLoginName"].ToString();
    //                    this.Panel_Login.Visible = false;
    //                    this.Panel_Ok.Visible = true;
    //                    dr.Close();
    //                    conn.Close();
    //                }
    //                else
    //                {
    //                        //this.Panel_Login.Visible = true;
    //                    Page.RegisterStartupScript("mm", "<script>alert('登陆失败,请检查用户名或密码！')</script>");
    //                }

    //            }
    //            catch (SqlException err)
    //            {
    //                Page.RegisterStartupScript("mm", "<script>alert('登陆失败！')</script>");
    //            }
    //        }
        //}
    //}
    //protected void Button2_Click(object sender, EventArgs e)
    //{
    //    this.t1.Text = "";
    //    this.t2 .Text = "";
    //}
    //protected void LinkButton2_Click(object sender, EventArgs e)
    //{
    //    Session.Abandon();
    //    Response.Redirect("index.aspx");
    //}
}
