package bean;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PropertyDao {//封装了老师对象的数据库操作
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
    public List<Property> find(int page){//分页查询
        List<Property> list = new ArrayList<Property>();
        Connection conn=getConnection();
        String sql = "select * from 资产信息表α order by 财产名称 asc limit ?,?";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1,(page-1)*Property.PAGE_SIZE);
            ps.setInt(2,Property.PAGE_SIZE);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Property p = new Property();
                p.set财产名称(rs.getString("财产名称"));
                p.set数量(rs.getInt("数量"));
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
        String sql = "select count(*) from 资产信息表α";
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
