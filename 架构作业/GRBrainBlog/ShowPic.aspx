<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowPic.aspx.cs" Inherits="ShowPic" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>查看大图</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FormView ID="FormView1" runat="server">
        <ItemTemplate ><asp:Image ID ="img" runat ="server"  ImageUrl='<%#Eval("b_img") %>' />
        <table ><tr><td></td></tr>
        <tr><td> <a href ="index.aspx">点击返回首页</a></td></tr>
        
        </table>
       
        </ItemTemplate>
        </asp:FormView>
    
    </div>
    </form>
</body>
</html>
