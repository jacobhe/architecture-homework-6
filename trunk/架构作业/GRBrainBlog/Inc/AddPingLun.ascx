<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddPingLun.ascx.cs" Inherits="Inc_AddPingLun" %>
<table style="width: 503px; height: 120px">
    <tr>
        <td style="width: 74px">
            妮称：</td>
        <td style="width: 113px">
            <asp:Label ID="Label1" runat="server" ForeColor="#C04000"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" Width="69px" ForeColor="#C00000"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1"
                ErrorMessage="*"></asp:RequiredFieldValidator>
            <asp:Panel ID="Panel1" runat="server" Height="50px" Width="125px">
                <a  href ="./index.aspx">登陆</a>后才能发表评论</asp:Panel>
        </td>
    </tr>
    <tr>
        <td style="width: 74px">
            标题：</td>
        <td style="width: 113px">
            <asp:TextBox ID="TextBox2" runat="server" CssClass="tbx"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 74px; height: 65px" valign="top">
            评论内容：</td>
        <td style="width: 113px; height: 65px" valign="top">
            <asp:TextBox ID="TextBox3" runat="server" CssClass="tbx" Height="100px" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox3"
                ErrorMessage="*"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td class="tbx" colspan="2">
            遵纪守法，文明评论！</td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Button ID="Button1" runat="server" CssClass="btn" OnClick="Button1_Click" Text="提交" /></td>
    </tr>
</table>
