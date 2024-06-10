import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 这里可以添加处理GET请求的逻辑，例如跳转到登录页面
        response.sendRedirect("ks_login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String role = request.getParameter("role");
        String redirectUrl = "";
//        session.setAttribute("username", username);

        if ("teacher".equals(role) && username !=" " && password != " ") {
            // 教职工登陆逻辑
            redirectUrl = "ks_teacherPage.jsp";
        } else if ("admin".equals(role) && username !=" " && password != " ") {
            // 管理员登陆逻辑
            redirectUrl = "ks_adminPage.jsp";
        } else {
            // 无效的选择，返回登陆页面
            redirectUrl = "ks_login.jsp";
        }

        response.sendRedirect(redirectUrl);
    }
}