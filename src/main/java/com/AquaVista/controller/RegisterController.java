package com.AquaVista.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.AquaVista.config.DbConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(asyncSupported = true, urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegisterController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Validate input
            String validationError = validateInputs(firstName, lastName, email, username, password);
            if (validationError != null) {
                handleError(request, response, validationError);
                return;
            }

            // DB connection
            connection = DbConfig.getDbConnection();

            String sql = "INSERT INTO user (first_name, last_name, email, username, password, role) VALUES (?, ?, ?, ?, ?, 'customer')";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, username);
            preparedStatement.setString(5, password);

            int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                request.getSession().setAttribute("message", "User registered successfully!");
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                handleError(request, response, "Registration failed. Try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            handleError(request, response, "Error: " + e.getMessage());
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private String validateInputs(String firstName, String lastName, String email, String username, String password) {
        if (firstName == null || firstName.isEmpty()) return "First name required.";
        if (lastName == null || lastName.isEmpty()) return "Last name required.";
        if (email == null || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) return "Valid email required.";
        if (username == null || username.isEmpty()) return "Username required.";
        if (password == null || password.length() < 8) return "Password must be at least 8 characters.";
        return null;
    }

    private void handleError(HttpServletRequest req, HttpServletResponse res, String msg)
            throws ServletException, IOException {
        req.setAttribute("error", msg);
        req.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(req, res);
    }
}
