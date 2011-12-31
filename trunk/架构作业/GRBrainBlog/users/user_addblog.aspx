<%@ Page Language="C#" MasterPageFile="~/users/User_MasterPage.master" AutoEventWireup="true" CodeFile="user_addblog.aspx.cs" Inherits="users_user_addblog" Title="用户添加文章" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="2" style="border-right: #0066ff 1px solid; border-top: #0066ff 1px solid;
        border-left: #0066ff 1px solid; border-bottom: #0066ff 1px solid; height: 625px"
        width="100%">
        <tr>
            <td colspan="3" style="font-weight: bold; font-size: 19px; color: #3366ff; text-align: center">
                添加文章</td>
        </tr>
        <tr style="color: #000000">
            <td style="width: 54px; text-align: center">
                标题:</td>
            <td colspan="2" style="width: 505px; text-align: left">
                <asp:TextBox ID="lbl_title" runat="server" CssClass="tbx" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 54px; text-align: center">
                作者：</td>
            <td colspan="2" style="width: 505px; text-align: left">
                <asp:TextBox ID="lbl_author" runat="server" CssClass="tbx"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 54px">
                类别：</td>
            <td colspan="2" style="width: 505px; text-align: left">
                <asp:DropDownList ID="DropDownList1" runat="server" Style="font-size: 12px">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td style="width: 54px" valign="top">
                内容：</td>
            <td colspan="2" style="width: 505px; text-align: left" valign="top">
                <asp:TextBox ID="TextBox2" runat="server" Height="400px" Style="font-size: 12px"
                    TextMode="MultiLine" Width="90%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 54px; height: 26px" valign="top">
                图片上传</td>
            <td colspan="2" style="width: 505px; height: 26px; text-align: left" valign="top">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="477px" /></td>
        </tr>
        <tr>
            <td style="width: 54px">
            </td>
            <td colspan="2" style="width: 505px">
                <asp:Button ID="Button1" runat="server" CssClass="btn" OnClick="Button1_Click" Text="提交" />
                &nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" CssClass="btn" OnClick="Button2_Click" Text="清空" />&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="3" style="height: 19px">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

