package com.example.user.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepository {
    private static final String URL="jdbc:mysql://localhost:3306/user_database";
    private static final String USERNAME="root";
    private static final String PASSWORD="123456789";

    private BaseRepository() {
    }
    public static Connection getConnection() {
        Connection connection=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection= DriverManager.getConnection(URL,USERNAME,PASSWORD);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }
}
