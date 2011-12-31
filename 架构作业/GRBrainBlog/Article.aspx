<%@ Page Language="C#" AutoEventWireup="true" Debug ="true"  CodeFile="Article.aspx.cs" Inherits="Article" %>

<%@ Register Src="Inc/AddPingLun.ascx" TagName="AddPingLun" TagPrefix="uc3" %>

<%@ Register Src="Inc/bottom.ascx" TagName="bottom" TagPrefix="uc2" %>

<%@ Register Src="Inc/top.ascx" TagName="top" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title><%=dr["b_title"].ToString()%></title>
    <link href ="GRBrainNET.css" rel ="Stylesheet" type ="text/css" />
    <link rel="shortcut icon" href="favicon.ico" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        <uc1:top ID="Top1" runat="server" />
        <div style="text-align: center">
            <table cellpadding="0" cellspacing="0" style="width: 90%">
                <tr>
                    <td style="width: 90%; text-align: left">
                        <a href ="index.aspx" class="blue">首页</a>&nbsp; &gt;&gt; &nbsp; &nbsp;
                        <%=dr["b_title"].ToString()%></td>
                </tr>
            </table>
        </div>
        <table cellpadding="0" cellspacing="0" style="width: 90%; border-bottom: #330033 1px groove">
            <tr>
                <td rowspan="2" style="width: 90%; height: 21px; text-align: left">
                    <div style="text-align: center">
                        <br />
                        <table style="width: 826px">
                            <tr>
                                <td style="width: 751px; font-weight: normal; font-size: 13px; color: #330033; height: 18px; background-color: gainsboro;"  >
                                  标题:  <%=dr["b_title"].ToString ()  %><br />
                                   </td>   
                                    
                            </tr>
                            <tr><td style="width: 751px" rowspan="2"> 
                                <asp:FormView ID="FormView1" runat="server" Width ="114%">
                                  <ItemTemplate>  <table style="width: 90%">
            <tr>
                <td style="font-size: 14px; width: 90%; color: #000033; line-height: 25px; " align ="center">
                    </td>
            </tr>
            <tr>
                <td style="width: 90%; line-height: 20px;" align ="center" >
                    发布者：【<%=dr["b_author"].ToString()%>】阅读次数：【<%=dr["b_click"] %>】发布时间：【<%=dr["b_time"]%>】</td>
            </tr>
            <tr>
                <td style="width: 90%; height: 20px; text-align: center;">
                    图片：<asp:Image ID="Image1"  Width ="200px" Height ="300px" ImageUrl='<%#Eval("b_img") %>' AlternateText ="点击查看大图"  runat="server" />
                    <asp:HyperLink ID ="hy1" runat ="server" Text= "点击查看大图" NavigateUrl ='<%#"ShowPic.aspx?b_id="+Eval("b_id") %>'></asp:HyperLink>
                    </td>
            </tr>
            <tr>
                <td style="width: 90%; line-height: 22px; height: 20px" align="left">
                    <%=FormatString(dr["b_content"].ToString()).ToString ()%> </td>
            </tr>
        </table></ItemTemplate>
                                </asp:FormView>
                            </td></tr>
                            <tr>
                            </tr>
                            <tr>
                                <td style="width: 100%; text-align: left; font-size: 13px; line-height: 22px;">
                                    </td>
                            </tr>
                            <tr style="font-size: 9pt">
                                <td style="width: 751px; border-bottom: #660033 1px solid; font-weight: bold; font-size: 14px; color: #330033; text-align: left;">  
                                    <span style="color:Red ">评论</span></td>
                            </tr>
                            <tr style="font-size: 9pt">
                                <td style="width: 751px; text-align: left">
                                    <asp:DataList ID="DataList1" runat="server" ShowHeader ="true" ShowFooter ="false" Width="698px">
                                    <ItemTemplate >
                                    <table style="WIDTH: 600px"><TR><TD 
style="WIDTH: 100%; HEIGHT: 18px; BACKGROUND-COLOR: activeborder" 
class="tbx">发帖人:<%#Eval("re_name")%>  &nbsp; | 时间:<%#Eval("re_time") %></TD></TR><TR><TD 
style="WIDTH: 100%; HEIGHT: 16px">标题：<%#Eval("re_title") %></TD></TR><TR><TD 
style="WIDTH: 100%">内容：<%#Eval("re_content") %></TD></TR></TABLE>
</ItemTemplate>
                                    </asp:DataList>
                                    
                                </td>
                            </tr>
                            <tr style="font-size: 9pt">
                                <td style="width: 751px; text-align: left">
                                    <div style="text-align: left">
                                        &nbsp;&nbsp;&nbsp;
                                        <uc3:AddPingLun ID="AddPingLun1" runat="server" />
                                    </div>
                                </td>
                            </tr>
                            <tr style="font-size: 9pt">
                                <td style="width: 751px; text-align: left">
                                    <span style="color: #0000ff; text-decoration: underline"><a href ="javascript:window.history.go(-1)" >返回</a> </span>
                            &nbsp; <a href="javascript:window.print()"><font color="#666666">打印本页</font></a>&nbsp;
                            <a href="#" onclick="javacript:window.close();"> 关闭本页</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
            </tr>
        </table>
        <uc2:bottom ID="Bottom1" runat="server" />
    
    </div>
    </form>
</body>
</html>
