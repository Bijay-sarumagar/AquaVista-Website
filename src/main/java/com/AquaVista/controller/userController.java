package com.AquaVista.controller;

import com.AquaVista.model.userModel;
import com.AquaVista.service.UpdateService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/user", "/user/add", "/user/editUser", "/user/deleteUser"})
public class userController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UpdateService updateService;

    public userController() {
        super();
        updateService = new UpdateService(new com.AquaVista.config.DbConfig());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/user":
                listUsers(request, response); // Call the listUsers method
                break;
            case "/user/editUser":
                showEditForm(request, response); // Call the showEditForm method
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/user");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/user/add":
                createUser(request, response);
                break;
            case "/user/editUser":
                updateUser(request, response);
                break;
            case "/user/deleteUser":
                deleteUser(request, response);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/user");
                break;
        }
    }

    /**
     * List all users and forward to user.jsp
     */
    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<userModel> userList = updateService.getAllUsers();
        request.setAttribute("userList", userList); // Add userList to the request so it can be accessed in the JSP
        request.getRequestDispatcher("/WEB-INF/pages/user.jsp").forward(request, response); // Forward to user.jsp
    }

    /**
     * Show edit form for a specific user
     */
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        userModel existingUser = updateService.getUserById(id);
        request.setAttribute("user", existingUser);
        request.getRequestDispatcher("/WEB-INF/pages/editUser.jsp").forward(request, response); // Forward to editUser.jsp
    }

    /**
     * Create a new user
     */
    private void createUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        userModel user = new userModel();
        user.setFirstName(request.getParameter("first_name"));
        user.setLastName(request.getParameter("last_name"));
        user.setUsername(request.getParameter("username"));
        user.setEmail(request.getParameter("email"));

        boolean isCreated = updateService.createUser(user);
        if (isCreated) {
            response.sendRedirect(request.getContextPath() + "/user");
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create user");
        }
    }

    /**
     * Update an existing user
     */
    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        userModel user = new userModel();
        user.setUserId(Integer.parseInt(request.getParameter("id")));
        user.setFirstName(request.getParameter("first_name"));
        user.setLastName(request.getParameter("last_name"));
        user.setUsername(request.getParameter("username"));
        user.setEmail(request.getParameter("email"));

        boolean isUpdated = updateService.updateUser(user);
        if (isUpdated) {
            response.sendRedirect(request.getContextPath() + "/user");
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update user");
        }
    }

    /**
     * Delete a user
     */
    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        boolean isDeleted = updateService.deleteUser(id);
        if (isDeleted) {
            response.sendRedirect(request.getContextPath() + "/user");
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to delete user");
        }
    }
}