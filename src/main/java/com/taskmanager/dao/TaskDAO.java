package com.taskmanager.dao;

import com.taskmanager.model.Task;
import com.taskmanager.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TaskDAO {
    private static final Logger LOGGER = Logger.getLogger(TaskDAO.class.getName());

    public void addTask(Task task) {
        String sql = "INSERT INTO tasks (title, description, due_date, status) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, task.getTitle());
            stmt.setString(2, task.getDescription());
            stmt.setString(3, task.getDueDate());
            stmt.setString(4, task.getStatus());

            java.sql.Date dueDate = java.sql.Date.valueOf(task.getDueDate());
            stmt.setDate(3, dueDate);

            stmt.setString(4, task.getStatus());
            stmt.executeUpdate();

            stmt.executeUpdate();
            LOGGER.info("Task added successfully.");
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error adding task to the database.", e);
        }
    }
}
