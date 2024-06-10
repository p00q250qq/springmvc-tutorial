import bean.Apply;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FindApply", value = "/FindApply")
    public class FindApply extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //加载数据库驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
            //数据库链接字符
            String url = "jdbc:mysql://localhost:3306/warehouse";
            String username = "root";
            String password = "root";
            //创建链接
            Connection conn = DriverManager.getConnection(url, username, password);
            Statement stmt = conn.createStatement();//获取到Statement对象
            String sql = "select * from 申请记录表α";

            ResultSet rs = stmt.executeQuery(sql);//执行查询
            List<Apply> list = new ArrayList<Apply>();//创建动态数组
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
            request.setAttribute("list", list);//将申请集合放置到request中
            rs.close();
            stmt.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("apply_list.jsp").forward(request, response);//请求转发到apply_list.jsp
    }
}