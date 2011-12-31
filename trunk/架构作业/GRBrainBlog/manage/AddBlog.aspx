<%@ Page Language="C#" MasterPageFile="~/manage/manage.master" AutoEventWireup="true" CodeFile="AddBlog.aspx.cs" Inherits="manage_AddBlog" Title="添加文章" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: center">
        <table cellpadding="2" style="width: 100%">
            <tr>
                <td style="width: 69px; text-align: center;">
                    标题:</td>
                <td style="text-align: left;" colspan="2">
                    <asp:TextBox ID="lbl_title" runat="server" CssClass="tbx" Width="400px"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td style="width: 69px">
                    作者：</td>
                <td style="text-align: left;" colspan="2">
                    <asp:TextBox ID="lbl_author" runat="server" CssClass="tbx"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td style="width: 69px">
                    类别：</td>
                <td style="text-align: left;" colspan="2">
                    <asp:DropDownList ID="DropDownList1" runat="server" Style="font-size: 12px">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 69px" valign="top">
                    内容：</td>
                <td colspan="2" style="text-align: left" valign="top">
                    <asp:TextBox ID="TextBox2" runat="server" Height="400px" Style="font-size: 12px"
                        TextMode="MultiLine" Width="401px"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td style="width: 69px" valign="top">
                    图片上传</td>
                <td colspan="2" style="text-align: left" valign="top">
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="477px" /></td>
            </tr>
            <tr>
                <td style="width: 69px">
                </td>
                <td style="width: 100px">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" /></td>
                <td style="width: 100px">
                    <asp:Button ID="Button2" runat="server" Text="Cancel" /></td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="Label1" runat="server"></asp:Label></td>
            </tr>
        </table>
    </div>
</asp:Content>

