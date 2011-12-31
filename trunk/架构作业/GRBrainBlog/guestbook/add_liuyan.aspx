<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_liuyan.aspx.cs" Inherits="guestbook_add_liuyan" %>

<%@ Register Src="../users/userlogin.ascx" TagName="userlogin" TagPrefix="uc3" %>
<%@ Register Src="../Inc/bottom.ascx" TagName="bottom" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>联系反馈</title>
    <link href="../GRBrainNET.css" rel="stylesheet" type="text/css" />
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
    <div style="text-align: center">
        <br />
        <table cellpadding="0" cellspacing="0" style="border-top: #000033 2px ridge; width: 90%">
            <tr>
                <td class="blue" style="width: 100%; height: 15px; text-align: right">
                  <div id="jnkc">
                    </div>
                    <script>setInterval("jnkc.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
                    </script>

                </td>
            </tr>
            <tr>
                <td style="font-weight: bold; font-size: 14px; width: 100%; color: #ffffff; height: 48px;
                    background-color: #330033; text-align: left">
                    GRBrain.NET</td>
            </tr>
        </table>
        <table cellpadding="1" cellspacing="1" style="width: 90%; border-bottom: #330033 1px groove">
            <tr>
                <td rowspan="2" style="width: 90%; height: 21px; background-color: #330033; text-align: left"><a href ="../index.aspx" class ="blue">网站首页</a> &nbsp; &nbsp; &nbsp;&nbsp;<a href ="../Article_List.aspx" class ="blue">文章列表</a>&nbsp; &nbsp; &nbsp;&nbsp;<a href ="add_liuyan.aspx" class ="blue">留言反馈</a>
                </td>
            </tr>
            <tr>
            </tr>
        </table>
        <table style="background-color: white" width="90%">
            <tr>
                <td class="td" colspan="2" style="text-align: left">
                    <span style="font-size: 14pt; color: #a1d1c3"><strong>请添加留言内容</strong></span></td>
            </tr>
            <tr>
                <td class="td" style="text-align: right" width="13%">
                    <font style="font-size: 13px">主题：</font></td>
                <td class="td" style="text-align: left">
                    <asp:TextBox ID="tsubject" runat="server" ForeColor="Gray" Width="274px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tsubject"
                        ErrorMessage="主题不能为空">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr style="color: #000000">
                <td class="td" style="text-align: right">
                    发表人：</td>
                <td class="td" style="text-align: left">
                    <asp:TextBox ID="tname" runat="server" ForeColor="Gray"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tname"
                        ErrorMessage="发表人不能为空">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr style="color: #000000">
                <td class="td" style="text-align: right">
                    E_MAIL：</td>
                <td class="td" style="text-align: left">
                    <asp:TextBox ID="tmail" runat="server" ForeColor="Gray" Width="324px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tmail"
                        ErrorMessage="用户邮件不能为空">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr style="color: #000000">
                <td class="td" style="text-align: right">
                    QQ号码：</td>
                <td class="td" style="text-align: left">
                    <asp:TextBox ID="tqq" runat="server" ForeColor="Gray"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tqq"
                        ErrorMessage="QQ号不能为空">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr style="color: #000000">
                <td class="td" style="text-align: right">
                    电话号码：</td>
                <td class="td" style="text-align: left">
                    <asp:TextBox ID="tphone" runat="server" ForeColor="Gray" Width="251px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="td" style="text-align: right">
                    地址：</td>
                <td class="td" style="text-align: left">
                    <asp:TextBox ID="tadd" runat="server" ForeColor="Gray" Width="388px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="td" style="text-align: right; height: 26px;">
                    主页：</td>
                <td class="td" style="text-align: left; height: 26px;">
                    <asp:TextBox ID="thttp" runat="server" ForeColor="Gray" Width="388px">http://</asp:TextBox></td>
            </tr>
            <tr>
                <td class="td" style="text-align: right">
                    表情：</td>
                <td class="td" style="text-align: left">
                    <asp:RadioButtonList ID="dface" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"
                        Width="88%">
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td class="td" style="text-align: right">
                    内容：</td>
                <td class="td" style="text-align: left">
                    <asp:TextBox ID="tcontent" runat="server" ForeColor="Gray" Height="113px" TextMode="MultiLine"
                        Width="391px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tcontent"
                        ErrorMessage="留言内容不能为空">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Button ID="btnsend" runat="server" OnClick="btnsend_Click" Text="发表留言" />
                    <asp:Button ID="btncan" runat="server" OnClick="btncan_Click" Text="查看留言" ValidationGroup="q" /></td>
            </tr>
        </table>
    
    </div>
        <uc2:bottom ID="Bottom1" runat="server" />
    </form>
</body>
</html>
