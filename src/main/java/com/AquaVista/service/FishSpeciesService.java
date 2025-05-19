package com.AquaVista.service;

import com.AquaVista.model.fishspeciesModel;
import com.AquaVista.config.DbConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FishSpeciesService {

    public List<fishspeciesModel> getAllSpecies() {
        List<fishspeciesModel> list = new ArrayList<>();
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM fishspecies");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                fishspeciesModel s = new fishspeciesModel();
                s.setSpeciesId(rs.getInt("species_id"));
                s.setName(rs.getString("name"));
                s.setType(rs.getString("type"));
                s.setCareLevel(rs.getString("care_level"));
                s.setTemperatureRange(rs.getString("temperature_range"));
                s.setPhRange(rs.getString("ph_range"));
                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public fishspeciesModel getSpeciesById(int id) {
        fishspeciesModel s = new fishspeciesModel();
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM fishspecies WHERE species_id = ?")) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                s.setSpeciesId(rs.getInt("species_id"));
                s.setName(rs.getString("name"));
                s.setType(rs.getString("type"));
                s.setCareLevel(rs.getString("care_level"));
                s.setTemperatureRange(rs.getString("temperature_range"));
                s.setPhRange(rs.getString("ph_range"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    public void addSpecies(fishspeciesModel s) {
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "INSERT INTO fishspecies (name, type, care_level, temperature_range, ph_range) VALUES (?, ?, ?, ?, ?)")) {
            ps.setString(1, s.getName());
            ps.setString(2, s.getType());
            ps.setString(3, s.getCareLevel());
            ps.setString(4, s.getTemperatureRange());
            ps.setString(5, s.getPhRange());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateSpecies(fishspeciesModel s) {
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "UPDATE fishspecies SET name=?, type=?, care_level=?, temperature_range=?, ph_range=? WHERE species_id=?")) {
            ps.setString(1, s.getName());
            ps.setString(2, s.getType());
            ps.setString(3, s.getCareLevel());
            ps.setString(4, s.getTemperatureRange());
            ps.setString(5, s.getPhRange());
            ps.setInt(6, s.getSpeciesId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteSpecies(int id) {
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement("DELETE FROM fishspecies WHERE species_id = ?")) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
