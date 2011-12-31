<%@ Control Language="C#" AutoEventWireup="true" CodeFile="paihangbang.ascx.cs" Inherits="Inc_paihangbang" %>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" GridLines="None" OnRowDataBound="GridView1_RowDataBound" ShowHeader="False">
    <Columns><asp:BoundField />
        <asp:TemplateField>
            <ItemTemplate>
               <li><a href ='Article.aspx?b_id=<%#Eval("b_id") %>' class ="b"><%#CutString(Eval("b_title").ToString ()).ToString()%></a></li>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
