<%--
  Created by IntelliJ IDEA.
  User: 13175
  Date: 2024/5/10
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="UTF-8">
  <title>批准教职工申请</title>
</head>
<body>
<h1>批准教职工申请</h1>
<form action="approve_Servlet" method="post">
  <label for="teacherName">教职工姓名：</label>
  <input type="text" id="teacherName" name="teacherName" required><br><br>

  <label for="applicationStatus">申请状态：</label>
  <select id="applicationStatus" name="applicationStatus" required>
    <option name="approved" value="approved">批准</option>
    <option name="rejected" value="rejected">拒绝</option>
  </select><br><br>

  <input type="submit" value="提交">
</form>
</body>
</html>
