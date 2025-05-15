package com.taskmanager.dao;

import com.taskmanager.dao.TaskDAO;
import com.taskmanager.model.Task;
import com.taskmanager.util.DBUtil;
import org.junit.jupiter.api.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public class TaskDAOTest {

    private TaskDAO taskDAO;

    @BeforeAll
    public static void setupDatabase() throws Exception {

        DBUtil.setTestConnection("jdbc:h2:mem:testdb;DB_CLOSE_DELAY=-1", "sa", "");
        try (Connection conn = DBUtil.getConnection(); Statement stmt = conn.createStatement()) {
            stmt.execute("CREATE TABLE tasks (id INT AUTO_INCREMENT PRIMARY KEY, title VARCHAR(255), description TEXT, due_date DATE, status VARCHAR(50))");
        }
    }

    @BeforeEach
    public void setUp() {
        taskDAO = new TaskDAO();
    }

    @Test
    public void testAddAndGetTask() throws Exception {
        Task task = new Task("Test Task", "JUnit test", "2025-12-12", "Pending");
        taskDAO.addTask(task);

        List<Task> tasks = taskDAO.getAllTasks();
        assertEquals(1, tasks.size());
        assertEquals("Test Task", tasks.get(0).getTitle());
    }

    @Test
    public void testUpdateTask() throws Exception {
        Task task = new Task("Update Test", "To be updated", "2025-12-12", "Pending");
        taskDAO.addTask(task);

        Task added = taskDAO.getAllTasks().get(0);
        added.setTitle("Updated Title");
        added.setStatus("Completed");
        taskDAO.updateTask(added);

        Task updated = taskDAO.getAllTasks().get(0);
        assertEquals("Updated Title", updated.getTitle());
        assertEquals("Completed", updated.getStatus());
    }


}
