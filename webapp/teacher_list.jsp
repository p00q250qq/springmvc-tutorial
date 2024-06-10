<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/4/29
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="bean.Teacher" %>
<%@ page import="bean.TeacherDao"%>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('image_download_1712395592043.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            background-color: #fff;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        td:last-child {
            text-align: center;
        }
        .delete-button {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 3px;
            cursor: pointer;
        }
        .delete-button:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
<div style="overflow-x:auto;">
    <table>
        <thead>
        <tr>
            <th>职员编号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>删除</th>
        </tr>
        </thead>
        <tbody>
        <%
            //获取老师信息集合
            List<Teacher> list = (List<Teacher>) request.getAttribute("list");
            //判断集合有效
            if(list==null || list.size()<1){
                out.print("<tr><td colspan=\"5\">没有数据！</td></tr>");
            }else{
                //遍历老师集合当中的数据
                for(Teacher teacher:list){
        %>
        <tr>
            <td><%=teacher.get职员编号()%></td>
            <td><%=teacher.get姓名()%></td>
            <td><%=teacher.get性别()%></td>
            <td><%=teacher.get年龄()%></td>
            <td>
                <a href="teacher_delete.jsp?职员编号=<%=teacher.get职员编号()%>">
                    <button class="delete-button">删除</button>
                </a>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>
<%=request.getAttribute("bar")%><br>
<a href="ks_adminPage.jsp"><h2>返回</h2></a>
</body>
</html>
