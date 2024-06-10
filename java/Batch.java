import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Random;

public class Batch {
    private static final String DRIVER_CLASS="com.mysql.cj.jdbc.Driver";
    private static final String url = "jdbc:mysql://localhost:3306/jspexample";
    private static final String user="root";
    private static final String psw="root";

    public static Connection getConnection(){//获取数据库链接
        Connection dbConnection = null;
        try{
            Class.forName(DRIVER_CLASS);
            dbConnection= DriverManager.getConnection(url,user,psw);
        }catch(Exception e){
            e.printStackTrace();
        }
        return dbConnection;
    }

    //批量添加学生信息
    public int saveBatch(){
        int row = 0;//行数
        Connection conn = getConnection();//获取数据库链接
        try{
            String sql = "insert into students(id,name,sex,age)values(?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            Random random = new Random();
            for(int i = 0;i < 10;i++){
                ps.setInt(1,i+1);
                ps.setString(2,"student"+i);
                ps.setBoolean(3,i%2==0?true:false);
                ps.setInt(4,random.nextInt(5)+10);
                ps.addBatch();//添加批处理命令
            }
            //执行批处理操作并返回计数组成的数组
            int[] rows = ps.executeBatch();
            row=rows.length;//对行数赋值
            ps.close();
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return row;
    }
}
