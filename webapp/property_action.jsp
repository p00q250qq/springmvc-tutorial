<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>添加结果</title>
</head>
<body>
<%

    String appliedItem = request.getParameter("资产");
    int appliednumber = Integer.valueOf(request.getParameter("添加数量"));
    if (appliedItem == null || appliednumber == 0) {
        out.print("资产或添加数量为空<a href='ks_property_form.jsp'>返回</a>");
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

            // 查询是否已经存在该财产名称的记录
            String querySql = "SELECT `数量` FROM `资产信息表α` WHERE `财产名称`=?";
            PreparedStatement queryStmt = conn.prepareStatement(querySql);
            queryStmt.setString(1, appliedItem);
            ResultSet resultSet = queryStmt.executeQuery();

            if (resultSet.next()) {
                // 如果存在记录，获取原有数量并进行更新
                int originalQuantity = resultSet.getInt("数量");
                int newQuantity = originalQuantity + appliednumber;

                String updateSql = "UPDATE `资产信息表α` SET `数量`=? WHERE `财产名称`=?";
                PreparedStatement updateStmt = conn.prepareStatement(updateSql);
                updateStmt.setInt(1, newQuantity);
                updateStmt.setString(2, appliedItem);

                int rowsAffected = updateStmt.executeUpdate();
                if (rowsAffected > 0) {
                    // 更新成功的处理逻辑
%>
<script>
    window.location.href = "PropertyServlet";
    alert("添加成功");
</script>
<%
    } else {
        out.print("添加申请失败！未知错误。");
    }
} else {
    // 如果不存在记录，直接插入一条新的记录
    String insertSql = "INSERT INTO `资产信息表α` (`财产名称`, `数量`) VALUES (?, ?)";
    PreparedStatement insertStmt = conn.prepareStatement(insertSql);
    insertStmt.setString(1, appliedItem);
    insertStmt.setInt(2, appliednumber);

    int rowsAffected = insertStmt.executeUpdate();
    if (rowsAffected > 0) {
        // 插入成功的处理逻辑
%>
<script>
    window.location.href = "PropertyServlet";
    alert("添加成功");
</script>
<%
                } else {
                    out.print("添加申请失败！未知错误。");
                }
            }

            // 关闭资源
            resultSet.close();
            queryStmt.close();
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
