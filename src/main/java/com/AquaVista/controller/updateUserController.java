	package com.AquaVista.controller;
	
	import com.AquaVista.config.DbConfig;
	
	import jakarta.servlet.*;
	import jakarta.servlet.annotation.WebServlet;
	import jakarta.servlet.http.*;
	import java.io.IOException;
	import java.sql.*;
	
	@WebServlet("/userUpdate")
	public class updateUserController extends HttpServlet {
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        int userId = Integer.parseInt(req.getParameter("userId"));
	        String firstName = req.getParameter("firstName");
	        String lastName = req.getParameter("lastName");
	        String username = req.getParameter("username");
	        String email = req.getParameter("email");
	        String password = req.getParameter("password");
	
	        try (Connection conn = DbConfig.getDbConnection();
	             PreparedStatement ps = conn.prepareStatement(
	                     "UPDATE user SET first_name = ?, last_name = ?, username = ?, email = ?, password = ? WHERE user_id = ?")) {
	
	            ps.setString(1, firstName);
	            ps.setString(2, lastName);
	            ps.setString(3, username);
	            ps.setString(4, email);
	            ps.setString(5, password);
	            ps.setInt(6, userId);
	
	            ps.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	
	        resp.sendRedirect(req.getContextPath() + "/user");
	    }
	}
