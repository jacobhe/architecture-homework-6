<%@ Page Language="C#" MasterPageFile="~/manage/manage.master" AutoEventWireup="true" CodeFile="Add_Class.aspx.cs" Inherits="manage_Add_Class" Title="增加类别" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: left">
        <div style="text-align: left">
            <table style="width: 55%">
                <tr>
                    <td style="width: 61px">
                        类别名称：</td>
                    <td style="width: 100px">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="tbx" Width="198px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="Button1" runat="server" CssClass="btn" OnClick="Button1_Click" Text="添加" /></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

