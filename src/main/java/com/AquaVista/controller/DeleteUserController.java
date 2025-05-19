package com.AquaVista.controller;

import com.AquaVista.config.DbConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/deleteUser")
public class DeleteUserController extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");

        try {
            int userId = Integer.parseInt(idParam);
            try (Connection conn = DbConfig.getDbConnection();
                 PreparedStatement stmt = conn.prepareStatement("DELETE FROM user WHERE user_id = ?")) {

                stmt.setInt(1, userId);
                stmt.executeUpdate();
            }

            // Redirect back to the user list page
            resp.sendRedirect(req.getContextPath() + "/user");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to delete user.");
        }
    }
}
