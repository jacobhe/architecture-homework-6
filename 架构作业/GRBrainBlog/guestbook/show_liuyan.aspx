<%@ Page Language="C#" AutoEventWireup="true" CodeFile="show_liuyan.aspx.cs" Inherits="guestbook_show_liuyan" %>

<%@ Register Src="../Inc/top.ascx" TagName="top" TagPrefix="uc1" %>
<%@ Register Src="../Inc/bottom.ascx" TagName="bottom" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>留言反馈</title>
    <link href="../GRBrainNET.css" rel="stylesheet" type="text/css" />
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
    <div style="text-align: center">
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
                <td rowspan="2" style="width: 90%; height: 21px; background-color: #330033; text-align: left">
                    <a class="blue" href="../index.aspx">网站首页</a> &nbsp; &nbsp; &nbsp; <a class="blue"
                        href="../Article_List.aspx">文章列表</a>&nbsp; &nbsp; &nbsp; <a class="blue" href="add_liuyan.aspx">
                            留言反馈</a>
                </td>
            </tr>
            <tr>
            </tr>
        </table>
<table style="width: 90%; text-align: center;">
            <tr>
                <td align="center" style="width: 554px; text-align: left;">
                    <table cellpadding="0" cellspacing="0" style="width: 90%; background-color: white; text-align: center;">
                        <tr>
                            <td class="td" style="text-align: left" align ="center">
                                <asp:DataList ID="DataList1" runat="server" Width="100%">
                                    <ItemTemplate>
                                        <table width="100%"  align="center" >
                                            <tr>
                                                <td class="td" style="background-color: #A1D1C3" width="15%">
                                                    发表人</td>
                                                <td class="td" style="background-color: #A1D1C3">
                                                    <b>
                                                        <%# DataBinder.Eval(Container.DataItem,"m_subject") %>
                                                    </b>
                                                </td>
                                               
                                            </tr>
                                            <tr>
                                                <td class="td" width="20%">
                                                    <b>
                                                        <%# DataBinder.Eval(Container.DataItem,"m_name") %>
                                                    </b>
                                                    <br />
                                                    表情：<img border="0" src='images/<%# DataBinder.Eval(Container.DataItem,"m_face") %>' /><br />
                                                    <a href='mailto:<%# DataBinder.Eval(Container.DataItem,"m_email") %>'>
                                                        <img alt="发送邮件" border="0" src="img/mail.gif" /></a> <a href='<%# DataBinder.Eval(Container.DataItem,"m_http") %>'>
                                                            <img alt='网址：<%# DataBinder.Eval(Container.DataItem,"m_http") %>' border="0" src="img/index.gif" /></a>
                                                    <a href='http://bbs.qq.com/cgi-bin/bbs/friend/user_info_show?ln=<%# DataBinder.Eval(Container.DataItem,"m_qq") %>'
                                                        target="_blank">
                                                        <img alt="查看QQ用户资料" border="0" src="img/qq.gif" /></a>
                                                    <img alt='电话号码：<%# DataBinder.Eval(Container.DataItem,"m_phone") %>' border="0" src="img/phone.gif" />
                                                </td>
                                                <td class="td" colspan="2">
                                                    <img alt="留言内容" border="0" src="img/messages.gif" />发表于：<%# DataBinder.Eval(Container.DataItem,"m_datetime") %><hr />
                                                    <%#FormatString( DataBinder.Eval(Container.DataItem,"m_content").ToString ()).ToString () %>
                                                    <hr />
                                                    <font style="color: #829FF1">管理员回复：<asp:Label ID="l1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"m_reply") %>'></asp:Label><br />
                                                        回复时间：<%# DataBinder.Eval(Container.DataItem, "m_replytime")%>
                                                    </font>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList></td>
                        </tr>
                    </table>
                    <br />
                    <a target="_blank" href="http://sighttp.qq.com/authd?IDKEY=91baee3db7ee877c1f0dd1bd2be041f2b18d44292cba21d0"><img border="0"  src="http://wpa.qq.com/imgd?IDKEY=91baee3db7ee877c1f0dd1bd2be041f2b18d44292cba21d0&pic=41" alt="点击这里给我发消息" title="点击这里给我发消息"></a>
                    <br />
                    当前第<asp:Label ID="labPage" runat="server" CssClass="black">1</asp:Label>页/共有<asp:Label
                        ID="labBackPage" runat="server" CssClass="black"></asp:Label>页
                    <asp:LinkButton ID="lnkbtnOne" runat="server" CssClass="black" OnClick="lnkbtnOne_Click">第一页</asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnUp" runat="server" CssClass="black" OnClick="lnkbtnUp_Click">上一页</asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnNext" runat="server" CssClass="black" OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>&nbsp;
                    <asp:LinkButton ID="lnkbtnBack" runat="server" CssClass="black" OnClick="lnkbtnBack_Click">最后一页</asp:LinkButton></td>
            </tr>
        </table>
    
    </div>
        <uc2:bottom ID="Bottom1" runat="server" />
    </form>
</body>
</html>
