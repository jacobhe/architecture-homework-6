<%@ Control Language="C#" AutoEventWireup="true"  Debug ="true" CodeFile="userlogin.ascx.cs" Inherits="users_userlogin" %>
<asp:Panel ID="Panel_Login" runat="server" Height="10px" Width="100%">
    <div style="text-align: left">
        <table style="width: 100%">
            <tr>
                <td colspan="6" style="height: 14px; text-align: right">
                用户名:<asp:TextBox ID="TextBox1" runat="server" CssClass="logon"></asp:TextBox>密 &nbsp; 码:<asp:TextBox ID="TextBox2" runat="server" CssClass="logon" TextMode="Password"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" CssClass="btn" OnClick="Button1_Click" Text="登陆" />
                    <asp:Button ID="Button2" runat="server" CssClass="btn" Text="取消" OnClick="Button2_Click" />
                    &nbsp; &nbsp;&nbsp; <a href ="./Register.aspx">注册</a> &nbsp; &nbsp;&nbsp;<a href ="./findpass.aspx" >忘记密码?</a></td>
            </tr>
        </table>
    </div>
</asp:Panel>
<asp:Panel ID="Panel_Ok" runat="server" Height="1px" Width="100%">
    <div style="text-align: center">
    <table style="width: 100%">
        <tr>
            <td colspan="2" style="text-align: right">
                    <asp:Label ID="Label1" runat="server"></asp:Label>登陆成功<asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/users/user_index.aspx">进入个人中心</asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">注销</asp:LinkButton></td>
        </tr>
    </table>
</div>
</asp:Panel>
