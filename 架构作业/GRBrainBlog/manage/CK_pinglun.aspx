<%@ Page Language="C#" MasterPageFile="~/manage/manage.master" AutoEventWireup="true" CodeFile="CK_pinglun.aspx.cs" Inherits="manage_CK_pinglun" Title="查看当前系统所有评论" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: left">
        <table style="width: 100%">
            <tr>
                <td style="width: 100px; text-align: left; height: 687px;" valign="top">
                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" Width="644px" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnDeleteCommand="DataGrid1_DeleteCommand" OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="5">
                    <Columns><asp:TemplateColumn HeaderText="删除" ><HeaderTemplate >当前系统所有评论</HeaderTemplate><ItemTemplate ><table style="width: 100%">
        <tr>
            <td style="width: 100%; height: 17px; text-align: left">
                评论编号：<%#Eval("re_id") %>&nbsp;&nbsp;&nbsp;文章编号：<%#Eval("b_id") %></td>
            <td style="width: 100px; height: 17px; text-align: right; font-weight: bold; font-size: 13px; ">
               </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: left">
                标题：<%#Eval("re_title") %>&nbsp; 时间：(<%#Eval("re_time") %>)&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 17px; text-align: left; width :500px ;line-height: 20px;">
                <%#Eval("re_content") %></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: left">
                评论人：<%#Eval("re_name") %></td>
        </tr>
    </table></ItemTemplate></asp:TemplateColumn>
                        <asp:TemplateColumn>
                            <ItemTemplate>
                                <asp:LinkButton runat="server" CausesValidation="false" CommandName="Delete" Text="删除"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                      
                        
                    </Columns>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditItemStyle BackColor="#999999" />
                        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" NextPageText="下一页"
                            PrevPageText="上一页" />
                        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    </asp:DataGrid>&nbsp;&nbsp;&nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>

