<%@ Page Language="C#" AutoEventWireup="true" CodeFile="findpass.aspx.cs" Inherits="findpass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>查找密码</title>
    <link href="GRBrainNET.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="请输入用户名："></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" Width="189px"></asp:TextBox>
&nbsp;<asp:Button ID="Button2" runat="server" CssClass="btn" onclick="Button2_Click" 
            Text="确定" />
        <br />
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Width="800px"></asp:Label>
        <br />
        <br />
        <br />
        请输入安全问题答案：<asp:TextBox ID="TextBox1" runat="server" Width="261px"></asp:TextBox><br />
        <br />
        <asp:Button ID="Button1" runat="server" CssClass="btn" OnClick="Button1_Click" Text="提交" /><br />
        <br />
        <asp:Label ID="Label1" runat="server" Width="167px"></asp:Label><br />
        <br /><a href ="index.aspx" >返回</a>
    
    </div>
    </form>
</body>
</html>
