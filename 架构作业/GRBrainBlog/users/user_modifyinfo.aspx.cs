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
public partial class users_user_modify : System.Web.UI.Page
{
    SqlConnection conn = SqlHelper.creation();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            int ID = Convert.ToInt32(Session["UserID"].ToString());
            string sql = "select * from Users where User_ID=" + ID;
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                this.TextBox1 .Text  = Session["UserLoginName"].ToString();
                this.TextBox2.Text = dr["UserRetime"].ToString();
                this.TextBox3.Text = dr["UserEmail"].ToString();
                this.TextBox4.Text = dr["Answer"].ToString();
                this.TextBox5.Text = dr["UserBeizhu"].ToString();
                this.TextBox6.Text = dr["UserBirthday"].ToString();
                this.TextBox7.Text = dr["UserAddress"].ToString();
                this.TextBox8.Text = dr["UserSex"].ToString();
                this.TextBox9.Text = dr["UserPass"].ToString();
            }
            dr.Close();
            conn.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int ID = Convert.ToInt32(Session["UserID"].ToString());
        string strupdate = "update Users set UserName='" + TextBox1.Text.Trim() + "',UserPass='"+this.TextBox9 .Text .Trim ()+"',UserSex='"+this.TextBox8 .Text .Trim ()+"',UserEmail='" + TextBox3.Text.Trim() + "',Answer='" + TextBox4.Text.Trim() + "',Userbeizhu='" + TextBox5.Text.Trim() + "',UserBirthday='" + TextBox6.Text.Trim() + "',UserAddress='" + TextBox7.Text.Trim() + "',UserRetime='"+this.TextBox2 .Text .Trim ()+"' where User_ID=" + ID;
        SqlCommand cmdupdate = new SqlCommand(strupdate, conn);
        conn.Open();
        cmdupdate.ExecuteNonQuery();
        conn.Close();
        Page.RegisterStartupScript("mm", "<script>alert('更新成功！')</script>");

    }
}
