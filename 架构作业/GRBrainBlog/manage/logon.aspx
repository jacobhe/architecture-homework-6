<%@ Page Language="C#" AutoEventWireup="true" CodeFile="logon.aspx.cs" Inherits="manage_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>后台管理</title>
    <link href ="../GRBrainNET.css" type ="text/css" rel ="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="text-align: center">
            &nbsp;<div style="text-align: center">
                <table style="width: 62%">
                    <tr>
                        <td colspan="3" style="font-weight: bold; font-size: 30px; color: #ffffff; line-height: 20px;
                            letter-spacing: 2px; height: 53px; background-color: #6699ff">
                           fuckSCUT后台登陆</td>
                    </tr>
                    <tr>
                        <td style="width: 272px; text-align: right;">
                            管理员：</td>
                        <td colspan="2" style="text-align: left">
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="logon"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 272px; text-align: right;">
                            密&nbsp; 码：</td>
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
                        <td colspan="3" style="font-size: 15px; color: #ffffff; background-color: #6699ff">
                            版权所有fuckSCUT</td>
                    </tr>
                </table>
            </div>
        </div>
    
    </div>
    </form>
</body>
</html>
