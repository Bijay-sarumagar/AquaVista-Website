package com.AquaVista.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.AquaVista.config.DbConfig;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(asyncSupported = true, urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the login JSP page
        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Establish database connection
            connection = DbConfig.getDbConnection();

            // SQL query to fetch the password for the given username
            String sql = "SELECT password FROM user WHERE username = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);

            // Execute the query
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // Retrieve the password from the database
                String storedPassword = resultSet.getString("password");

                // Compare the entered password with the stored password
                if (password.equals(storedPassword)) {
                    // Password matches, create a session and redirect to /home
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    response.sendRedirect(request.getContextPath() + "/home");
                    return; // Exit the method after successful login
                } else {
                    // Password does not match
                    request.setAttribute("error", "Invalid username or password.");
                }
            } else {
                // Username not found
                request.setAttribute("error", "Invalid username or password.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Forward back to the login page with the error message
        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
    }
}