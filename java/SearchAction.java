import bean.Apply;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SearchAction", value = "/SearchAction")
public class SearchAction extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 加载数据库驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
            // 数据库链接字符
            String url = "jdbc:mysql://localhost:3306/warehouse";
            String username = "root";
            String password = "root";
            // 创建链接
            conn = DriverManager.getConnection(url, username, password);

            // 获取当前登录教师的用户名
            String teacherName = (String) request.getSession().getAttribute("username");
            String keyword = request.getParameter("keyword");
            // 查询语句
            String sql = "SELECT * FROM 申请记录表α WHERE 申请人姓名 = ? and 申请用品 LIKE ?";

            // 预编译查询语句
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, teacherName);
            pstmt.setString(2, "%" + keyword + "%");

            rs = pstmt.executeQuery();

            List<Apply> list = new ArrayList<Apply>();
            while (rs.next()) {
                Apply apply = new Apply();
                apply.set申请人姓名(rs.getString("申请人姓名"));
                apply.set申请用品(rs.getString("申请用品"));
                apply.set申请个数(rs.getInt("申请个数"));
                apply.set申请原因(rs.getString("申请原因"));
                apply.set申请时间(rs.getString("申请时间"));
                apply.set批准与否(rs.getString("批准与否"));
                apply.set管理员原因或意见(rs.getString("管理员原因或意见"));
                list.add(apply);
            }
            request.setAttribute("list", list);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // 可以给用户一个友好的错误提示，或者记录日志
            // request.setAttribute("error", "An error occurred while processing your request.");
        } finally {
            // 关闭 ResultSet、PreparedStatement 和 Connection
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        // 请求转发到 read_list.jsp 页面
        request.getRequestDispatcher("read_list.jsp").forward(request, response);
    }
}
