package com.taskmanager.controller;

import com.taskmanager.dao.TaskDAO;
import com.taskmanager.model.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Logger;
import java.util.logging.Level;

@WebServlet("/add-task")
public class AddTaskServlet extends HttpServlet {



    private static final Logger LOGGER = Logger.getLogger(AddTaskServlet.class.getName());
    private TaskDAO taskDAO;

    @Override
    public void init() {
        taskDAO = new TaskDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/add-task.jsp").forward(request, response);
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
            request.getRequestDispatcher("/WEB-INF/views/add-task-form.jsp").forward(request, response);
            return;
        }

        Task task = new Task(title.trim(), description.trim(), dueDate, status);

        try {
            taskDAO.addTask(task);
            response.sendRedirect("/TaskManager/tasks");
        } catch (IOException ioEx) {
            LOGGER.log(Level.SEVERE, "Servlet error while processing task: " + ioEx.getMessage(), ioEx);
            throw ioEx;
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Unexpected error: " + ex.getMessage(), ex);
            request.setAttribute("error", "An unexpected error occurred.");
            request.getRequestDispatcher("/WEB-INF/views/add-task-form.jsp").forward(request, response);
        }

    }

}
