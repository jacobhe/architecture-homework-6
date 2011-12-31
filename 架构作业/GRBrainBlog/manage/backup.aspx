<%@ Page Language="C#" MasterPageFile="~/manage/manage.master"  Debug ="true" AutoEventWireup="true" CodeFile="backup.aspx.cs" Inherits="manage_backup" Title="备份数据库" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    数据库名：<asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList><br />
    备份位置：
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="备份数据库" /><br />
    <br />
</asp:Content>

