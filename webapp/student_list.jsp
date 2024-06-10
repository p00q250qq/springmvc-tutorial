<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/5/9
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.*" %>
<%@ page import="bean.Student" %>
<%@ page import="bean.StudentDao" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <tr>
        <td>ID</td>
        <td>姓名</td>
        <td>性别</td>
        <td>年龄</td>
    </tr>
    <%
        List<Student> list = (List<Student>)request.getAttribute("list");
        for(Student p:list){
    %>
    <tr>
        <td><%=p.getId()%></td>
        <td><%=p.getName()%></td>
        <%
            String s ="";
            if(p.getSex()==1){
                s="男";
            }else{
                s="女";
            }
        %>
        <td><%=s%></td>
        <td><%=p.getAge()%></td>
    </tr>
    <%
        }
    %>
</table>
<%=request.getAttribute("bar")%>
</body>
</html>
