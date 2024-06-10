<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>申请结果</title>
</head>
<body>
<%
    String username = (String)session.getAttribute("username");


    String appliedItem = request.getParameter("申请用品");
    int appliednumber = Integer.valueOf(request.getParameter("申请个数"));
    String appliedreason = request.getParameter("申请原因");
    String applicationTime = request.getParameter("申请时间");
    if ( appliedItem == null || applicationTime == null || appliednumber == 0  || appliedreason == null) {
        out.print("申请用品、申请时间、申请个数或申请原因为空");
    } else {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            // 加载数据库驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/warehouse";
            String username1 = "root";
            String password = "root";
            // 创建连接
            conn = DriverManager.getConnection(url, username1, password);
            // 添加申请记录的 SQL 语句
            String sql = "INSERT INTO `申请记录表α`(`申请人姓名`, `申请用品`, `申请个数`, `申请原因`, `申请时间`, `批准与否`,`管理员原因或意见`) VALUES (?, ?, ?, ?, ?, ?,?)";
            pstmt = conn.prepareStatement(sql);
            // 设置参数
            pstmt.setString(1, username);
            pstmt.setString(2, appliedItem);
            pstmt.setInt(3,appliednumber);
            pstmt.setString(4, appliedreason);
            pstmt.setString(5, applicationTime);
            pstmt.setString(6, "未处理");
            pstmt.setString(7,"无");
            // 执行更新
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
%>
<script>

    window.location.href = "ReadApply";
    alert("申请成功");
</script>

<%
            } else {
                out.print("添加申请失败！未知错误。");
            }
        } catch (SQLException | ClassNotFoundException e) {
            out.print("添加申请失败！发生异常：" + e.getMessage());
            e.printStackTrace();
        } finally {
            // 关闭资源
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
<br>
</body>
</html>
