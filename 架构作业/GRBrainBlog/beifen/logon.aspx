<%@ Page Language="C#" AutoEventWireup="true" Debug ="true" CodeFile="logon.aspx.cs" Inherits="manage_logon" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>管理员后台登陆</title>
    <link href="../GRBrainNET.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        &nbsp;<div style="text-align: center">
            <table style="width: 22%">
                <tr>
                    <td style="width: 100px">
                        管理员：</td>
                    <td colspan="2" style="text-align: left">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="logon"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        密 &nbsp; 码：</td>
                    <td colspan="2" style="text-align: left">
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="logon" TextMode="Password"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Button ID="Button1" runat="server" CssClass="btn" OnClick="Button1_Click" Text="登陆" />
                        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<asp:Button ID="Button2" runat="server" CssClass="btn"
                            OnClick="Button2_Click" Text="取消" /></td>
                </tr>
                <tr>
                    <td colspan="3">
                    </td>
                </tr>
            </table>
        </div>
    
    </div>
    </form>
</body>
</html>
