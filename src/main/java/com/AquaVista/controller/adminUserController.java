package com.AquaVista.controller;

import com.AquaVista.model.userModel;
import com.AquaVista.service.UserService;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/user")
public class adminUserController extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String id = request.getParameter("id");

        switch (action != null ? action : "") {
            case "edit":
                userModel user = userService.getUserById(Integer.parseInt(id));
                request.setAttribute("user", user);
                request.getRequestDispatcher("/WEB-INF/pages/editUser.jsp").forward(request, response);
                break;
            case "delete":
                userService.deleteUser(Integer.parseInt(id));
                response.sendRedirect("users");
                break;
            default:
                List<userModel> userList = userService.getAllUsers();
                request.setAttribute("users", userList);
                request.getRequestDispatcher("/WEB-INF/pages/manageUsers.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        userModel user = new userModel();
        user.setFirstName(request.getParameter("first_name"));
        user.setLastName(request.getParameter("last_name"));
        user.setUsername(request.getParameter("username"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password")); // You can hash this if needed

        String id = request.getParameter("id");
        if (id != null && !id.isEmpty()) {
            user.setUserId(Integer.parseInt(id));
            userService.updateUser(user);
        } else {
            userService.addUser(user);
        }

        response.sendRedirect("users");
    }
}
