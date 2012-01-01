<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="graphUpload.aspx.cs" Inherits="graphUpload" %>
<%@ Register Assembly="QuCha" Namespace="QuCha.Net.UI.WebControls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="height: 362px; width: 445px">
        <tr>
            <td colspan="2">
                <asp:FileUpload ID="FileUpload1" runat="server" /></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:left">
                <cc1:uploadprogressbar id="UploadProgressBar1" runat="server" uploadbuttonname="Button1"></cc1:uploadprogressbar>
            </td>
        </tr> <tr>
            <td style="width: 146px">
                图片名称：</td>
            <td style="width: 435px">
                <asp:TextBox ID="TextBox1" runat="server" Width="171px"></asp:TextBox></td>
        </tr> <tr>
            <td style="width: 146px">
                所属分组：</td>
            <td style="width: 435px">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                    DataTextField="name" DataValueField="id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [id], [name] FROM [GraphGroup]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 146px">
                图片描述：</td>
            <td style="width: 435px">
                <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="180px"></asp:TextBox></td>
        </tr>
    </table>
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="上　传" />
    <br />
</asp:Content>

