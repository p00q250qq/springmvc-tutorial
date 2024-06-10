import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "approve_Servlet", value = "/approve_Servlet")
public class approve_Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        class ApplicationServlet extends HttpServlet {
            protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                String teacherName = request.getParameter("teacherName");
                String applicationStatus = request.getParameter("applicationStatus");


                if (applicationStatus.equals("approved")) {

                    response.sendRedirect("approved.jsp"); // 重定向到批准成功页面
                } else if (applicationStatus.equals("rejected")) {

                    response.sendRedirect("rejected.jsp"); // 重定向到拒绝页面
                } else {
                    response.getWriter().write("无效的申请状态");
                }
            }
        }
    }
}