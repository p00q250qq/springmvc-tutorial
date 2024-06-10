<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/4/29
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="bean.Apply" %>
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
        .container {
            margin: 20px auto;
            width: 80%;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
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
        .update-form {
            display: inline-block;
        }
        .delete-button {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 3px;
            cursor: pointer;
            text-decoration: none;
        }
        .delete-button:hover {
            background-color: #c82333;
        }
    </style>
    <%
        String message = (String) session.getAttribute("message");
        if (message != null && !message.isEmpty()) {
    %>
    <script>
        // 弹出消息提示框
        alert("<%= message %>");
        // 将消息设置为null
        <% session.setAttribute("message", null); %>
    </script>
    <%
        }
    %>
</head>
<body>
<div class="container">
    <table>
        <thead>
        <tr>
            <th>申请人姓名</th>
            <th>申请用品</th>
            <th>申请个数</th>
            <th>申请原因</th>
            <th>申请时间</th>
            <th>批准与否</th>
            <th>管理员原因或意见</th>
            <th>删除</th>
        </tr>
        </thead>
        <tbody>
        <%
            //获取申请信息集合
            List<Apply> list = (List<Apply>) request.getAttribute("list");
            //判断集合有效
            if(list==null || list.size()<1){
                out.print("<tr><td colspan=\"6\">没有数据！</td></tr>");
            }else{
                //遍历申请集合当中的数据
                for(Apply apply:list){
        %>
        <tr>
            <td><%=apply.get申请人姓名()%></td>
            <td><%=apply.get申请用品()%></td>
            <td><%=apply.get申请个数()%></td>
            <td><%=apply.get申请原因()%></td>
            <td><%=apply.get申请时间()%></td>
            <td>
                <%=apply.get批准与否()%>
                <form class="update-form" action="UpdateServlet" method="post">
                    <input type="hidden" name="申请人姓名" value="<%=apply.get申请人姓名()%>" >
                    <input type="hidden" name="申请用品" value="<%=apply.get申请用品()%>">
                    <input type="hidden" name="申请个数" value="<%=apply.get申请个数()%>">
<%--                    hidden为了唯一确定数据--%>
                    <select name="批准与否">
                        <option value="未处理" selected>未处理</option>
                        <option value="否">否</option>
                        <option value="是">是</option>
                    </select>
                    <input type="submit" value="修改">
                </form>
            </td>
            <td>
                <%=apply.get管理员原因或意见()%>
                <form class="update-form1" action="AddServlet" method="post">
                    <input type="hidden" name="申请人姓名" value="<%=apply.get申请人姓名()%>" >
                    <input type="hidden" name="申请用品" value="<%=apply.get申请用品()%>">
                    <%--                    hidden为了唯一确定数据--%>
                    <input type="text" id="管理员原因或意见" name="管理员原因或意见">
                    <input type="submit" value="写原因或意见">
                </form>
            </td>
            <td>
                <a href="apply_delete.jsp?申请人姓名=<%=apply.get申请人姓名()%>&amp;申请用品=<%=apply.get申请用品()%>" class="delete-button">小删</a>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
    <br><a href="ks_adminPage.jsp"><h2>返回</h2></a>
</div>
</body>
</html>
