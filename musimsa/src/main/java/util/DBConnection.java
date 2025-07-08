package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver"); // 또는 사용하는 DB 드라이버
        String url = "jdbc:mysql://192.168.111.101:3306/musimsa";
        String user = "musimsaCart";
        String password = "1234";
        return DriverManager.getConnection(url, user, password);
    }
}
