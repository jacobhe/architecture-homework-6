using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public class SqlHelper
{
    SqlConnection conn=SqlHelper .creation ();
	public SqlHelper()
	{
	}
    public static SqlConnection creation()
    {
        return new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|GRBrain_NET_Data.MDF;Integrated Security=True;User Instance=True");
    }
}
