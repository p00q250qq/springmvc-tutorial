package bean;

public class Property {
    private String 财产名称;
    private int 数量;
    public static final int PAGE_SIZE=10;//每页的记录数

    public String get财产名称() {
        return 财产名称;
    }

    public void set财产名称(String 财产名称) {
        this.财产名称 = 财产名称;
    }

    public int get数量() {
        return 数量;
    }

    public void set数量(int 数量) {
        this.数量 = 数量;
    }
}
