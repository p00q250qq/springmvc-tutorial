package bean;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDao {//封装了学生对象的数据库操作
    //获取数据库链接
    public Connection getConnection(){
        Connection conn = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/jspexample?useUnicode=ture&characterEncodeing=utf-8";
            String user="root";
            String password="root";
            conn = DriverManager.getConnection(url,user,password);
        }catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }
    public List<Student> find(int page){//分页查询
        List<Student> list = new ArrayList<Student>();
        Connection conn=getConnection();
        String sql = "select * from students order by id asc limit ?,?";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1,(page-1)*Student.PAGE_SIZE);
            ps.setInt(2,Student.PAGE_SIZE);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Student p = new Student();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setSex(rs.getInt("sex"));
                p.setAge(rs.getInt("age"));
                list.add(p);
            }
            rs.close();
            ps.close();
            conn.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //查询总记录数
    public int findCount(){
        int count = 0;
        Connection conn = getConnection();
        String sql = "select count(*) from students";
        try{
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next()){
                count = rs.getInt(1);
            }
            stmt.close();
            rs.close();
            conn.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return count;
    }
}
