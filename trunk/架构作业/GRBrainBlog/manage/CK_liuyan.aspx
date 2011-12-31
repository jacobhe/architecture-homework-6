<%@ Page Language="C#" MasterPageFile="~/manage/manage.master" Debug ="true" AutoEventWireup="true" CodeFile="CK_liuyan.aspx.cs" Inherits="manage_CK_liuyan" Title="查看留言" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: center">
        <table style="width: 100%; height: 100px">
            <tr>
                <td style="width: 100%; text-align: left" valign="top">
                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AllowPaging="True" OnDeleteCommand="DataGrid1_DeleteCommand" OnItemCreated="DataGrid1_ItemCreated" OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="5" ShowHeader="False">
                    <Columns><asp:TemplateColumn ><ItemTemplate ><TABLE width=500><TBODY><TR><TD style="WIDTH: 100px">发表人：</TD><TD 
style="WIDTH: 100px; TEXT-ALIGN: left"><%#Eval("m_name") %></TD><TD style="WIDTH: 150px">发表时间：</TD><TD 
style="WIDTH: 300px; TEXT-ALIGN: left"><%#Eval("m_datetime") %></TD><TD style="WIDTH: 100px"><a href ='huifu_liuyan.aspx?m_id=<%#Eval("m_id")%>'>回复</a></TD></TR><TR><TD style="WIDTH: 100px">留言标题：</TD><TD style="TEXT-ALIGN: left" 
colSpan=4><%#Eval("m_subject") %></TD></TR><TR><TD style="WIDTH: 100px">留言内容：</TD><TD style="TEXT-ALIGN: left" 
colSpan=4><%#Eval("m_content") %></TD></TR><TR><TD style="WIDTH: 200px">管理员回复内容：</TD><TD style="TEXT-ALIGN: left" 
colSpan=4><%#Eval("m_reply")%></TD></TR></TBODY></TABLE></ItemTemplate></asp:TemplateColumn>
                        <asp:TemplateColumn>
                            <ItemTemplate>
                                <asp:LinkButton runat="server"  ID ="CmdDel" CausesValidation="false" CommandName="Delete" Text="删除"></asp:LinkButton>
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
                    </asp:DataGrid></td>
            </tr>
        </table>
    </div>
</asp:Content>

