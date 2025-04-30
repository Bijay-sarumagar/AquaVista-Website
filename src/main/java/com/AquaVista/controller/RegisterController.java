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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the registration JSP page
        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Validate inputs
            String validationError = validateInputs(firstName, lastName, email, username, password);
            if (validationError != null) {
                handleError(request, response, validationError);
                return;
            }

            // Establish database connection
            connection = DbConfig.getDbConnection();

            // SQL query to insert user data
            String sql = "INSERT INTO user (first_name, last_name, email, username, password) VALUES (?, ?, ?, ?, ?)";

            // Create and populate PreparedStatement
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, username);
            preparedStatement.setString(5, password);

            // Execute the query
            int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                // Successful registration, redirect to login page
                handleSuccess(request, response, "Your account has been successfully created!", "/WEB-INF/pages/login.jsp");
            } else {
                handleError(request, response, "Registration failed. Please try again later.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            handleError(request, response, "An error occurred: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * Validates the form inputs.
     */
    private String validateInputs(String firstName, String lastName, String email, String username, String password) {
        if (firstName == null || firstName.trim().isEmpty()) {
            return "First Name is required.";
        }
        if (lastName == null || lastName.trim().isEmpty()) {
            return "Last Name is required.";
        }
        if (email == null || email.trim().isEmpty() || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            return "A valid Email is required.";
        }
        if (username == null || username.trim().isEmpty()) {
            return "Username is required.";
        }
        if (password == null || password.trim().isEmpty() || password.length() < 8) {
            return "Password is required and must be at least 8 characters long.";
        }
        return null; // No validation errors
    }

    /**
     * Handles success scenarios by redirecting or forwarding to the success page.
     */
    private void handleSuccess(HttpServletRequest request, HttpServletResponse response, String message, String redirectPage)
            throws ServletException, IOException {
        request.setAttribute("success", message);
        request.getRequestDispatcher(redirectPage).forward(request, response);
    }

    /**
     * Handles error scenarios by showing a pop-up message and redirecting to the registration page.
     */
    private void handleError(HttpServletRequest request, HttpServletResponse response, String message)
            throws ServletException, IOException {
        request.setAttribute("error", message);
        request.setAttribute("firstName", request.getParameter("firstName"));
        request.setAttribute("lastName", request.getParameter("lastName"));
        request.setAttribute("email", request.getParameter("email"));
        request.setAttribute("username", request.getParameter("username"));
        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
    }
}