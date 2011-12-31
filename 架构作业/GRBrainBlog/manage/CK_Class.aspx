<%@ Page Language="C#" MasterPageFile="~/manage/manage.master" AutoEventWireup="true" CodeFile="CK_Class.aspx.cs" Inherits="manage_CK_Class" Title="查看当前类别" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: left">
        <table style="width: 100%">
            <tr>
                <td style="width: 100px" valign="top">
    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        ForeColor="#333333" GridLines="None" OnCancelCommand="DataGrid1_CancelCommand"
        OnDeleteCommand="DataGrid1_DeleteCommand" OnEditCommand="DataGrid1_EditCommand"
        OnUpdateCommand="DataGrid1_UpdateCommand" Style="line-height: 20px" Width="293px" OnItemCreated="DataGrid1_ItemCreated" OnItemDataBound="DataGrid1_ItemDataBound">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditItemStyle BackColor="#999999" />
        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:BoundColumn DataField="class_id" HeaderText="编号" ReadOnly="True"></asp:BoundColumn>
            <asp:BoundColumn DataField="class_name" HeaderText="类别名称"></asp:BoundColumn>
            <asp:EditCommandColumn CancelText="取消" EditText="编辑" UpdateText="更新" HeaderText="操作"></asp:EditCommandColumn>
            <asp:TemplateColumn HeaderText="删除">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID ="cmdDel"  CausesValidation="false" CommandName="Delete" Text="删除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateColumn>
        </Columns>
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    </asp:DataGrid></td>
            </tr>
        </table>
    </div>
</asp:Content>

