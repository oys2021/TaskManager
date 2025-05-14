package com.taskmanager.dao;

import com.taskmanager.model.Task;
import com.taskmanager.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TaskDAO {
    private static final Logger LOGGER = Logger.getLogger(TaskDAO.class.getName());

    public void addTask(Task task) throws SQLException {
        String sql = "INSERT INTO tasks (title, description, due_date, status) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, task.getTitle());
            stmt.setString(2, task.getDescription());

            java.sql.Date dueDate = java.sql.Date.valueOf(task.getDueDate());
            stmt.setDate(3, dueDate);

            stmt.setString(4, task.getStatus());

            stmt.executeUpdate();
            LOGGER.info("Task added successfully.");
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error adding task", e);
            throw e;
        }
    }

    public List<Task> getAllTasks() {
        List<Task> tasks = new ArrayList<>();
        String sql = "SELECT * FROM tasks ORDER BY id DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Task task = new Task();
                task.setId(rs.getInt("id"));
                task.setTitle(rs.getString("title"));
                task.setDueDate(rs.getString("due_date"));
                task.setDescription(rs.getString("description"));
                task.setStatus(rs.getString("status"));
                tasks.add(task);
            }

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting all tasks", e);
        }

        return tasks;
    }

    public void updateTask(Task task) {
        String sql = "UPDATE tasks SET title=?, description=?, status=?, due_date=? WHERE id=?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, task.getTitle());
            stmt.setString(2, task.getDescription());
            stmt.setString(3, task.getStatus());

            java.sql.Date sqlDueDate = null;
            if (task.getDueDate() != null && !task.getDueDate().isEmpty()) {
                sqlDueDate = java.sql.Date.valueOf(task.getDueDate());
            }

            stmt.setDate(4, sqlDueDate);
            stmt.setInt(5, task.getId());

            stmt.executeUpdate();

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating tasks", e);

        }
    }




}
