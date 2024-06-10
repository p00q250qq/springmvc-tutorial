import bean.Teacher;
import bean.TeacherDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TeacherServlet", value = "/TeacherServlet")
public class TeacherServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int currPage = 1;//当前页码
        if(request.getParameter("page")!=null){
            currPage = Integer.valueOf(request.getParameter("page"));//对当前页码进行赋值
        }
        TeacherDao dao = new TeacherDao();
        List<Teacher> list = dao.find(currPage);
        request.setAttribute("list",list);
        int pages=0;//总页数
        int count = dao.findCount();//查询总记录数
        if(count % Teacher.PAGE_SIZE == 0){
            pages = count / Teacher.PAGE_SIZE;
        }else{
            pages = count / Teacher.PAGE_SIZE+1;
        }
        StringBuffer sb = new StringBuffer();
        for(int i = 1; i <= pages;i++){
            if(i == currPage){
                sb.append("["+i+"]");
            }else{
                sb.append(" ");//构建分页条
                sb.append("<a href='TeacherServlet?page="+i+"'>"+i+"</a>");//构建分页条
            }
        }
        request.setAttribute("bar",sb.toString());
        request.getRequestDispatcher("teacher_list.jsp").forward(request,response);//转发到teacher_list页面
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
