package com.dev4fun.dao;

import com.dev4fun.model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends DAO {
    public Product getProductById(int id) {
        try (Connection conn = getConnection()) {
            String statement = "select * from product where id = ?";
            Product product = null;
            PreparedStatement ppStmt = conn.prepareStatement(statement);
            ResultSet rs = ppStmt.executeQuery();
            while (rs.next()) {
                product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setDescription(rs.getString("description"));
                product.setImageLink(rs.getString("image_Link"));
                product.setImageList(rs.getString("image_List"));
                product.setPrice(rs.getFloat("price"));
                product.setCreatedAt(rs.getDate("created_At"));
            }
            return product;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public List<Product> getProductbyCategoryName(int index,String name)
    {
        try (Connection conn = getConnection()) {
            String statement = "SELECT * FROM shoes.product inner join category on product.category_id=category.id where category.name='"+name+"'"
                    +"limit ?,10";
            List<Product> products = new ArrayList<>();
            PreparedStatement ppStmt = conn.prepareStatement(statement);
            ppStmt.setInt(1, (index-1)*10);
            ResultSet rs = ppStmt.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setDescription(rs.getString("description"));
                product.setImageLink(rs.getString("image_Link"));
                product.setImageList(rs.getString("image_List"));
                product.setPrice(rs.getFloat("price"));
                product.setCreatedAt(rs.getDate("created_At"));
                products.add(product);
            }
            return products;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }public int getTotalProductbyCategoryName(String name)
    {
        try (Connection conn = getConnection()) {
            String statement = "SELECT count(*) FROM shoes.product inner join category on product.category_id=category.id where category.name='"+name+"'";
            ResultSet rs = conn.createStatement().executeQuery(statement);
            while (rs.next()) {
                return rs.getInt(1);
            }
            return 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public List<Product> getProductbyCategory(int id_cate)
    {
        try (Connection conn = getConnection()) {
            String statement = "select * from product where category_id =?";
            List<Product> products = new ArrayList<>();
            PreparedStatement ppStmt = conn.prepareStatement(statement);
            ppStmt.setInt(1, id_cate);
            ResultSet rs = ppStmt.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setDescription(rs.getString("description"));
                product.setImageLink(rs.getString("image_Link"));
                product.setImageList(rs.getString("image_List"));
                product.setPrice(rs.getFloat("price"));
                product.setCreatedAt(rs.getDate("created_At"));
                products.add(product);
            }
            return products;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public int getTotalProduct(){
        try (Connection conn = getConnection()) {
            String statement = "select count(*) from product";
            
            ResultSet rs = conn.createStatement().executeQuery(statement);
            while (rs.next()) {
                return rs.getInt(1);
            }
            return 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public List<Product> getAllProduct() {
        try (Connection conn = getConnection()) {
            String statement = "select * from product";
            List<Product> products = new ArrayList<>();
            ResultSet rs = conn.createStatement().executeQuery(statement);
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setDescription(rs.getString("description"));
                product.setImageLink(rs.getString("image_Link"));
                product.setImageList(rs.getString("image_List"));
                product.setPrice(rs.getFloat("price"));
                product.setCreatedAt(rs.getDate("created_At"));
                products.add(product);
            }
            return products;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean createProduct(Product product) {
        try (Connection conn = getConnection()) {
            String stmt = "insert into product (name, category_id, description, image_link, image_list, price, created_at) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ppStmt = conn.prepareStatement(stmt);
            ppStmt.setString(1, product.getName());
            ppStmt.setInt(2, product.getCategoryId());
            ppStmt.setString(3, product.getDescription());
            ppStmt.setString(4, product.getImageLink());
            ppStmt.setString(5, product.getImageList());
            ppStmt.setFloat(6, product.getPrice());
            ppStmt.setDate(7, (Date) product.getCreatedAt());
            ppStmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }
    
    public boolean updateProduct(Product product) {
        try (Connection conn = getConnection()) {
            String stmt = "update product set name = ?, category_id = ?, description = ?, image_link = ?, image_list = ?, price = ?, created_at = ?)";
            PreparedStatement ppStmt = conn.prepareStatement(stmt);
            ppStmt.setString(1, product.getName());
            ppStmt.setInt(2, product.getCategoryId());
            ppStmt.setString(3, product.getDescription());
            ppStmt.setString(4, product.getImageLink());
            ppStmt.setString(5, product.getImageList());
            ppStmt.setFloat(6, product.getPrice());
            ppStmt.setDate(7, (Date) product.getCreatedAt());
            ppStmt.executeUpdate();
            return true;
        } catch (SQLException err) {
            throw new RuntimeException();
        }
    }

    public boolean deleteProduct(String id) {
        try (Connection conn = getConnection()) {
            String stmt = "DELETE FROM product WHERE id = " + id;
            PreparedStatement ppStmt = conn.prepareStatement(stmt);
            ppStmt.executeUpdate();
            return true;
        } catch (SQLException err) {
            throw new RuntimeException();
        }
    }
}
