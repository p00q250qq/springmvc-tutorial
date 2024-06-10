package bean;

public class Teacher {
    private int 职员编号;
    private String 姓名;
    private String 性别;
    private int 年龄;
    public static final int PAGE_SIZE=10;//每页的记录数
    public int get职员编号() {
        return 职员编号;
    }

    public void set职员编号(int 职员编号) {
        this.职员编号 = 职员编号;
    }

    public String get姓名() {
        return 姓名;
    }

    public void set姓名(String 姓名) {
        this.姓名 = 姓名;
    }

    public String get性别() {
        return 性别;
    }

    public void set性别(String 性别) {
        this.性别 = 性别;
    }

    public int get年龄() {
        return 年龄;
    }

    public void set年龄(int 年龄) {
        this.年龄 = 年龄;
    }
}
