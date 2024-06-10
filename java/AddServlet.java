import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "AddServlet", value = "/AddServlet")
public class AddServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String 申请人姓名 = request.getParameter("申请人姓名");
        String 申请用品 = request.getParameter("申请用品");
        String 管理员原因或意见 = request.getParameter("管理员原因或意见");
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            //数据库链接字符
            String url = "jdbc:mysql://localhost:3306/warehouse";
            String username="root";
            String password="root";
            //创建链接
            Connection conn= DriverManager.getConnection(url,username,password);
            //更新
            String sql = "update 申请记录表α set 管理员原因或意见=? where 申请人姓名 = ? and 申请用品= ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,管理员原因或意见);
            ps.setString(2,申请人姓名);
            ps.setString(3,申请用品);
            ps.executeUpdate();//执行更新操作
            ps.close();
            conn.close();
        }catch (Exception e){
            System.out.print("添加原因或意见失败！发生异常：" + e.getMessage());
            e.printStackTrace();
        }

        response.sendRedirect("FindApply");
    }
}