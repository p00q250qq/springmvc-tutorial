<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>教具、办公用品或其他耗材/固定资产</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-image: url('image_download_1712395592043.jpg');
      background-size: cover;
      background-repeat: no-repeat;
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
    }
    form {
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    label {
      margin-bottom: 10px;
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
      background-color: #007bff;
      color: #fff;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }
    input[type="submit"]:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
<%
  String username = (String)session.getAttribute("username");
%>
<div class="container">
  <h1>教具、办公用品或其他耗材/固定资产</h1>
  <form action="property_action.jsp">
    <label for="资产">资产</label>
    <input type="text" id="资产" name="资产">
    <label for="添加数量">添加数量</label>
    <input type="text" id="添加数量" name="添加数量">
    <input type="submit" value="添加">
  </form><br>
  <a href="PropertyServlet">返回财产页面</a>
</div>
</body>
</html>
