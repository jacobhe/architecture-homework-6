<%@ Page Language="C#" MasterPageFile="~/users/User_MasterPage.master" AutoEventWireup="true" Debug ="true" CodeFile="user_modifyinfo.aspx.cs" Inherits="users_user_modify" Title="修改个人资料" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server"></asp:Label><br />
    <div style="text-align: center">
        <table style="width: 100%">
            <tr>
                <td style="width: 97px; height: 17px">
                    用户名：</td>
                <td style="width: 100px; height: 17px; text-align: left">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="tbx" Width="118px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 97px">
                    用户性别：</td>
                <td style="width: 100px; text-align: left">
                    <asp:TextBox ID="TextBox8" runat="server" CssClass="tbx" Width="118px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 97px">
                    用户密码：</td>
                <td style="width: 100px; text-align: left">
                    <asp:TextBox ID="TextBox9" runat="server" CssClass="tbx" Width="118px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 97px">
                    用户Email：</td>
                <td style="width: 100px; text-align: left">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="tbx"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 97px">
                    安全问题答案：</td>
                <td style="width: 100px; text-align: left">
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="tbx"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 97px" valign="top">
                    备注：</td>
                <td style="width: 100px; text-align: left">
                    <asp:TextBox ID="TextBox5" runat="server" CssClass="tbx" Height="73px" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 97px">
                    出生日期：</td>
                <td style="width: 100px; text-align: left">
                    <asp:TextBox ID="TextBox6" runat="server" CssClass="tbx"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 97px">
                    联系地址：</td>
                <td style="width: 100px; text-align: left">
                    <asp:TextBox ID="TextBox7" runat="server" CssClass="tbx"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 97px">
                    注册时间：</td>
                <td style="width: 100px; text-align: left">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="tbx" Width="154px"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="Button1" runat="server" CssClass="btn" OnClick="Button1_Click" Text="更新用户资料" /></td>
            </tr>
            <tr>
                <td colspan="2" rowspan="2">
                    <asp:Label ID="Label2" runat="server" Width="162px"></asp:Label></td>
            </tr>
            <tr>
            </tr>
        </table>
    </div>
</asp:Content>

