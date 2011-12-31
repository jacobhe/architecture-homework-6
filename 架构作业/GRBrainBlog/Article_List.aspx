<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Article_List.aspx.cs" Inherits="About" Title="文章列表" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%">
        <tr>
            <td style="width: 100%; text-align: left">
                <asp:DataList ID="DataList1" runat="server" ShowHeader ="true" Width="100%">
                <HeaderTemplate><h3>文章列表</h3></HeaderTemplate>
                <ItemTemplate><ul><li><a href ='a_<%#Eval("b_id")%>.html' class ="black" ><%#Eval("b_title") %></a>(<%#Eval("b_time") %>)</li></ul></ItemTemplate>
                </asp:DataList></td>
        </tr>
        <tr>
            <td style="width: 100%">
                当前第<asp:Label ID="labPage" runat="server" CssClass="black">1</asp:Label>页/共有<asp:Label
                    ID="labBackPage" runat="server" CssClass="black"></asp:Label>页
                <asp:LinkButton ID="lnkbtnOne" runat="server" CssClass="black" OnClick="lnkbtnOne_Click">第一页</asp:LinkButton>
                <asp:LinkButton ID="lnkbtnUp" runat="server" CssClass="black" OnClick="lnkbtnUp_Click">上一页</asp:LinkButton>
                <asp:LinkButton ID="lnkbtnNext" runat="server" CssClass="black" OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>&nbsp;
                <asp:LinkButton ID="lnkbtnBack" runat="server" CssClass="black" OnClick="lnkbtnBack_Click">最后一页</asp:LinkButton></td>
        </tr>
    </table>
</asp:Content>

