<%@ Page Language="C#" AutoEventWireup="true" Debug ="true" CodeFile="Register.aspx.cs" Inherits="Inc_Register" %>

<%@ Register Src="Inc/bottom.ascx" TagName="bottom" TagPrefix="uc4" %>

<%@ Register Src="Inc/top.ascx" TagName="top" TagPrefix="uc3" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>注册</title>
    <link href="GRBrainNET.css" rel="stylesheet" type="text/css" />
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
    <div style="text-align: center">
        &nbsp;<uc3:top ID="Top1" runat="server" />
        <div style="text-align: center">
            <table style="width: 90%; border-right: gainsboro 1px solid; border-top: gainsboro 1px solid; border-left: gainsboro 1px solid; border-bottom: gainsboro 1px solid;">
                <tr>
                    <td style="width: 100px">
                        <div style="text-align: center">
                          <h2>必填项</h2>
                            <table width="600">
                                <tr>
                                    <td style="text-align: left;" width="600">
                                        用户名：<asp:TextBox ID="TextBox1" runat="server" CssClass="tbx" Width="156px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                            ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                                        <asp:Button ID="Button3" runat="server" CssClass="btn" OnClick="Button3_Click" Text="检测用户名" />
                                        <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" width="600">
                                        密码： &nbsp;
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="tbx" Width="156px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                                            ErrorMessage="不能为空" EnableClientScript="False"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td style="width: 600px; text-align: left;">
                                        用户性别：<asp:DropDownList ID="DropDownList1" runat="server">
                                            <asp:ListItem>男</asp:ListItem>
                                            <asp:ListItem>女</asp:ListItem>
                                        </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td style="width: 600px; text-align: left;">
                                        用户Email:<asp:TextBox ID="TextBox4" runat="server" CssClass="tbx" Width="338px"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4"
                                            ErrorMessage="格式不正确" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" EnableClientScript="False"></asp:RegularExpressionValidator></td>
                                </tr>
                                <tr>
                                    <td style="width: 600px; text-align: left">
                                        安全问题：
                                        <asp:DropDownList ID="DropDownList2" runat="server">
                                            <asp:ListItem>我的出生地？</asp:ListItem>
                                            <asp:ListItem>你最爱的电影？</asp:ListItem>
                                            <asp:ListItem>你初中的一位老师？</asp:ListItem>
                                        </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td style="width: 600px; text-align: left">
                                        问题答案：<asp:TextBox ID="TextBox8" runat="server" CssClass="tbx"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox8"
                                            ErrorMessage="必埴" EnableClientScript="False"></asp:RequiredFieldValidator></td>
                                </tr>
                            </table>
                           <h2>选填项</h2> <table width="600">
                                <tr>
                                    <td style="width: 100px; text-align: left;" valign="top">
                                        备注：<asp:TextBox ID="TextBox7" runat="server" CssClass="tbx" Height="100px" TextMode="MultiLine"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 100px; text-align: left;">
                                        出生日期：<asp:TextBox ID="TextBox5" runat="server" CssClass="tbx" Width="156px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 100px; text-align: left;">
                                        联系地址：<asp:TextBox ID="TextBox6" runat="server" CssClass="tbx" Width="468px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 100px" rowspan="4">
                                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Width="546px"></asp:Label></td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                    <td style="width: 100px; text-align: center;">
                                        <asp:Button ID="Button1" runat="server" CssClass="btn" OnClick="Button1_Click" Text="注册" />
                                        &nbsp;
                                        <asp:Button ID="Button2" runat="server" CssClass="btn" OnClick="Button2_Click" Text="取消" /></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    
    </div>
        <uc4:bottom ID="Bottom1" runat="server" />
    </form>
</body>
</html>
