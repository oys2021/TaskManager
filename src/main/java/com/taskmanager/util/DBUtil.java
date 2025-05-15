package com.taskmanager.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBUtil {
    private static  String URL = "jdbc:postgresql://localhost:5432/task_manager";
    private static  String USER = "postgres";
    private static  String PASSWORD = "admin1234";

    public static void setTestConnection(String url, String user, String password) {
        URL = url;
        USER = user;
        PASSWORD = password;
    }

    private static final Logger LOGGER = Logger.getLogger(DBUtil.class.getName());

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "PostgreSQL JDBC Driver not found.", e);
            throw new SQLException("PostgreSQL JDBC Driver not found", e);
        }

        try {
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Failed to connect to PostgreSQL database.", e);
            throw e;
        }
    }
}
