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
public partial class manage_backup : System.Web.UI.Page
{
    SqlConnection conn = SqlHelper.creation();
    protected void Page_Load(object sender, EventArgs e)
    {

        conn.Open();
        string cmdtext = "sp_helpdb";
        SqlDataAdapter da = new SqlDataAdapter(cmdtext, conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        this.DropDownList1.DataSource = ds;
        this.DropDownList1.DataTextField = "name";
        this.DropDownList1.DataBind();
        conn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        conn.Open();
        string path = this.TextBox1.Text;
        string name = DropDownList1.SelectedValue;
        string cmdback = "use master ;backup database @name to disk=@path";//5+1+a+s+p+x
        SqlCommand cmd = new SqlCommand(cmdback, conn);
        cmd.Parameters.Add("@name", SqlDbType.Char);
        cmd.Parameters["@name"].Value = name;
        cmd.Parameters.Add("@path", SqlDbType.Char);
        cmd.Parameters["@path"].Value = path;
        try
        {
            cmd.ExecuteNonQuery();
            conn.Close();
            //Response.Write("<script>alert('备份成功！')<script>");
            Page.RegisterStartupScript("mm","<script>alert('备份成功！')</script>");

        }
        catch (SqlException drr)
        {
            throw new System.Exception(drr.Message);
        }

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.TextBox1.Text = Server.MapPath("backup") + "\\" + this.DropDownList1.SelectedValue + ".bak";

    }
}
