package com.AquaVista.service;

import com.AquaVista.config.DbConfig;
import com.AquaVista.model.AquariumModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AquariumService {

    public List<AquariumModel> getAllAquariums() {
        List<AquariumModel> list = new ArrayList<>();
        try (Connection conn = DbConfig.getDbConnection()) {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM aquarium");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                AquariumModel aq = new AquariumModel();
                aq.setAquariumId(rs.getInt("aquarium_id"));
                aq.setName(rs.getString("name"));
                aq.setDescription(rs.getString("description"));
                aq.setSize(rs.getDouble("size"));
                aq.setOwnerId(rs.getInt("owner_id"));
                list.add(aq);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public AquariumModel getAquariumById(int id) {
        AquariumModel aq = null;
        try (Connection conn = DbConfig.getDbConnection()) {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM aquarium WHERE aquarium_id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                aq = new AquariumModel();
                aq.setAquariumId(rs.getInt("aquarium_id"));
                aq.setName(rs.getString("name"));
                aq.setDescription(rs.getString("description"));
                aq.setSize(rs.getDouble("size"));
                aq.setOwnerId(rs.getInt("owner_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return aq;
    }

    public boolean addAquarium(AquariumModel aq) {
        try (Connection conn = DbConfig.getDbConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO aquarium (name, description, size, owner_id) VALUES (?, ?, ?, ?)"
            );
            ps.setString(1, aq.getName());
            ps.setString(2, aq.getDescription());
            ps.setDouble(3, aq.getSize());
            ps.setInt(4, aq.getOwnerId());

            return ps.executeUpdate() > 0;
        } catch (SQLIntegrityConstraintViolationException e) {
            System.err.println("Duplicate entry or constraint violation: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("SQL error: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateAquarium(AquariumModel aq) {
        try (Connection conn = DbConfig.getDbConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                    "UPDATE aquarium SET name=?, description=?, size=?, owner_id=? WHERE aquarium_id=?"
            );
            ps.setString(1, aq.getName());
            ps.setString(2, aq.getDescription());
            ps.setDouble(3, aq.getSize());
            ps.setInt(4, aq.getOwnerId());
            ps.setInt(5, aq.getAquariumId());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("SQL error during update: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteAquarium(int id) {
        try (Connection conn = DbConfig.getDbConnection()) {
            PreparedStatement ps = conn.prepareStatement("DELETE FROM aquarium WHERE aquarium_id = ?");
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("SQL error during delete: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
