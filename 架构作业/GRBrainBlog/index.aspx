<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Debug ="true" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" Title="GRBrain.NET" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: left">
        <table style="width: 95%">
            <tr>
                <td style="width: 100%; text-align: left; height: 17px;">
                    &nbsp;<asp:DataList ID="DataList1" runat="server" ShowFooter="False" ShowHeader="False" Width="654px">
        <ItemTemplate > <table cellpadding="0" cellspacing="0" style="width: 100%; ">
            <tr align ="left" style ="color:Gray  ; background-repeat :repeat-x; ">
                <td colspan="8"  style="height: 10px; text-align: left; width: 670px;"  valign="middle">
                <a href ='A_<%#Eval("b_id")%>.html' class ="blue" ><%#Eval("b_title") %></a></td>
            </tr>
            <tr>
                <td style="height: 15px; text-align: left; font-size: 13px; width: 100%; line-height: 22px; font-family: 'Arial Narrow', 'Bookman Old Style', 宋体;" colspan="8">
                    <%#CutString(FormatString(Eval("b_content").ToString ()).ToString ()).ToString()%></td>
            </tr>
            <tr>
                <td style="height: 15px; width: 670px; text-align: right;" colspan="8" ><br />
                    <div style="text-align:left ">
                        
                                    点击率:[<%#Eval("b_click")%>]发布人:[<%#Eval("b_author") %>]时间:[<%#Eval("b_time")%>]<a href ='a_<%#Eval("b_id")%>.html'>详细</a> 
                                    </div> <br />
                           </ItemTemplate>
            <SeparatorTemplate>
                ------------------------------------------------------------------------------------------------------------------------------------
            </SeparatorTemplate>
        </asp:DataList></td>
            </tr>
        </table><br /><hr />
    </div>
    <table style="width: 100%">
        <tr>
            <td style="width: 100%; text-align: left;" class="blue">
                当前第<asp:Label ID="labPage" runat="server" CssClass="black">1</asp:Label>页/共有<asp:Label ID="labBackPage" runat="server" CssClass="black"></asp:Label>页
                <asp:LinkButton ID="lnkbtnOne" runat="server" CssClass="black" OnClick="lnkbtnOne_Click">第一页</asp:LinkButton>
                <asp:LinkButton ID="lnkbtnUp" runat="server" CssClass="black" OnClick="lnkbtnUp_Click">上一页</asp:LinkButton>
                <asp:LinkButton ID="lnkbtnNext" runat="server" CssClass="black" OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>&nbsp;
                <asp:LinkButton ID="lnkbtnBack" runat="server" CssClass="black" OnClick="lnkbtnBack_Click">最后一页</asp:LinkButton></td>
        </tr>
    </table>
    <div style="text-align: left">
        <div style="text-align: center">
            &nbsp;</div>
        <br />
        &nbsp;</div>

</asp:Content>

