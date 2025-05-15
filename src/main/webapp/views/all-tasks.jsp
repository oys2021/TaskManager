<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page isELIgnored="false" %> <!-- Add this line -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NovaTech Task Management - All Tasks</title>

    <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/all-tasks.css">
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
                    <li><a href="home"><i class="fas fa-home"></i> Dashboard</a></li>
                    <li class="active"><a href="all-tasks"><i class="fas fa-list-check"></i> My Tasks</a></li>

                </ul>
            </nav>
        </aside>

        <!-- Main Content -->
        <main class="main-content">
            <header class="main-header">
                <div>
                    <h1>All Tasks</h1>
                    <p>Manage and organize all your tasks</p>
                </div>
                <button class="btn-primary" onclick="document.getElementById('add-task-modal').style.display='block'">
                    <i class="fas fa-plus"></i> New Task
                </button>
            </header>

            <form method="get" action="all-tasks" class="filter-sort-form">
                <label for="statusFilter">Filter by Status:</label>
                <select name="status" id="statusFilter">
                    <option value="">All</option>
                    <option value="Pending" ${param.status == 'Pending' ? 'selected' : ''}>Pending</option>
                    <option value="Completed" ${param.status == 'Completed' ? 'selected' : ''}>Completed</option>
                </select>

                <label for="sortOrder">Sort by Due Date:</label>
                <select name="sort" id="sortOrder">
                    <option value="asc" ${param.sort == 'asc' ? 'selected' : ''}>Ascending</option>
                    <option value="desc" ${param.sort == 'desc' ? 'selected' : ''}>Descending</option>
                </select>

                <button type="submit" class="btn-primary">Apply</button>
            </form>


            <!-- Task Filters -->
            <div class="filters-container">
                <div class="filter-group">
                    <label for="status-filter">Status:</label>
                    <select id="status-filter" class="filter-select">
                        <option value="all">All</option>
                        <option value="pending">Pending</option>
                        <option value="in-progress">In Progress</option>
                        <option value="completed">Completed</option>
                    </select>
                </div>
                <div class="filter-group">
                    <label for="priority-filter">Priority:</label>
                    <select id="priority-filter" class="filter-select">
                        <option value="all">All</option>
                        <option value="critical">Critical</option>
                        <option value="high">High</option>
                        <option value="medium">Medium</option>
                        <option value="low">Low</option>
                    </select>
                </div>
                <div class="filter-group">
                    <label for="search">Search:</label>
                    <div class="search-input">
                        <input type="text" id="search" placeholder="Search tasks...">
                        <i class="fas fa-search"></i>
                    </div>
                </div>
            </div>

            <!-- All Tasks Table -->
            <div class="tasks-container">
                <div class="tasks-table-container">
                    <table class="tasks-table">
                        <thead>
                            <tr>
                                <th>Task</th>
                                <th>Status</th>

                                <th>Due Date</th>

                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="task" items="${tasks}">
                                <tr>
                                    <td>${task.title}</td>
                                    <td><span class="badge ${task.status.toLowerCase().replaceAll(' ', '-')}">${task.status}</span></td>
                                    <td>${task.dueDate}</td>
                                    <td class="actions-cell">
                                         <button  class="action-btn edit-btn" onclick='openEditModal({
                                                    id: "${task.id}",
                                                    title: "${task.title}",
                                                    description: "${task.description}",
                                                    status: "${task.status}",

                                                    dueDate: "${task.dueDate}",

                                                })'> <i class="fas fa-edit"></i>
                                               </button>

                                       <button class="action-btn delete-btn" onclick='openDeleteModal({
                                           id: "${task.id}",
                                           title: "${task.title}",
                                           description: "${task.description}",
                                           status: "${task.status}",
                                           dueDate: "${task.dueDate}"
                                       })'> <i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                </div>

                <!-- Pagination -->
                <div class="pagination">
                    <button class="pagination-btn" disabled><i class="fas fa-chevron-left"></i></button>
                    <button class="pagination-btn active">1</button>
                    <button class="pagination-btn">2</button>
                    <button class="pagination-btn">3</button>
                    <span class="pagination-ellipsis">...</span>
                    <button class="pagination-btn">10</button>
                    <button class="pagination-btn"><i class="fas fa-chevron-right"></i></button>
                </div>
            </div>
        </main>
    </div>

    <!-- Add Task Modal -->
    <div id="add-task-modal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Add New Task</h2>
                <span class="close-btn" onclick="document.getElementById('add-task-modal').style.display='none'">&times;</span>
            </div>
            <div class="modal-body">
                <form class="task-form" method="POST" action="all-tasks">
                    <input type="hidden" name="action" value="add">

                    <div class="form-group">
                        <label for="task-title">Task Title</label>
                        <input type="text" id="task-title" name="title" placeholder="Enter task title" required>
                    </div>

                    <div class="form-group">
                        <label for="task-description">Description</label>
                        <textarea id="task-description" name="description" placeholder="Enter task description" rows="3"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="task-status">Status</label>
                        <select id="task-status" name="status" required>
                            <option value="Pending">Pending</option>
                            <option value="In Progress">In Progress</option>
                            <option value="Completed">Completed</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="task-due-date">Due Date</label>
                        <input type="date" id="task-due-date" name="dueDate" required>
                    </div>

                    <div class="form-actions">
                        <button type="button" class="btn-secondary" onclick="document.getElementById('add-task-modal').style.display='none'">Cancel</button>
                        <button type="submit" class="btn-primary">Add Task</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <!-- Edit Task Modal -->
    <div id="edit-task-modal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Edit Task</h2>
                <span class="close-btn" onclick="document.getElementById('edit-task-modal').style.display='none'">&times;</span>
            </div>
            <div class="modal-body">
                <form class="task-form" method="post" action="all-tasks">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" id="edit-task-id" name="id">

                    <div class="form-group">
                        <label for="edit-task-title">Task Title</label>
                        <input type="text" id="edit-task-title" name="title" required>
                    </div>

                    <div class="form-group">
                        <label for="edit-task-description">Description</label>
                        <textarea id="edit-task-description" name="description" rows="3"></textarea>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="edit-task-status">Status</label>
                            <select id="edit-task-status" name="status" required>

                                  <option value="Pending">Pending</option>
                                  <option value="Completed">Completed</option>


                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="edit-task-due-date">Due Date</label>
                            <input type="date" id="edit-task-due-date" name="dueDate" required>
                        </div>


                    </div>

                    <div class="form-actions">
                        <button type="button" class="btn-secondary" onclick="document.getElementById('edit-task-modal').style.display='none'">Cancel</button>
                        <button type="submit" class="btn-primary">Save Changes</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

   <!-- Delete Task Modal -->
   <div id="delete-task-modal" class="modal">
       <div class="modal-content delete-modal">
           <div class="modal-header">
               <h2>Delete Task</h2>
               <span class="close-btn" onclick="closeDeleteModal()">&times;</span>
           </div>
           <div class="modal-body">
               <p class="delete-message">Are you sure you want to delete this task? This action cannot be undone.</p>
               <div class="task-preview">
                   <h3 id="delete-task-title">Task Title</h3>
                   <p><strong>Status:</strong> <span id="delete-task-status"></span></p>
                   <p><strong>Due Date:</strong> <span id="delete-task-due-date"></span></p>
               </div>

               <form method="post" action="all-tasks">
                   <input type="hidden" name="action" value="delete">
                   <input type="hidden" id="delete-task-id" name="id">

                   <div class="form-actions">
                       <button type="button" class="btn-secondary" onclick="closeDeleteModal()">Cancel</button>
                       <button type="submit" class="btn-danger">Delete Task</button>
                   </div>
               </form>
           </div>
       </div>
   </div>

</body>

<script>
function openEditModal(task) {
    document.getElementById('edit-task-id').value = task.id;
    document.getElementById('edit-task-title').value = task.title;
    document.getElementById('edit-task-description').value = task.description;
    document.getElementById('edit-task-status').value = task.status;
    document.getElementById('edit-task-due-date').value = task.dueDate;

    document.getElementById('edit-task-modal').style.display = 'block';
}
</script>

<script>
function openDeleteModal(task) {
    document.getElementById('delete-task-id').value = task.id;
    document.getElementById('delete-task-title').textContent = task.title;
    document.getElementById('delete-task-status').textContent = task.status;
    document.getElementById('delete-task-due-date').textContent = task.dueDate;

    document.getElementById('delete-task-modal').style.display = 'block';
}

function closeDeleteModal() {
    document.getElementById('delete-task-modal').style.display = 'none';
}
</script>



</html>