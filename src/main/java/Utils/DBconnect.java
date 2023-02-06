package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnect {
    public Connection connectDB() {
        Connection connection = null;
        try {
            System.out.println("Connecting database ...");
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost/shoes", "root", "");
        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println("Connection error");
        }
        return connection;
    }

    public static void main(String[] args) {
        System.out.println(new DBconnect().connectDB());
    }
}

