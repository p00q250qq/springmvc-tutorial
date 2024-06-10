import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "UpdateServlet", value = "/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String 申请人姓名 = request.getParameter("申请人姓名");
        String 申请用品 = request.getParameter("申请用品");
        String 批准与否 = request.getParameter("批准与否");
        String 申请个数 = request.getParameter("申请个数");
        String message = ""; // 初始化提示信息
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            //数据库链接字符
            String url = "jdbc:mysql://localhost:3306/warehouse";
            String username="root";
            String password="root";
            //创建链接
            Connection conn= DriverManager.getConnection(url,username,password);
            //更新
            String sql = "update 申请记录表α set 批准与否=? where 申请人姓名 = ? and 申请用品= ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, 批准与否);
            ps.setString(2, 申请人姓名);
            ps.setString(3, 申请用品);
            ps.executeUpdate();//执行更新操作
            ps.close();

            if ("是".equals(批准与否)) {
                // 在资产信息表中查找财产名称并检查数量
                String assetName = 申请用品;
                int requestedQuantity = Integer.valueOf(申请个数);  // 获取申请的数量
                String checkSql = "select 数量 from 资产信息表α where 财产名称 = ?";
                PreparedStatement checkPs = conn.prepareStatement(checkSql);
                checkPs.setString(1, assetName);
                ResultSet rs = checkPs.executeQuery();
                if (rs.next()) {
                    int quantity = rs.getInt("数量");
                    if (quantity >= requestedQuantity) {
                        // 执行减少财产数量的操作
                        String reduceSql = "update 资产信息表α set 数量 = ? where 财产名称 = ?";
                        PreparedStatement reducePs = conn.prepareStatement(reduceSql);
                        reducePs.setInt(1, quantity - requestedQuantity);
                        reducePs.setString(2, assetName);
                        reducePs.executeUpdate();
                        reducePs.close();
                    } else {
                        // 提示数量不够
                        message = "库存中 " + assetName + " 的数量不够！";
                        // 将批准与否设置为"否"
                        String sql1 = "update 申请记录表α set 批准与否=? where 申请人姓名 = ? and 申请用品= ?";
                        PreparedStatement ps1 = conn.prepareStatement(sql1);
                        ps1.setString(1, "否");
                        ps1.setString(2, 申请人姓名);
                        ps1.setString(3, 申请用品);
                        ps1.executeUpdate();//执行更新操作
                        ps1.close();

                        conn.rollback(); // 回滚数据库操作
                    }
                } else {
                    // 提示库里找不到该财产
                    message = "库里找不到 " + assetName;
                    // 将批准与否设置为"否"
                    String sql2 = "update 申请记录表α set 批准与否=? where 申请人姓名 = ? and 申请用品= ?";
                    PreparedStatement ps2 = conn.prepareStatement(sql2);
                    ps2.setString(1, "否");
                    ps2.setString(2, 申请人姓名);
                    ps2.setString(3, 申请用品);
                    ps2.executeUpdate();//执行更新操作
                    ps2.close();

                    conn.rollback(); // 回滚数据库操作
                }
                checkPs.close();
            }

            conn.close();
        } catch (Exception e) {
            System.out.print("修改批准失败！发生异常：" + e.getMessage());
            e.printStackTrace();
        }

        // 将提示信息作为参数传递给前端页面
        // 获取Session对象
        HttpSession session = request.getSession();
        // 在Session中存储数据
        session.setAttribute("message", message);
        response.sendRedirect("FindApply");
//        request.getRequestDispatcher("apply_list.jsp").forward(request, response);
    }
}
