package bean;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TeacherDao {//封装了老师对象的数据库操作
    //获取数据库链接
    public Connection getConnection(){
        Connection conn = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/warehouse?useUnicode=ture&characterEncodeing=utf-8";
            String user="root";
            String password="root";
            conn = DriverManager.getConnection(url,user,password);
        }catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }
    public List<Teacher> find(int page){//分页查询
        List<Teacher> list = new ArrayList<Teacher>();
        Connection conn=getConnection();
        String sql = "select * from 教职工信息表α order by 职员编号 asc limit ?,?";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1,(page-1)*Teacher.PAGE_SIZE);
            ps.setInt(2,Teacher.PAGE_SIZE);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Teacher p = new Teacher();
                p.set职员编号(rs.getInt("职员编号"));
                p.set姓名(rs.getString("姓名"));
                p.set性别(rs.getString("性别"));
                p.set年龄(rs.getInt("年龄"));
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
        String sql = "select count(*) from 教职工信息表α";
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
