<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<html>
<head>
    <title>删除已经批准的申请</title>
    <script type="text/javascript">
        function showAlert(message) {
            alert(message);
            window.location = "ks_teacherPage.jsp"; // 跳转到指定页面
        }
    </script>
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
    ResultSet rs=null;
%>

<%
    try{
        Class.forName(DBDRIVER);
        conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
        String sql = "SELECT COUNT(*) FROM `申请记录表α` WHERE `批准与否` != ?";
        // 使用 PreparedStatement
        pst = conn.prepareStatement(sql);
        pst.setString(1, "未处理");
        rs = pst.executeQuery();//执行查询
        if(rs.next() && rs.getInt(1) > 0){
            // 存在非“未处理”状态的申请记录，执行删除操作
            sql = "DELETE FROM `申请记录表α` WHERE `批准与否` != ?";
            pst = conn.prepareStatement(sql);
            pst.setString(1, "未处理");
            int affectedRows = pst.executeUpdate();
            if(affectedRows > 0){
                out.println("删除成功");
                // 转发到指定页面
%>
<jsp:forward page="ReadApply"/>
<%
        }
    } else {
        out.println("没有需要删除的记录"+"<a href='ReadApply'>返回</a>");

    }
} catch(Exception e){
    // 输出警告信息并跳转到指定页面
%>
<script type="text/javascript">
    showAlert("删除失败：" + "<%=e.getMessage()%>");
    //输出删除失败以及删除失败的原因
</script>
<%
    } finally {
        try {
            if(rs != null) rs.close();
            if(pst != null) pst.close();
            if(conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>
</body>
</html>
