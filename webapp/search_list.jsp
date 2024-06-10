<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/4/29
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="bean.Apply" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>申请记录</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffeb3b; /* 修改背景颜色为橙黄色 */
            margin: 0;
            padding: 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #ff5722; /* 修改表头背景颜色为橙色 */
            color: white;
        }
        tr:nth-child(even) {
            background-color: #ffe0b2; /* 修改偶数行背景颜色为浅橙色 */
        }
        #navbar {
            background-color: #ff9800; /* 修改导航栏颜色为橙色 */
            overflow: hidden;
        }
        #navbar a {
            float: left;
            display: block;
            color: #ffffff;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        #navbar a:hover {
            background-color: #ffa726; /* 修改鼠标悬停时的颜色 */
            color: black;
        }
        .delete-button {
            background-color: #ff5722; /* 修改按钮背景颜色为橙色 */
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        .delete-button:hover {
            background-color: #ff7043; /* 修改按钮鼠标悬停时的颜色 */
        }
    </style>
</head>
<body>
<jsp:include page="head.jsp" />

<div style="text-align: center;">
    <h1 style="color: orange;">欢迎来到普通教职工主页！</h1>
</div>
<div id="navbar">
    <a href="ks_apply_form.jsp">资产申请</a>
    <a href="ReadApply">申请记录</a>

</div>

<%--在这里写代码，输入关键字，查找名字含有关键字的财产并筛选出来--%>
<div style="text-align: center;">
    <form action="SearchAction">
        <input type="text" name="keyword" placeholder="请输入关键字">
        <input type="submit" value="搜索">
    </form>
</div>
<div style="overflow-x:auto;">
    <table>
        <thead>
        <tr>
            <th>申请人姓名</th>
            <th>申请用品</th>
            <th>申请个数</th>
            <th>申请原因</th>
            <th>申请时间</th>
            <th>批准与否</th>
            <th>管理员原因或意见</th>
        </tr>
        </thead>
        <tbody>
        <%
            //获取申请信息集合
            List<Apply> list = (List<Apply>) request.getAttribute("list");
            //判断集合有效
            if(list==null || list.size()<1){
                out.print("<tr><td colspan=\"4\">没有数据！</td></tr>");
            }else{
                //遍历申请集合当中的数据
                for(Apply apply:list){
        %>
        <tr>
            <td><%=apply.get申请人姓名()%></td>
            <td><%=apply.get申请用品()%></td>
            <td><%=apply.get申请个数()%></td>
            <td><%=apply.get申请原因()%></td>
            <td><%=apply.get申请时间()%></td>
            <td><%=apply.get批准与否()%></td>
            <td><%=apply.get管理员原因或意见()%></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <a href="applyDelete.jsp">
        <button class="delete-button">删除已经被处理的</button>
    </a>
    <a href="read_list.jsp">返回</a>
    <%
        }
    %>
</div>
</body>
</html>
