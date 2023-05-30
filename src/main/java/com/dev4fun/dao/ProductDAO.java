package com.dev4fun.dao;

import com.dev4fun.model.Category;
import com.dev4fun.model.Product;
import com.dev4fun.model.ProductDetail;
import com.dev4fun.model.Statistic;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends DAO {
    public Product getProductById(int id) {
        try (Connection conn = getConnection()) {
            String statementProduct = "select * from product where id = ?";
            String statementProductDetail = "select * from product_detail where product_id = ?";

            PreparedStatement ppProduct = conn.prepareStatement(statementProduct);
            ppProduct.setInt(1, id);
            ResultSet rsProduct = ppProduct.executeQuery();
            Product product = new Product();
            while (rsProduct.next()) {
                product.setId(rsProduct.getInt("id"));
                product.setName(rsProduct.getString("name"));
                product.setCategoryId(rsProduct.getInt("category_id"));
                product.setDescription(rsProduct.getString("description"));
                product.setImageLink(rsProduct.getString("image_Link"));
                product.setImageList(rsProduct.getString("image_List"));
                product.setPrice(rsProduct.getFloat("price"));
                product.setCost(rsProduct.getFloat("cost"));
                product.setStatus(rsProduct.getString("status"));
                product.setCreatedAt(rsProduct.getString("created_at"));

                PreparedStatement ppProductDetail = conn.prepareStatement(statementProductDetail);
                ppProductDetail.setInt(1, product.getId());
                ResultSet rsProductDetail = ppProductDetail.executeQuery();
                while (rsProductDetail.next()) {
                    ProductDetail productDetail = new ProductDetail();
                    productDetail.setId(rsProductDetail.getInt("id"));
                    productDetail.setProductId(rsProductDetail.getInt("product_id"));
                    productDetail.setQuantity(rsProductDetail.getInt("quantity"));
                    productDetail.setSize(rsProductDetail.getString("size"));
                    product.getProductDetails().add(productDetail);
                }
            }
            return product;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Product> getProductByCategoryName(String name) {
        try (Connection conn = getConnection()) {
            String statementProduct = "SELECT product.*\n" +
                    "FROM shoes.product\n" +
                    "INNER JOIN category ON category_id = category.id\n" +
                    "WHERE category.name like ?";
            String statementProductDetail = "select * from product_detail where product_id = ?";
            ArrayList<Product> all = new ArrayList<>();
            PreparedStatement ppProduct = conn.prepareStatement(statementProduct);
            ppProduct.setString(1, "%" + name + "%");
            ResultSet rsProduct = ppProduct.executeQuery();
            while (rsProduct.next()) {
                Product product = new Product();
                product.setId(rsProduct.getInt("id"));
                product.setName(rsProduct.getString("name"));
                product.setCategoryId(rsProduct.getInt("category_id"));
                product.setCategory(new CategoryDAO().getCategoryById(rsProduct.getInt("category_id")));
                product.setDescription(rsProduct.getString("description"));
                product.setImageLink(rsProduct.getString("image_Link"));
                product.setImageList(rsProduct.getString("image_List"));
                product.setPrice(rsProduct.getFloat("price"));
                product.setCost(rsProduct.getFloat("cost"));
                product.setStatus(rsProduct.getString("status"));
                product.setCreatedAt(rsProduct.getString("created_at"));

                PreparedStatement ppProductDetail = conn.prepareStatement(statementProductDetail);
                ppProductDetail.setInt(1, product.getId());
                ResultSet rsProductDetail = ppProductDetail.executeQuery();
                while (rsProductDetail.next()) {
                    ProductDetail productDetail = new ProductDetail();
                    productDetail.setId(rsProductDetail.getInt("id"));
                    productDetail.setProductId(rsProductDetail.getInt("product_id"));
                    productDetail.setQuantity(rsProductDetail.getInt("quantity"));
                    productDetail.setSize(rsProductDetail.getString("size"));
                    product.getProductDetails().add(productDetail);
                }
                all.add(product);
            }
            return all;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Product> getProductByName(String name) {
        try (Connection conn = getConnection()) {
            String statementProduct = "select * from product where name like ?";
            String statementProductDetail = "select * from product_detail where product_id = ?";
            ArrayList<Product> all = new ArrayList<>();
            PreparedStatement ppProduct = conn.prepareStatement(statementProduct);
            ppProduct.setString(1, "%" + name + "%");
            ResultSet rsProduct = ppProduct.executeQuery();
            while (rsProduct.next()) {
                Product product = new Product();
                product.setId(rsProduct.getInt("id"));
                product.setName(rsProduct.getString("name"));
                product.setCategoryId(rsProduct.getInt("category_id"));
                product.setCategory(new CategoryDAO().getCategoryById(rsProduct.getInt("category_id")));
                product.setDescription(rsProduct.getString("description"));
                product.setImageLink(rsProduct.getString("image_Link"));
                product.setImageList(rsProduct.getString("image_List"));
                product.setPrice(rsProduct.getFloat("price"));
                product.setCost(rsProduct.getFloat("cost"));
                product.setStatus(rsProduct.getString("status"));
                product.setCreatedAt(rsProduct.getString("created_at"));

                PreparedStatement ppProductDetail = conn.prepareStatement(statementProductDetail);
                ppProductDetail.setInt(1, product.getId());
                ResultSet rsProductDetail = ppProductDetail.executeQuery();
                while (rsProductDetail.next()) {
                    ProductDetail productDetail = new ProductDetail();
                    productDetail.setId(rsProductDetail.getInt("id"));
                    productDetail.setProductId(rsProductDetail.getInt("product_id"));
                    productDetail.setQuantity(rsProductDetail.getInt("quantity"));
                    productDetail.setSize(rsProductDetail.getString("size"));
                    product.getProductDetails().add(productDetail);
                }
                all.add(product);
            }
            return all;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public ArrayList<Product> getProductByStatus(String status) {
        try (Connection conn = getConnection()) {
            String statementProduct = "select * from product where status like ?";
            String statementProductDetail = "select * from product_detail where product_id = ?";
            ArrayList<Product> all = new ArrayList<>();
            PreparedStatement ppProduct = conn.prepareStatement(statementProduct);
            ppProduct.setString(1, "%" + status + "%");
            ResultSet rsProduct = ppProduct.executeQuery();
            while (rsProduct.next()) {
                Product product = new Product();
                product.setId(rsProduct.getInt("id"));
                product.setName(rsProduct.getString("name"));
                product.setCategoryId(rsProduct.getInt("category_id"));
                product.setCategory(new CategoryDAO().getCategoryById(rsProduct.getInt("category_id")));
                product.setDescription(rsProduct.getString("description"));
                product.setImageLink(rsProduct.getString("image_Link"));
                product.setImageList(rsProduct.getString("image_List"));
                product.setPrice(rsProduct.getFloat("price"));
                product.setCost(rsProduct.getFloat("cost"));
                product.setStatus(rsProduct.getString("status"));
                product.setCreatedAt(rsProduct.getString("created_at"));

                PreparedStatement ppProductDetail = conn.prepareStatement(statementProductDetail);
                ppProductDetail.setInt(1, product.getId());
                ResultSet rsProductDetail = ppProductDetail.executeQuery();
                while (rsProductDetail.next()) {
                    ProductDetail productDetail = new ProductDetail();
                    productDetail.setId(rsProductDetail.getInt("id"));
                    productDetail.setProductId(rsProductDetail.getInt("product_id"));
                    productDetail.setQuantity(rsProductDetail.getInt("quantity"));
                    productDetail.setSize(rsProductDetail.getString("size"));
                    product.getProductDetails().add(productDetail);
                }
                all.add(product);
            }
            return all;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public int getTotalProductByCategoryName(String name) {
        try (Connection conn = getConnection()) {
            String statement = "SELECT count(*) FROM product p inner join category c on p.category_id = c.id where c.name = ?";
            PreparedStatement ppStmt = conn.prepareStatement(statement);
            ppStmt.setString(1, name);
            ResultSet rs = ppStmt.executeQuery(statement);
            int total =0;
            while (rs.next()) {
                total =  rs.getInt(1);
            }
            return total;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Product> getProductsByCategoryId(int categoryId) {
        try (Connection conn = getConnection()) {
            String statementProduct = "select * from product where category_id = ?";
            String statementProductDetail = "select * from product_detail where product_id = ?";
            PreparedStatement ppProduct = conn.prepareStatement(statementProduct);
            ppProduct.setInt(1, categoryId);
            ResultSet rsProduct = ppProduct.executeQuery();
            ArrayList<Product> products = new ArrayList<>();
            while (rsProduct.next()) {
                Product product = new Product();
                product.setId(rsProduct.getInt("id"));
                product.setName(rsProduct.getString("name"));
                product.setCategoryId(rsProduct.getInt("category_id"));
                product.setCategory(new CategoryDAO().getCategoryById(rsProduct.getInt("category_id")));
                product.setDescription(rsProduct.getString("description"));
                product.setImageLink(rsProduct.getString("image_Link"));
                product.setImageList(rsProduct.getString("image_List"));
                product.setPrice(rsProduct.getFloat("price"));
                product.setCost(rsProduct.getFloat("cost"));
                product.setStatus(rsProduct.getString("status"));
                product.setCreatedAt(rsProduct.getString("created_at"));

                PreparedStatement ppProductDetail = conn.prepareStatement(statementProductDetail);
                ppProductDetail.setInt(1, product.getId());
                ResultSet rsProductDetail = ppProductDetail.executeQuery();
                while (rsProductDetail.next()) {
                    ProductDetail productDetail = new ProductDetail();
                    productDetail.setId(rsProductDetail.getInt("id"));
                    productDetail.setProductId(rsProductDetail.getInt("product_id"));
                    productDetail.setQuantity(rsProductDetail.getInt("quantity"));
                    productDetail.setSize(rsProductDetail.getString("size"));
                    product.getProductDetails().add(productDetail);
                }
                products.add(product);
            }
            return products;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int getTotalProducts() {
        try (Connection conn = getConnection()) {
            String statement = "select count(*) from product";
            ResultSet rs = conn.createStatement().executeQuery(statement);
            int total = 0;
            while (rs.next()) {
                total = rs.getInt(1);
            }
            return total;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int getTotalProductExpired() {
        try (Connection conn = getConnection()) {
            String statement = "select count(*) from product where (select sum(quantity) from product_detail) = 0";
            ResultSet rs = conn.createStatement().executeQuery(statement);
            int total = 0;
            while (rs.next()) {
                total =  rs.getInt(1);
            }
            return total;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Product> getAllProduct() {
        try (Connection conn = getConnection()) {
            String statementProduct = "select * from product";
            String statementProductDetail = "select * from product_detail where product_id = ?";
            ArrayList<Product> products = new ArrayList<>();
            ResultSet rsProduct = conn.createStatement().executeQuery(statementProduct);
            while (rsProduct.next()) {
                Product product = new Product();
                product.setId(rsProduct.getInt("id"));
                product.setName(rsProduct.getString("name"));
                product.setCategoryId(rsProduct.getInt("category_id"));
                product.setCategory(new CategoryDAO().getCategoryById(rsProduct.getInt("category_id")));
                product.setDescription(rsProduct.getString("description"));
                product.setImageLink(rsProduct.getString("image_Link"));
                product.setImageList(rsProduct.getString("image_List"));
                product.setPrice(rsProduct.getFloat("price"));
                product.setCost(rsProduct.getFloat("cost"));
                product.setStatus(rsProduct.getString("status"));
                product.setCreatedAt(rsProduct.getString("created_at"));

                PreparedStatement ppProductDetail = conn.prepareStatement(statementProductDetail);
                ppProductDetail.setInt(1, product.getId());
                ResultSet rsProductDetail = ppProductDetail.executeQuery();
                while (rsProductDetail.next()) {
                    ProductDetail productDetail = new ProductDetail();
                    productDetail.setId(rsProductDetail.getInt("id"));
                    productDetail.setProductId(rsProductDetail.getInt("product_id"));
                    productDetail.setQuantity(rsProductDetail.getInt("quantity"));
                    productDetail.setSize(rsProductDetail.getString("size"));
                    product.getProductDetails().add(productDetail);
                }
                products.add(product);
            }
            return products;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public ArrayList<Product> getProductByElement(String temp) {
        try (Connection conn = getConnection()) {
            String statementProduct = "select * from product where id like '%"+temp+"%' or name like '%"+temp+"%' or price like '%"+temp+"%'";
            String statementProductDetail = "select * from product_detail where product_id = ?";
            ArrayList<Product> products = new ArrayList<>();
            ResultSet rsProduct = conn.createStatement().executeQuery(statementProduct);
            while (rsProduct.next()) {
                Product product = new Product();
                product.setId(rsProduct.getInt("id"));
                product.setName(rsProduct.getString("name"));
                product.setCategoryId(rsProduct.getInt("category_id"));
                product.setCategory(new CategoryDAO().getCategoryById(rsProduct.getInt("category_id")));
                product.setDescription(rsProduct.getString("description"));
                product.setImageLink(rsProduct.getString("image_Link"));
                product.setImageList(rsProduct.getString("image_List"));
                product.setPrice(rsProduct.getFloat("price"));
                product.setCost(rsProduct.getFloat("cost"));
                product.setStatus(rsProduct.getString("status"));
                product.setCreatedAt(rsProduct.getString("created_at"));

                PreparedStatement ppProductDetail = conn.prepareStatement(statementProductDetail);
                ppProductDetail.setInt(1, product.getId());
                ResultSet rsProductDetail = ppProductDetail.executeQuery();
                while (rsProductDetail.next()) {
                    ProductDetail productDetail = new ProductDetail();
                    productDetail.setId(rsProductDetail.getInt("id"));
                    productDetail.setProductId(rsProductDetail.getInt("product_id"));
                    productDetail.setQuantity(rsProductDetail.getInt("quantity"));
                    productDetail.setSize(rsProductDetail.getString("size"));
                    product.getProductDetails().add(productDetail);
                }
                products.add(product);
            }
            return products;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public boolean createProduct(Product product) {
        try (Connection conn = getConnection()) {
            String stmt = "insert into product (name, category_id, description, image_link, image_list, price, cost, status, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ppStmt = conn.prepareStatement(stmt, Statement.RETURN_GENERATED_KEYS);
            ppStmt.setString(1, product.getName());
            ppStmt.setInt(2, product.getCategoryId());
            ppStmt.setString(3, product.getDescription());
            ppStmt.setString(4, product.getImageLink());
            ppStmt.setString(5, product.getImageList());
            ppStmt.setFloat(6, product.getPrice());
            ppStmt.setFloat(7, product.getCost());
            ppStmt.setString(8, product.getStatus());
            ppStmt.setString(9, product.getCreatedAt());
            ppStmt.executeUpdate();

            int id;
            ResultSet rs = ppStmt.getGeneratedKeys();
            if (rs.next()) {
                id = rs.getInt(1);
                stmt = "insert into product_detail (size, product_id, quantity) values (?, ?, ?)";
                for (ProductDetail productDetail : product.getProductDetails()) {
                    PreparedStatement pp = conn.prepareStatement(stmt);
                    pp.setString(1, productDetail.getSize());
                    pp.setInt(2, id);
                    pp.setInt(3, productDetail.getQuantity());
                    pp.executeUpdate();
                }
                return true;
            }
            return false;
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }

    public boolean updateProduct(Product product) {
        try (Connection conn = getConnection()) {
            String stmt = "update product set name = ?, category_id = ?, description = ?, image_link = ?, image_list = ?, price = ?, cost = ?, status = ?, created_at = ?)";
            PreparedStatement ppStmt = conn.prepareStatement(stmt);
            ppStmt.setString(1, product.getName());
            ppStmt.setInt(2, product.getCategoryId());
            ppStmt.setString(3, product.getDescription());
            ppStmt.setString(4, product.getImageLink());
            ppStmt.setString(5, product.getImageList());
            ppStmt.setFloat(6, product.getPrice());
            ppStmt.setFloat(7, product.getCost());
            ppStmt.setString(8, product.getStatus());
            ppStmt.setString(9, product.getCreatedAt());
            ppStmt.executeUpdate();
            return true;
        } catch (SQLException err) {
            throw new RuntimeException();
        }
    }

    public boolean deleteProduct(int id) {
        try (Connection conn = getConnection()) {
            String stmt = "DELETE FROM product WHERE id = ?";
            PreparedStatement ppStmt = conn.prepareStatement(stmt);
            ppStmt.setInt(1, id);
            ppStmt.executeUpdate();
            return true;
        } catch (SQLException err) {
            throw new RuntimeException();
        }
    }

    public ArrayList<Statistic> getTopSaleProducts() {
        try (Connection conn = getConnection()) {
            String statement = "SELECT product.id,product.name,category.name AS category,product.price,\n" +
                    "SUM(bill_detail.quantity) AS total_sold,\n" +
                    "(product_detail.quantity- SUM(bill_detail.quantity)) AS remain\n" +
                    "FROM bill_detail\n" +
                    "JOIN product ON product.id = bill_detail.product_id\n" +
                    "JOIN category ON product.category_id = category.id\n" +
                    "JOIN product_detail ON product.id = product_detail.product_id\n" +
                    "GROUP BY product.id\n" +
                    "ORDER BY total_sold DESC\n" +
                    "LIMIT 5";
            ArrayList<Statistic> topproducts = new ArrayList<>();
            PreparedStatement ps = conn.prepareStatement(statement);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Statistic temp = new Statistic();
                temp.setProductId(rs.getInt(1));
                temp.setProductName(rs.getString(2));
                temp.setCategoryName(rs.getString(3));
                temp.setPrice(rs.getFloat(4));
                temp.setTotalSold(rs.getInt(5));
                temp.setRemain(rs.getInt(6));
                topproducts.add(temp);
            }
            return topproducts;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int getTotalProductNearExpired() {
        try (Connection conn = getConnection()) {
            String statement = "select count(*) from product where (select sum(quantity) from product_detail)  <= 10";
            ResultSet rs = conn.createStatement().executeQuery(statement);
            int total = 0;
            while (rs.next()) {
                total = rs.getInt(1);
            }
            return total;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public int getQuantityBySize(int id,int size)
    {
        try (Connection conn = getConnection()) {
            String statement = "SELECT quantity FROM "
                    + "shoes.product as p inner join product_detail as pd on p.id=pd.product_id "
                    + "where pd.product_id=? and size=? ;";
            PreparedStatement pp = conn.prepareStatement(statement);
            pp.setInt(1, id);
            pp.setInt(2, size);
            ResultSet rs = pp.executeQuery();
            int quantity = 0;
            while (rs.next()) {
                quantity = rs.getInt(1);
            }
            return quantity;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
