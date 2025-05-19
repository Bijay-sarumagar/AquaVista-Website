package com.AquaVista.controller;

import com.AquaVista.config.DbConfig;
import com.AquaVista.util.PasswordUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/addUser"})
public class addUserController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public addUserController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Show the add user form
        request.getRequestDispatcher("/WEB-INF/pages/addUser.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Collect form parameters
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String rawPassword = request.getParameter("password");
        String role = request.getParameter("role");

        // Debug logs
        System.out.println("Received: " + firstName + " " + lastName + " " + username);

        // Hash the password
        String hashedPassword = PasswordUtil.hashPassword(rawPassword);
        System.out.println("Hashed password: " + hashedPassword);

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "INSERT INTO user (first_name, last_name, username, email, password, role) VALUES (?, ?, ?, ?, ?, ?)")) {

            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, username);
            stmt.setString(4, email);
            stmt.setString(5, hashedPassword);
            stmt.setString(6, role);

            int rows = stmt.executeUpdate();
            System.out.println("Rows inserted: " + rows);

            if (rows > 0) {
                request.getSession().setAttribute("successMessage", "User created successfully!");
                response.sendRedirect(request.getContextPath() + "/user");
            } else {
                request.setAttribute("errorMessage", "User creation failed.");
                request.getRequestDispatcher("/WEB-INF/pages/addUser.jsp").forward(request, response);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/pages/addUser.jsp").forward(request, response);
        }
    }
}