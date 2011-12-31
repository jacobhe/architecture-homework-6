<%@ Page Language="C#" AutoEventWireup="true"  Debug ="true" CodeFile="AddBlog_News.aspx.cs" Inherits="AddBlog_News" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="GRBrainNET.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        <table style="width: 90%; font-weight: bold; font-size: 16px; color: #0066ff; background-color: #0066ff;">
            <tr>
                <td style="height: 66px; font-size: 20px; color: #ffffff; text-align: center;" width="90%">
                    GRBrain.NET后台管理</td>
            </tr>
        </table>
        <table cellpadding="2" style="width: 90%; border-right: #0066ff 1px solid; border-top: #0066ff 1px solid; border-left: #0066ff 1px solid; border-bottom: #0066ff 1px solid;">
            <tr>
                <td colspan="3" style="text-align: left">
                    当前你的身份为：<asp:Label ID="Label1" runat="server"></asp:Label>&nbsp;
                    <asp:Label ID="Label2" runat="server"></asp:Label>&nbsp;
                    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/manage/admin_index.aspx">后台首页</asp:LinkButton></td>
            </tr>
            <tr>
                <td style="width: 69px; text-align: center">
                    标题:</td>
                <td colspan="2" style="text-align: left">
                    <asp:TextBox ID="lbl_title" runat="server" CssClass="tbx" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 69px">
                    作者：</td>
                <td colspan="2" style="text-align: left">
                    <asp:TextBox ID="lbl_author" runat="server" CssClass="tbx"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 69px">
                    类别：</td>
                <td colspan="2" style="text-align: left">
                    <asp:DropDownList ID="DropDownList1" runat="server" Style="font-size: 12px">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 69px" valign="top">
                    内容：</td>
                <td colspan="2" style="text-align: left" valign="top">
                    <asp:TextBox ID="TextBox2" runat="server" Height="400px" Style="font-size: 12px"
                        TextMode="MultiLine" Width="739px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 69px; height: 26px" valign="top">
                    图片上传</td>
                <td colspan="2" style="height: 26px; text-align: left" valign="top">
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="477px" /></td>
            </tr>
            <tr>
                <td style="width: 69px">
                </td>
                <td colspan="2">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="提交" />
                    &nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="清空" />&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="3" style="height: 19px">
                    &nbsp;</td>
            </tr>
        </table><table style="font-weight: bold; font-size: 16px; color: #0066ff; background-color: #0066ff;" width="90%">
            <tr>
                <td style="height: 90%; font-size: 12px; color: #ffffff;" width="90%">
                    版权所有@GRBrain.NET(天亮说晚安)</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
