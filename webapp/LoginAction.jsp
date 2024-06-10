<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String role = request.getParameter("role");
    String redirectUrl = "";

    // 数据库连接
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        // 加载数据库驱动
        Class.forName("com.mysql.cj.jdbc.Driver");

        // 建立数据库连接
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/warehouse", "root", "root");

        // 查询数据库中是否存在对应用户
        String query = "";
        if ("teacher".equals(role)) {
            query = "SELECT * FROM 教职工登录表 WHERE 用户名 = ? AND 用户密码 = ?";
        } else if ("admin".equals(role)) {
            query = "SELECT * FROM 管理员登录表 WHERE 用户名 = ? AND 用户密码 = ?";
        }
        stmt = conn.prepareStatement(query);
        stmt.setString(1, username);
        stmt.setString(2, password);
        rs = stmt.executeQuery();

        if (rs.next()) {
            // 用户验证通过，根据角色跳转到不同页面
            session.setAttribute("username", username);
            if ("teacher".equals(role)) {
                redirectUrl = "ks_teacherPage.jsp";
            } else if ("admin".equals(role)) {
                redirectUrl = "ks_adminPage.jsp";
            } else {
                // 无效的角色选择，返回登录页面
                redirectUrl = "ks_login.jsp";
            }
        } else {
            // 用户验证失败，设置错误消息并重定向到登录页面
            // 错误消息被设置为请求属性 (request.setAttribute("errorMessage", "用户名或密码不正确，请重新输入！");)，
            // 但在重定向之后并没有在登录页面中显示出来。这是因为重定向会导致请求和响应的结束，而且重定向后的页面是一个全新的请求，
            // 因此之前设置的请求属性在新请求中不再有效。解决这个问题的一种方法是将错误消息存储在会话（session）中，
            // 这样它就可以在重定向后的页面中保持有效。
            session.setAttribute("errorMessage", "用户名或密码不正确，请重新输入！");
            redirectUrl = "ks_login.jsp";
        }
    } catch (Exception e) {
        e.printStackTrace();
        // 出现异常，设置错误消息并重定向到登录页面
        request.setAttribute("errorMessage", "发生异常，请稍后重试！");
        redirectUrl = "ks_login.jsp";
    } finally {
        // 关闭数据库连接
        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
    // 重定向到对应页面
    response.sendRedirect(redirectUrl);
%>
