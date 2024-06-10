<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员主页</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('image_download_1712395592043.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
        }
        #welcome {
            background-image: url('image_download_1712395592043.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            background-color: #fff;
            padding: 20px;
            text-align: center;
            margin-bottom: 20px;
        }
        #welcome a {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        #welcome a:hover {
            background-color: #0056b3;
        }
        h1 {
            text-align: center;
        }
        .link-container {
            text-align: center;
            margin-top: 20px;
        }
        .link-container a {
            display: block;
            margin-bottom: 10px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .link-container a:hover {
            background-color: #0056b3;
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
<h1>欢迎来到管理员主页！</h1>
<div class="link-container">
    <a href="FindApply">对教职工的申请进行管理</a>
    <a href="TeacherServlet">管理教职工信息</a>
    <a href="PropertyServlet">管理财产</a>
</div>
</body>
</html>
