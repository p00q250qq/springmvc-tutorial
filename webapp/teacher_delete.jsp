<%--
  Created by IntelliJ IDEA.
  User: 长风
  Date: 2019/9/21
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<html>
<head>
    <title>数据删除</title>
</head>
<body>
<%!
    public static final String DBDRIVER="com.mysql.cj.jdbc.Driver";
    public static final String DBURL="jdbc:mysql://localhost:3306/warehouse";
    public static final String DBUSER="root";
    public static final String DBPASS="root";
%>
<%
    Connection conn=null;
    PreparedStatement pst=null;
    int rs=0;
    int teacherID = Integer.valueOf(request.getParameter("职员编号"));
%>

<%
    try{
        Class.forName(DBDRIVER);
        conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
        String sql = "DELETE FROM `教职工信息表α` WHERE `职员编号` = "+ teacherID;
        //获取要删除的此id的数据库信息
        pst=conn.prepareStatement(sql);
        rs=pst.executeUpdate();
        if(rs!=0){
            out.println("删除成功");
%>
<jsp:forward page="TeacherServlet"/>
<%
        }
    }
    catch(Exception e){
        out.println(e);
    }

%>
</body>
</html>