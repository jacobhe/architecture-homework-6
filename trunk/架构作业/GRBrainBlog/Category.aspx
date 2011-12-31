<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="Category" Title="查看当前类别下所有文章" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: center">
        <table style="width: 100%">
            <tr>
                <td style="width: 100%; text-align: left">
                    首页 &gt;&gt;
                    <asp:Label ID="Label2" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100%; text-align: left">
                    <asp:DataList ID="DataList1" runat="server" ShowHeader ="false" style="line-height: 25px" CssClass="black">
                    <ItemTemplate ><li><a href ='a_<%#Eval("b_id")%>.html' class ="black" ><%#Eval("b_title") %></a><%#Eval("b_time") %></li></ItemTemplate>
                    </asp:DataList>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" Style="font-weight: bold; font-size: 14px;
                        color: #ff0033"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100%; text-align: center">
                    当前第<asp:Label ID="labPage" runat="server" CssClass="black">1</asp:Label>页/共有<asp:Label
                        ID="labBackPage" runat="server" CssClass="black"></asp:Label>页
                    <asp:LinkButton ID="lnkbtnOne" runat="server" CssClass="black" OnClick="lnkbtnOne_Click">第一页</asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnUp" runat="server" CssClass="black" OnClick="lnkbtnUp_Click">上一页</asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnNext" runat="server" CssClass="black" OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>&nbsp;
                    <asp:LinkButton ID="lnkbtnBack" runat="server" CssClass="black" OnClick="lnkbtnBack_Click">最后一页</asp:LinkButton></td>
            </tr>
        </table>
    </div>
</asp:Content>

