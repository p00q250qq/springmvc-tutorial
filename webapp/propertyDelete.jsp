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
  <title>删除已经没有的财产</title>
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

%>

<%
  try{
    Class.forName(DBDRIVER);
    conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
    String sql = "DELETE FROM `资产信息表α` WHERE `数量` = ?";
    // 使用 PreparedStatement
    pst = conn.prepareStatement(sql);
    pst.setInt(1, 0);
    rs=pst.executeUpdate();
    if(rs!=0){
      out.println("删除成功");
%>
<jsp:forward page="PropertyServlet"/>
<%
    }
  }
  catch(Exception e){
    out.println(e);
  }



%>
</body>
</html>