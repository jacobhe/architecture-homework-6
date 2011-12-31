<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" Title="查询到的符合条件的文章" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table style="width: 100%">
            <tr>
                <td style="width: 100px; height: 17px; text-align: left;">
                    <asp:DataList ID="DataList1" runat="server" Width="675px" style="line-height: 20px">
                    <ItemTemplate ><a href ='Article.aspx?b_id=<%#Eval("b_id") %>'><%#Eval("b_title") %></a>&nbsp(<%#Eval("b_time") %>)</ItemTemplate>
                    </asp:DataList>
                    &nbsp;</td>
            </tr>
        </table>
    &nbsp;&nbsp;<br />
    <div style="text-align: left">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"
            Height="28px" Width="575px"></asp:Label>&nbsp;</div>
</asp:Content>

