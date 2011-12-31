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
public partial class AddBlog_News : System.Web.UI.Page
{
    SqlConnection conn = SqlHelper.creation();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserPower"].ToString ()=="0")
        {
          
            this.Label1.Text = Session["username"].ToString();
            this.Label2.Text = Session["UserPower"].ToString();
            
        }
        else
        {
            //Response.Write("<script>alert('对不起，你是非法用户！')</script>");
            Response.Redirect("./manage/logon.aspx");
        }
        if (!IsPostBack)
        {
            this.droplist();
        }
    }
    public void droplist()
    {
        string dropstr = "select * from class";
        SqlDataAdapter da = new SqlDataAdapter(dropstr, conn);

        DataSet ds = new DataSet();
        da.Fill(ds, "class");
        this.DropDownList1.DataSource = ds.Tables["class"].DefaultView;
        this.DropDownList1.DataValueField = "class_id";
        this.DropDownList1.DataTextField = "class_name";
        this.DropDownList1.DataBind();
        conn.Close();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (this.lbl_title.Text == "")
        {
            Page.RegisterStartupScript("ms", "<script>alert('标题不能为空！')</script>");
        }
        else if (this.TextBox2.Text == "")
        {

            Page.RegisterStartupScript("ms", "<script>alert('内容不能为空！')</script>");
        }
        else
        {

            //string sqlstr = "insert into content(b_title,b_author,class_id,b_content) values('" + this.lbl_title.Text.ToString().Trim() + "','" + this.lbl_author.Text.ToString().Trim() + "','" + this.DropDownList1.SelectedItem.Value + "','" + this.TextBox2.Text.ToString().Trim() + "')";
            //SqlCommand cmd = new SqlCommand(sqlstr, conn);

            //conn.Open();
            //cmd.ExecuteNonQuery();
            //conn.Close();
            //Page.RegisterStartupScript("mess", "<script>alert('添加成功！')</script>");
            //lbl_author.Text = "";
            //TextBox2.Text = "";
            //lbl_title.Text = "";
            if (Page.IsValid)
            {
                Boolean fileOK = false;
                string path = Server.MapPath("./UploadImages/");
                if (FileUpload1.HasFile)
                {
                    string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();//51%aspx
                    string[] allowedExtensions ={ ".gif", ".png", ".jpeg", ".jpg" };
                    for (int i = 0; i < allowedExtensions.Length; i++)
                    {
                        if (fileExtension == allowedExtensions[i])
                        {
                            fileOK = true;

                        }
                    }
                }
                if (fileOK)
                {
                    //try
                    //{
                    FileUpload1.PostedFile.SaveAs(path + "\\" + FileUpload1.FileName);
                    string picpath = "UploadImages/" + FileUpload1.FileName;


                    //DateTime date = DateTime.Now;
                    //读取数据库连接字符串

                    conn.Open();

                    string sqlstr = "insert into content(b_title,b_author,class_id,b_content,b_img) values('" + this.lbl_title.Text.ToString().Trim() + "','" + this.lbl_author.Text.ToString().Trim() + "','" + this.DropDownList1.SelectedItem.Value + "','" + this.TextBox2.Text.ToString().Trim() + "','" + picpath + "')";
                    // 创建数据库命令
                    SqlCommand mycmd = new SqlCommand(sqlstr, conn);
                    mycmd.ExecuteNonQuery();
                    conn.Close();
                    Page.RegisterStartupScript("mm", "<script>alert('添加成功！')</script>");


                //}
                //catch (SqlException ex)
                //{
                //    Page.RegisterStartupScript("mm", "<script>alert('出现问题！')</script>");
                //}
                }
                else
                {
                    Page.RegisterStartupScript("mm", "<script>alert('上传类型不对！')</script>");
                }
            }
        }
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        this.lbl_author.Text = "";
        this.lbl_title.Text = "";
        this.TextBox2.Text = "";
    }
}
