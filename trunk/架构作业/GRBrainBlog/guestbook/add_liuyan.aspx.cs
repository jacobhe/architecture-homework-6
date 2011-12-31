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
using System.Net;
public partial class guestbook_add_liuyan : System.Web.UI.Page
{
    SqlConnection conn = SqlHelper.creation();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.BindHeartList();//绑定心情
        }
    }
    private void BindHeartList()
    {
        for (int i = 1; i < 19; i++)
        {
            this.dface.Items.Add("<img alt=\"心情\" border=\"0\" src=\"images/" + i.ToString() + ".gif\" /> ");
            this.dface.Items[i - 1].Value = i.ToString() + ".gif";
        }
        this.dface.Items[0].Selected = true;
    }

    protected void btnsend_Click(object sender, EventArgs e)
    {
        string cmdtext = "insert into message(m_name, m_subject, m_content, m_phone, m_add, m_qq, m_email, m_http, m_face, m_ip, m_datetime,m_replytime) values(@name,@subject,@content,@phone,@add,@qq,@mail,@http,@face,@ip,@datetime,@datetime)";
        SqlCommand cmd = new SqlCommand(cmdtext, conn);
        cmd.Parameters.Add("@name", SqlDbType.VarChar, 50);
        cmd.Parameters["@name"].Value = this.tname.Text;
        cmd.Parameters.Add("@subject", SqlDbType.VarChar, 100);
        cmd.Parameters["@subject"].Value = this.tsubject.Text;
        cmd.Parameters.Add("@content", SqlDbType.Text);
        cmd.Parameters["@content"].Value = this.tcontent.Text;
        cmd.Parameters.Add("@phone", SqlDbType.VarChar, 12);
        cmd.Parameters["@phone"].Value = this.tphone.Text;
        cmd.Parameters.Add("@add", SqlDbType.VarChar, 100);
        cmd.Parameters["@add"].Value = this.tadd.Text;
        cmd.Parameters.Add("@qq", SqlDbType.VarChar, 10);
        cmd.Parameters["@qq"].Value = this.tqq.Text;
        cmd.Parameters.Add("@mail", SqlDbType.VarChar, 30);
        cmd.Parameters["@mail"].Value = this.tmail.Text;
        cmd.Parameters.Add("@http", SqlDbType.VarChar, 50);
        cmd.Parameters["@http"].Value = this.thttp.Text;
        cmd.Parameters.Add("@face", SqlDbType.VarChar, 10);
        cmd.Parameters["@face"].Value = this.dface.SelectedValue.ToString();
        cmd.Parameters.Add("@ip", SqlDbType.VarChar, 15);
        cmd.Parameters["@ip"].Value = GetIP();
        cmd.Parameters.Add("@datetime", SqlDbType.DateTime);
        cmd.Parameters["@datetime"].Value = DateTime.Now.ToString();
        try
        {
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script>alert('发表成功')</script>");
        }
        catch (Exception error)
        {
            throw new System.Exception(error.Message);
        }
    }
    protected string GetIP()   //获取本地IP   
    {
        IPHostEntry ipHost = Dns.Resolve(Dns.GetHostName());
        IPAddress ipAddr = ipHost.AddressList[0];
        return ipAddr.ToString();
    }
    protected void btncan_Click(object sender, EventArgs e)
    {
        Response.Redirect("show_liuyan.aspx");
    }
}
