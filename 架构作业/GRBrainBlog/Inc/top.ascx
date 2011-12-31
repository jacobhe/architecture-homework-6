<%@ Control Language="C#" AutoEventWireup="true" CodeFile="top.ascx.cs" Inherits="Inc_top" %>
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
        <td rowspan="2" style="width: 90%; height: 21px; text-align: left">
            <a href="./index.aspx" class="blue">网站首页</a> &nbsp;| &nbsp; <a href="./Article_List.aspx" class="blue">文章列表</a>&nbsp;
            |&nbsp; &nbsp;<a href="./guestbook/add_liuyan.aspx"class ="blue">留言反馈</a></td>
    </tr>
    <tr>
    </tr>
</table>
