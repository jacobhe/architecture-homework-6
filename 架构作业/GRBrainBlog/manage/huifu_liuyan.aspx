<%@ Page Language="C#" MasterPageFile="~/manage/manage.master" AutoEventWireup="true" CodeFile="huifu_liuyan.aspx.cs" Inherits="manage_huifu_liuyan" Title="回复留言" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: center">
        <table style="width: 572px; height: 288px">
            <tr>
                <td style="width: 100px; height: 17px">
                    留言人：</td>
                <td style="width: 100px; height: 17px; text-align: left">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="tbx" ReadOnly="True"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    标题：</td>
                <td style="width: 100px; text-align: left">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="tbx" ReadOnly="True" Width="403px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px" valign="top">
                    留言内容：</td>
                <td style="width: 100px; text-align: left">
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="tbx" Height="100px" ReadOnly="True"
                        TextMode="MultiLine" Width="409px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 71px" valign="top">
                    管理员回复内容：</td>
                <td style="width: 100px; height: 71px; text-align: left" valign="top">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="tbx" Height="100px" TextMode="MultiLine"
                        Width="413px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 100px">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="回复" /></td>
            </tr>
        </table>
    </div>
</asp:Content>

