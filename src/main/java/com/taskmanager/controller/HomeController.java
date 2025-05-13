package com.taskmanager.controller;

import com.taskmanager.dao.TaskDAO;
import com.taskmanager.model.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeController extends HttpServlet {

    private TaskDAO taskDAO;

    @Override
    public void init() {
        taskDAO = new TaskDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Task> allTasks = taskDAO.getAllTasks();

        long completedCount = allTasks.stream()
                .filter(task -> "Completed".equalsIgnoreCase(task.getStatus()))
                .count();

        long pendingCount = allTasks.stream()
                .filter(task -> "Pending".equalsIgnoreCase(task.getStatus()))
                .count();

        request.setAttribute("tasks", allTasks);
        request.setAttribute("completedCount", completedCount);
        request.setAttribute("pendingCount", pendingCount);

        request.getRequestDispatcher("/views/home.jsp").forward(request, response);
    }

}
