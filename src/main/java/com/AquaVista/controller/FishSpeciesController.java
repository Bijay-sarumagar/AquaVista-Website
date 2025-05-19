package com.AquaVista.controller;

import com.AquaVista.config.DbConfig;
import com.AquaVista.model.fishspeciesModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/fishspecies", "/addSpecies", "/editSpecies", "/deleteSpecies"})
public class FishSpeciesController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();
        String keyword = request.getParameter("keyword");
        List<fishspeciesModel> speciesList = new ArrayList<>();

        try (Connection conn = DbConfig.getDbConnection()) {

            switch (action) {
                case "/addSpecies":
                    request.getRequestDispatcher("/WEB-INF/pages/addSpecies.jsp").forward(request, response);
                    return;

                case "/editSpecies":
                    int id = Integer.parseInt(request.getParameter("id"));
                    try (PreparedStatement stmt = conn.prepareStatement("SELECT * FROM fishspecies WHERE species_id = ?")) {
                        stmt.setInt(1, id);
                        ResultSet rs = stmt.executeQuery();
                        if (rs.next()) {
                            fishspeciesModel species = new fishspeciesModel();
                            species.setSpeciesId(rs.getInt("species_id"));
                            species.setName(rs.getString("name"));
                            species.setType(rs.getString("type"));
                            species.setCareLevel(rs.getString("care_level"));
                            species.setTemperatureRange(rs.getString("temperature_range"));
                            species.setPhRange(rs.getString("ph_range"));
                            request.setAttribute("species", species);
                        }
                    }
                    request.getRequestDispatcher("/WEB-INF/pages/editSpecies.jsp").forward(request, response);
                    return;

                case "/deleteSpecies":
                    int deleteId = Integer.parseInt(request.getParameter("id"));
                    try (PreparedStatement stmt = conn.prepareStatement("DELETE FROM fishspecies WHERE species_id = ?")) {
                        stmt.setInt(1, deleteId);
                        stmt.executeUpdate();
                    }
                    request.getSession().setAttribute("message", "Species deleted successfully.");
                    response.sendRedirect(request.getContextPath() + "/fishspecies");
                    return;

                default:
                    String sql = "SELECT * FROM fishspecies";
                    boolean hasKeyword = keyword != null && !keyword.trim().isEmpty();

                    if (hasKeyword) {
                        sql += " WHERE name LIKE ? OR type LIKE ? OR care_level LIKE ?";
                    }

                    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                        if (hasKeyword) {
                            String query = "%" + keyword + "%";
                            stmt.setString(1, query);
                            stmt.setString(2, query);
                            stmt.setString(3, query);
                        }

                        ResultSet rs = stmt.executeQuery();
                        while (rs.next()) {
                            fishspeciesModel species = new fishspeciesModel();
                            species.setSpeciesId(rs.getInt("species_id"));
                            species.setName(rs.getString("name"));
                            species.setType(rs.getString("type"));
                            species.setCareLevel(rs.getString("care_level"));
                            species.setTemperatureRange(rs.getString("temperature_range"));
                            species.setPhRange(rs.getString("ph_range"));
                            speciesList.add(species);
                        }
                    }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("speciesList", speciesList);
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("/WEB-INF/pages/fishspecies.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();

        try (Connection conn = DbConfig.getDbConnection()) {
            String name = request.getParameter("name");
            String type = request.getParameter("type");
            String careLevel = request.getParameter("careLevel");
            String tempRange = request.getParameter("temperatureRange");
            String phRange = request.getParameter("phRange");

            if ("/addSpecies".equals(action)) {
                try (PreparedStatement stmt = conn.prepareStatement(
                        "INSERT INTO fishspecies (name, type, care_level, temperature_range, ph_range) VALUES (?, ?, ?, ?, ?)")) {

                    stmt.setString(1, name);
                    stmt.setString(2, type);
                    stmt.setString(3, careLevel);
                    stmt.setString(4, tempRange);
                    stmt.setString(5, phRange);
                    stmt.executeUpdate();
                }

            } else if ("/editSpecies".equals(action)) {
                int id = Integer.parseInt(request.getParameter("speciesId"));
                try (PreparedStatement stmt = conn.prepareStatement(
                        "UPDATE fishspecies SET name = ?, type = ?, care_level = ?, temperature_range = ?, ph_range = ? WHERE species_id = ?")) {

                    stmt.setString(1, name);
                    stmt.setString(2, type);
                    stmt.setString(3, careLevel);
                    stmt.setString(4, tempRange);
                    stmt.setString(5, phRange);
                    stmt.setInt(6, id);
                    stmt.executeUpdate();
                }
            }

            response.sendRedirect(request.getContextPath() + "/fishspecies");

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "Error: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/fishspecies");
        }
    }
}
