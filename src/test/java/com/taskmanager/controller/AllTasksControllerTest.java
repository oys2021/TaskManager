package com.taskmanager.controller;

import com.taskmanager.controller.AllTasksController;
import com.taskmanager.dao.TaskDAO;
import com.taskmanager.model.Task;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;

import java.util.Arrays;

import static org.mockito.Mockito.*;

public class AllTasksControllerTest {

    @InjectMocks
    private AllTasksController controller;

    @Mock
    private TaskDAO mockTaskDAO;

    @Mock
    private HttpServletRequest request;

    @Mock
    private HttpServletResponse response;

    @Mock
    private RequestDispatcher dispatcher;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.openMocks(this);
        controller.init();  // if taskDAO is being initialized here, inject mock manually
        controller = new AllTasksController();
        controller.setTaskDAO(mockTaskDAO);

    }

    @Test
    public void testDoGetLoadsTasksAndForwards() throws Exception {
        when(mockTaskDAO.getAllTasks()).thenReturn(Arrays.asList(
                new Task("Test 1", "Desc", "2025-12-01", "Pending")
        ));
        when(request.getRequestDispatcher("/views/all-tasks.jsp")).thenReturn(dispatcher);

        controller.doGet(request, response);

        verify(request).setAttribute(eq("tasks"), any());
        verify(dispatcher).forward(request, response);
    }
}
