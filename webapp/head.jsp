<%--
  Created by IntelliJ IDEA.
  User: 86157
  Date: 2024/5/12
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('微信图片_20240527212300.jpg');
            background-size: cover;
            background-repeat: no-repeat;
        }
        #welcome {
            text-align: center;
            margin-top: 50px;
        }
        #welcome a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        #welcome a:hover {
            background-color: #0056b3;
        }
        #welcome p {
            font-size: 20px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div id="welcome">
    <%
        String username = (String)session.getAttribute("username");
        if(username != null) {
            out.println("<p>お帰りなさい欢迎回来！！！\n " + username + "!<p>");
            out.println("<a href='logout.jsp'>退出</a>");
        } else {
    %>
    <a href="ks_login.jsp">登录</a>
    <%
        }
    %>
</div>
</body>
</html>
