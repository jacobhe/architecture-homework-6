<%@ Page Language="C#" MasterPageFile="~/manage/manage.master" AutoEventWireup="true" CodeFile="CK_Users.aspx.cs" Inherits="manage_CK_Users" Title="查看系统所有用户信息" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: left">
        <table style="width: 100%">
            <tr>
                <td colspan="3" rowspan="3" style="text-align: center">
                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="133px" OnCancelCommand="DataGrid1_CancelCommand" OnDeleteCommand="DataGrid1_DeleteCommand" OnEditCommand="DataGrid1_EditCommand" OnItemCreated="DataGrid1_ItemCreated" OnPageIndexChanged="DataGrid1_PageIndexChanged" OnUpdateCommand="DataGrid1_UpdateCommand" Width="100%">
                        <Columns>
                            <asp:BoundColumn DataField="User_ID" HeaderText="用户编号" ReadOnly="True"></asp:BoundColumn>
                            <asp:BoundColumn DataField="UserName" HeaderText="用户名称"></asp:BoundColumn>
                            <asp:BoundColumn DataField="UserPass" HeaderText="用户密码"></asp:BoundColumn>
                            <asp:BoundColumn DataField="UserPower" HeaderText="用户权限"></asp:BoundColumn>
                            <asp:EditCommandColumn CancelText="取消" EditText="编辑" HeaderText="更新" UpdateText="更新">
                            </asp:EditCommandColumn>
                            <asp:TemplateColumn HeaderText="删除">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID ="cmdDel"  CausesValidation="false" CommandName="Delete" Text="删除"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditItemStyle BackColor="#999999" />
                        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    </asp:DataGrid><br />
                    说明：0代表管理员;1代表注册用户</td>
            </tr>
            <tr>
            </tr>
            <tr>
            </tr>
        </table>
    </div>
    <br />
</asp:Content>

