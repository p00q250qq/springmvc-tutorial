<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/5/9
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="batch" class="Batch"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //执行批量添加的操作
    int row=batch.saveBatch();
    out.print("插入了"+row+"条数据！");
%>
</body>
</html>
