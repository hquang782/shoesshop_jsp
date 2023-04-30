package com.dev4fun.dao;

import com.dev4fun.model.Config;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ConfigDAO extends DAO {
    public ArrayList<Config> getAllConfig() {
        try (Connection conn = getConnection()) {
            String statement = "select * from config";
            PreparedStatement pp = conn.prepareStatement(statement);
            ResultSet rs = pp.executeQuery();
            ArrayList<Config> configs = new ArrayList<>();
            while (rs.next()) {
                Config config = new Config();
                config.setId(rs.getString("id"));
                config.setName(rs.getString("name"));
                config.setContent(rs.getString("content"));
                configs.add(config);
            }
            return configs;
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }

    public Config getConfigById(String id) {
        try (Connection conn = getConnection()) {
            String statement = "select * from config where id = ?";
            PreparedStatement pp = conn.prepareStatement(statement);
            pp.setString(1, id);
            ResultSet rs = pp.executeQuery();
            Config config = new Config();
            while (rs.next()) {
                config.setId(rs.getString("id"));
                config.setName(rs.getString("name"));
                config.setContent(rs.getString("content"));
            }
            return config;
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }
    // TODO create, update, delete
}
