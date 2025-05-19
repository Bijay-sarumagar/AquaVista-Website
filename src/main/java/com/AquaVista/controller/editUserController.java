package com.AquaVista.controller;

import com.AquaVista.config.DbConfig;
import com.AquaVista.model.userModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/editUser")
public class editUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String idParam = req.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int userId = Integer.parseInt(idParam);

                try (Connection conn = DbConfig.getDbConnection();
                     PreparedStatement stmt = conn.prepareStatement("SELECT * FROM user WHERE user_id = ?")) {

                    stmt.setInt(1, userId);
                    ResultSet rs = stmt.executeQuery();

                    if (rs.next()) {
                        userModel user = new userModel();
                        user.setUserId(rs.getInt("user_id"));
                        user.setFirstName(rs.getString("first_name"));
                        user.setLastName(rs.getString("last_name"));
                        user.setUsername(rs.getString("username"));
                        user.setEmail(rs.getString("email"));
                        user.setPassword(rs.getString("password")); // if you're showing this in the form

                        req.setAttribute("user", user);
                        req.getRequestDispatcher("/WEB-INF/pages/editUser.jsp").forward(req, resp);
                        return;

                    } else {
                        // No user found
                        resp.sendRedirect(req.getContextPath() + "/user");
                    }

                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                    resp.sendRedirect(req.getContextPath() + "/user");
                }

            } catch (NumberFormatException e) {
                e.printStackTrace();
                resp.sendRedirect(req.getContextPath() + "/user");
            }
        } else {
            resp.sendRedirect(req.getContextPath() + "/user");
        }
    }
}
