package com.dev4fun.dao;

import com.dev4fun.model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO extends DAO {
    public Category getCategoryById(int id) {
        try (Connection conn = getConnection()) {
            String statement = "select * from category where id = ?";
            Category category = null;
            PreparedStatement ppStmt = conn.prepareStatement(statement);
            ppStmt.setInt(1, id);
            ResultSet rs = ppStmt.executeQuery();
            while (rs.next()) {
                category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
            }
            return category;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Category> getAllCategory() {
        try (Connection conn = getConnection()) {
            String statement = "select * from category";
            List<Category> categories = new ArrayList<>();
            ResultSet rs = conn.createStatement().executeQuery(statement);
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                categories.add(category);
            }
            return categories;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean createCategory(Category category) {
        try (Connection conn = getConnection()) {
//            if (getCategoryById(category.getName()) != null) {
//                return false;
//            }
            String stmt = "insert into category (name) VALUES (?)";
            PreparedStatement ppStmt = conn.prepareStatement(stmt);
            ppStmt.setString(1, category.getName());
            ppStmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }

    public boolean updateCategory(Category category) {
        try (Connection conn = getConnection()) {
//            if (getCategoryById(category.getName()) != null) {
//                return false;
//            }
            String stmt = "update category set name = ?)";
            PreparedStatement ppStmt = conn.prepareStatement(stmt);
            ppStmt.setString(1, category.getName());
            ppStmt.executeUpdate();
            return true;
        } catch (SQLException err) {
            throw new RuntimeException();
        }
    }

    public boolean deleteCategory(String id) {
        try (Connection conn = getConnection()) {
//            if (getCategoryById(category.getName()) != null) {
//                return false;
//            }
            String stmt = "DELETE FROM category WHERE id = " + id;
            PreparedStatement ppStmt = conn.prepareStatement(stmt);
            ppStmt.executeUpdate();
            return true;
        } catch (SQLException err) {
            throw new RuntimeException();
        }
    }
}
