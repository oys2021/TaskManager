package com.taskmanager.util;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnectionTest {
    private static final Logger LOGGER = Logger.getLogger(DBConnectionTest.class.getName());

    public static void main(String[] args) {
        try (Connection conn = DBUtil.getConnection()) {
            if (conn != null && !conn.isClosed()) {
                LOGGER.info("Connection to PostgreSQL was successful!");
            } else {
                LOGGER.warning("Connection was not established.");
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database connection test failed.", e);
        }
    }
}
