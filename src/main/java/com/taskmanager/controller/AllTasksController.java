package com.taskmanager.controller;

import com.taskmanager.dao.TaskDAO;
import com.taskmanager.model.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Comparator;
import java.util.List;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.util.stream.Collectors;

@WebServlet("/all-tasks")
public class AllTasksController extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(AllTasksController.class.getName());
    private TaskDAO taskDAO;

    @Override
    public void init() {
        taskDAO = new TaskDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Task> allTasks = taskDAO.getAllTasks();
            List<Task> recentTasks = allTasks.stream()
                    .sorted(Comparator.comparing(Task::getDueDate).reversed())
                    .limit(5)
                    .collect(Collectors.toList());
            request.setAttribute("tasks", allTasks);
            request.getRequestDispatcher("/views/all-tasks.jsp").forward(request, response);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error fetching tasks", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to load tasks.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "add":
                    addTask(request, response);
                    break;

                case "update":
                    updateTask(request, response);
                    break;

                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown action");
            }
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private void addTask(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String dueDate = request.getParameter("dueDate");
        String status = request.getParameter("status");



        if (title == null || title.trim().isEmpty() ||
                description == null || description.trim().isEmpty() ||
                dueDate == null || dueDate.trim().isEmpty() ||
                status == null || (!status.equals("Pending") && !status.equals("Completed"))) {

            request.setAttribute("error", "Please fill all fields correctly.");
            request.setAttribute("title", title);
            request.setAttribute("description", description);
            request.setAttribute("dueDate", dueDate);
            request.setAttribute("status", status);


            List<Task> allTasks = taskDAO.getAllTasks();
            request.setAttribute("tasks", allTasks);

            request.getRequestDispatcher("/WEB-INF/views/all-tasks.jsp").forward(request, response);
            return;
        }

        Task task = new Task(title.trim(), description.trim(), dueDate.trim(), status.trim());

        try {
            taskDAO.addTask(task);
            response.sendRedirect("all-tasks");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error adding task", e);
            request.setAttribute("error", "Failed to add task. Please try again.");

            List<Task> allTasks = taskDAO.getAllTasks();
            request.setAttribute("tasks", allTasks);

            request.getRequestDispatcher("/WEB-INF/views/all-tasks.jsp").forward(request, response);
        }
    }


    private void updateTask(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String status = request.getParameter("status");
        String description =request.getParameter("description");
        String dueDateStr = request.getParameter("dueDate");


        Task task = new Task();
        task.setId(id);
        task.setTitle(title);
        task.setStatus(status);
        task.setDescription(description);
        task.setDueDate(dueDateStr);

        try {
            taskDAO.updateTask(task);
            response.sendRedirect("all-tasks");
        }catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating task", e);
            request.setAttribute("error", "Failed to update task. Please try again.");

            List<Task> allTasks = taskDAO.getAllTasks();
            request.setAttribute("tasks", allTasks);

            request.getRequestDispatcher("/WEB-INF/views/all-tasks.jsp").forward(request, response);
        }

    }












}
