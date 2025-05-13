<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Task</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h2 class="card-title text-center mb-0">Add New Task</h2>
                    </div>
                    <div class="card-body p-4">
                        <% String error = (String) request.getAttribute("error"); %>
                        <% if (error != null) { %>
                            <div class="alert alert-danger" role="alert">
                                <%= error %>
                            </div>
                        <% } %>

                        <form action="/TaskManager/add-task" method="post">
                            <div class="mb-3">
                                <label for="title" class="form-label">Title</label>
                                <input type="text" class="form-control" id="title" name="title"
                                       value="<%= request.getParameter("title") != null ? request.getParameter("title") : "" %>" required>
                            </div>

                            <div class="mb-3">
                                <label for="description" class="form-label">Description</label>
                                <textarea class="form-control" id="description" name="description" required><%=
                                    request.getParameter("description") != null ? request.getParameter("description") : ""
                                %></textarea>
                            </div>

                            <div class="mb-3">
                                <label for="dueDate" class="form-label">Due Date</label>
                                <input type="date" class="form-control" id="dueDate" name="dueDate"
                                       value="<%= request.getParameter("dueDate") != null ? request.getParameter("dueDate") : "" %>" required>
                            </div>

                            <div class="mb-4">
                                <label for="status" class="form-label">Status</label>
                                <select class="form-select" id="status" name="status">
                                    <option value="Pending" <%= "Pending".equals(request.getParameter("status")) ? "selected" : "" %>>Pending</option>
                                    <option value="Completed" <%= "Completed".equals(request.getParameter("status")) ? "selected" : "" %>>Completed</option>
                                </select>
                            </div>

                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary btn-lg">Add Task</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
