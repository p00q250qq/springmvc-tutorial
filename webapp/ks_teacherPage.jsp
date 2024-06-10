<%--
  Created by IntelliJ IDEA.
  User: 13175
  Date: 2024/5/10
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>普通教职工主页</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        #content {
            width: 80%;
            margin: 20px auto;
            background-color: orange; /* 修改颜色为橙色 */
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
        }
        #navbar {
            background-color: orange; /* 修改颜色为橙色 */
            overflow: hidden;
        }
        #navbar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        #navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        #content #contentArea {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<jsp:include page="head.jsp" />
<%
    String username = (String)session.getAttribute("username");
%>
<h1 style="color: orange;">欢迎来到普通教职工主页！</h1>

<div id="navbar">
    <a href="ks_apply_form.jsp" style="background-color: orange;">资产申请</a>
    <a href="ReadApply" style="background-color: orange;">申请记录</a>

</div>

</body>
</html>
