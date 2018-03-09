package main.java.dbmanager;

import java.sql.*;
import java.util.ArrayList;

public class DbManager {
    private static final String URL = "jdbc:mysql://localhost:3306/kammodedb?useSSL=false&serverTimezone=GMT";

    private static final String USERNAME = "test";
    private static final String PASSWORD = "";
    private static Connection connection = null;



    public DbManager() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }
    private void close() {
        try {
            connection.close();
        } catch (SQLException exception) {
            exception.printStackTrace();
        }

    }
}
