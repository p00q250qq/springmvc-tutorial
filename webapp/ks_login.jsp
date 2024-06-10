<%--
  Created by IntelliJ IDEA.
  User: 13175
  Date: 2024/5/10
  Time: 13:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('微信图片_20240527212300.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 300px;
            margin: 100px auto;
            background-color: #fff;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        input[type="text"],
        input[type="password"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
    <meta charset="UTF-8">
    <title>登录</title>
</head>
<body>
<div class="container">
<h1>登录</h1>
    <%-- 显示错误消息 --%>
    <%
        String errorMessage = (String) session.getAttribute("errorMessage");
        if (errorMessage != null && !errorMessage.isEmpty()) {
    %>
    <script>
        // 弹出消息提示框
        alert("<%= errorMessage %>");
    </script>
    <%
            session.removeAttribute("errorMessage"); // 清除错误消息，确保下次登录时不再显示
        }
    %>


    <form action="LoginAction.jsp" >
    <label for="username">用户名：</label>
    <input type="text" id="username" name="username" required><br>
    <label for="password">密码：</label>
    <input type="password" id="password" name="password" required><br>
    <label for="role">身份：</label>
    <select id="role" name="role">
        <option value="teacher">普通教职工</option>
        <option value="admin">管理员</option>
    </select><br>
    <input type="submit" value="登录">
</form>
</div>
</body>
</html>



