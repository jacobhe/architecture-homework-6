<%@ Control Language="C#" AutoEventWireup="true" CodeFile="userlogin.ascx.cs" Inherits="Inc_userlogin" %>
<table style="width: 271px">
    <tr>
        <td style="width: 55px" class="tbx">
            用户名:</td>
        <td colspan="2" style="width: 202px" class="tbx">
            <asp:TextBox ID="TextBox1" runat="server" CssClass="tbx" style="font-size: 12px"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 55px">
            密 &nbsp; 码:</td>
        <td colspan="2" style="width: 202px">
            <asp:TextBox ID="TextBox2" runat="server" CssClass="tbx" style="font-size: 12px"></asp:TextBox></td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Button ID="Button1" runat="server" CssClass="btn" Text="登陆" />
            <asp:Button ID="Button2" runat="server" CssClass="btn" Text="取消" /></td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="black">忘记密码?</asp:LinkButton></td>
    </tr>
</table>
