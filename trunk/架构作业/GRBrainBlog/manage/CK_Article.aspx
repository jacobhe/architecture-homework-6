<%@ Page Language="C#" MasterPageFile="~/manage/manage.master" AutoEventWireup="true" CodeFile="CK_Article.aspx.cs" Inherits="manage_CK_Article" Title="查看系统所有文章" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%">
        <tr>
            <td style="width: 100%; text-align: left">
                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnDeleteCommand="DataGrid1_DeleteCommand" OnItemCreated="DataGrid1_ItemCreated" OnPageIndexChanged="DataGrid1_PageIndexChanged">
                    <Columns>
                        <asp:BoundColumn DataField="b_id" HeaderText="编号"></asp:BoundColumn>
                        <asp:BoundColumn DataField="b_title" HeaderText="文章标题"></asp:BoundColumn>
                        <asp:BoundColumn DataField="b_time" HeaderText="发表时间"></asp:BoundColumn>
                        <asp:BoundColumn DataField="b_author" HeaderText="发布人"></asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="删除">
                            <ItemTemplate>
                                <asp:LinkButton runat="server"  ID="cmdDel" CausesValidation="false" CommandName="Delete" Text="删除"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    <EditItemStyle BackColor="#999999" />
                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Right" NextPageText="下一页" PrevPageText="上一页" />
                    <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                    <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                </asp:DataGrid></td>
        </tr>
    </table>
</asp:Content>

