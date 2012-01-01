<%@ Page Title="" Language="C#" MasterPageFile="~/manage/manage.master" AutoEventWireup="true" CodeFile="graph.aspx.cs" Inherits="manage_graph" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView id="GridView1" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCommand="GridView1_RowCommand" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
    <Columns>
        <asp:BoundField DataField="id" HeaderText="编号" />
        <asp:BoundField DataField="vip" HeaderText="排列序号" />
        <asp:BoundField DataField="name" HeaderText="类别名" />
        <asp:BoundField DataField="alt" HeaderText="描述" />
        <asp:TemplateField HeaderText="删除">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" CommandName ="del" runat="server" CommandArgument='<%# Bind("id") %>'>删除</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <EditRowStyle BackColor="#999999" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
</asp:GridView>
    <br />
    类别名称：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
    排列序号：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <br />
    描 &nbsp; &nbsp;&nbsp; &nbsp;述：<asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" Width="148px"></asp:TextBox><br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="添　加" OnClick="Button1_Click" />
</asp:Content>

