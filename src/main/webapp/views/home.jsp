<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- Add this line -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NovaTech Task Management</title>
    <link rel="stylesheet" href="css/styles.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">


</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="sidebar-header">
                <i class="fas fa-tasks"></i>
                <h2>NovaTech Tasks</h2>
            </div>
            <nav class="sidebar-nav">
                <ul>
                    <li class="active"><a href="home"><i class="fas fa-home"></i> Dashboard</a></li>
                    <li><a href="all-tasks"><i class="fas fa-list-check"></i> My Tasks</a></li>

                </ul>
            </nav>
        </aside>

        <!-- Main Content -->
        <main class="main-content">
            <header class="main-header">
                <div>
                    <h1>Dashboard</h1>
                    <p>Welcome to your task management dashboard</p>
                </div>

            </header>

            <!-- Task Statistics -->
            <div class="stats-container">
                <div class="stat-card">
                    <div class="stat-header">
                        <h3>Pending Tasks</h3>
                        <p>Tasks awaiting completion</p>
                    </div>
                    <div class="stat-content">
                        <div class="stat-icon pending">
                            <i class="fas fa-clock"></i>
                        </div>
                        <div class="stat-info">
                            <div class="stat-value">${pendingCount}</div>
                            <p>Tasks remaining</p>
                        </div>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-header">
                        <h3>Completed Tasks</h3>
                        <p>Successfully finished tasks</p>
                    </div>
                    <div class="stat-content">
                        <div class="stat-icon completed">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <div class="stat-info">
                            <div class="stat-value">${completedCount}</div>
                            <p>Tasks completed</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recent Tasks -->
            <div class="tasks-container">
                <div class="tasks-header">
                    <h3>Recent Tasks</h3>
                    <p>Your most recent tasks and their status</p>
                </div>
                <div class="tasks-table-container">
                    <table class="tasks-table">
                        <thead>
                            <tr>
                                <th>Task</th>
                                <th>Status</th>
                                <th> Description </th>
                                <th>Due Date</th>
                            </tr>
                        </thead>
                       <tbody>
                           <c:forEach var="task" items="${tasks}">
                               <tr>
                                   <td>${task.title}</td>
                                   <td>
                                       <span class="badge ${task.status == 'Pending' ? 'pending' : 'completed'}">
                                           ${task.status}
                                       </span>
                                   </td>
                                   <td>${task.description}</td>

                                   <td>${task.dueDate}</td>
                               </tr>
                           </c:forEach>
                       </tbody>

                    </table>
                </div>
            </div>
        </main>
    </div>
</body>
</html>