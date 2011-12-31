<%@ Control Language="C#" AutoEventWireup="true" CodeFile="pinglun.ascx.cs" Inherits="Inc_pinglun" %>
<asp:DataList ID="DataList1" runat="server" ShowHeader ="false" ShowFooter ="false" style="line-height: 19px" >
<ItemTemplate ><table style="width: 100%">
    <tr>
        <td style="width: 100%" class ="black">
            Re：<a href ='./Article.aspx?b_id=<%#Eval("b_id")%>' class ="black"><%#CutString(Eval("re_content").ToString ())%></a></td>
    </tr>
    <tr align ="left"><td style="width: 100%" class ="black" align ="left" >
    评论人:<%#Eval("re_name") %>
    </td></tr>
</table></ItemTemplate>
</asp:DataList>

