<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>申请教具、办公用品或其他耗材/固定资产</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffeb3b; /* 修改背景颜色为橙黄色 */
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #ffa726; /* 修改标题颜色为橙色 */
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        label {
            margin-bottom: 10px;
            color: #333; /* 修改标签颜色为深灰色 */
        }
        input[type="number"],
        input[type="text"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #ff5722; /* 修改提交按钮颜色为橙色 */
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #ff7043; /* 修改提交按钮鼠标悬停时的颜色 */
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
    </style>
</head>
<body>
<jsp:include page="head.jsp" />
<%
    String username = (String)session.getAttribute("username");
%>
<h1 style="color: orange;">欢迎来到普通教职工主页！</h1>
<div id="navbar">
    <a href="ks_apply_form.jsp">资产申请</a>
    <a href="ReadApply">申请记录</a>

</div>

<div class="container">
    <h1>申请教具、办公用品或其他耗材/固定资产</h1>
    <form action="action.jsp">
        <label for="申请用品">申请用品</label>
        <input type="text" id="申请用品" name="申请用品">
        <label for="申请个数">申请个数</label>
        <input type="text" id="申请个数" name="申请个数">
        <label for="申请原因">申请原因</label>
        <input type="text" id="申请原因" name="申请原因">
        <label for="申请时间">申请时间</label>
        <input type="text" id="申请时间" name="申请时间">
        <input type="submit" value="提交申请">
    </form>
</div>
</body>
</html>
