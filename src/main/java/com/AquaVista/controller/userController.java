package com.AquaVista.controller;

import com.AquaVista.model.userModel;
import com.AquaVista.service.UserService;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/user")
public class userController extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch all users
        List<userModel> userList = userService.getAllUsers();

        // Pass the list to the JSP
        request.setAttribute("userList", userList);

        // Internally forward to JSP page (not exposed in URL)
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/pages/user.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
