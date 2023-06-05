package com.dev4fun.dao;

import com.dev4fun.model.Account;
import com.dev4fun.model.Bill;
import com.dev4fun.model.BillDetail;
import com.dev4fun.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BillDetailDAO extends DAO {


    public ArrayList<BillDetail> getAllBillDetail() {
        try (Connection con = getConnection()) {
            String stmt = "SELECT * FROM bill_detail";
            ArrayList<BillDetail> billDetails = new ArrayList<>();
            PreparedStatement ps = con.prepareStatement(stmt);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BillDetail token = new BillDetail();
                token.setId(rs.getInt("id"));
                token.setAmount(rs.getFloat("amount"));
                token.setQuantity(rs.getInt("quantity"));
                Bill bill = new BillDAO().getBillById(rs.getInt("bill_id"));
                Product product = new ProductDAO().getProductById(rs.getInt("product_id"));
                token.setBill(bill);
                token.setProduct(product);
                token.setSize(rs.getInt("size"));
                billDetails.add(token);
            }
            return billDetails;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<BillDetail> getBillDetailByBillId(int value) {

        try (Connection conn = getConnection()) {
            String stmt = "SELECT * from bill_detail where bill_id = ?";
            ArrayList<BillDetail> bills = new ArrayList<>();
            PreparedStatement ps = conn.prepareStatement(stmt);
            ps.setInt(1, value);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BillDetail token = new BillDetail();
                token.setId(rs.getInt("id"));
                Product product = new ProductDAO().getProductById(rs.getInt("product_id"));
                token.setProduct(product);
                token.setQuantity(rs.getInt("quantity"));
                token.setAmount(rs.getFloat("amount"));
                token.setSize(rs.getInt("size"));
                bills.add(token);
            }
            return bills;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<BillDetail> getBillDetailById(String temp, int value) {

        try (Connection conn = getConnection()) {
            String stmt = "SELECT * from bill_detail where " + temp + " = ?";
            ArrayList<BillDetail> bills = new ArrayList<>();
            PreparedStatement ps = conn.prepareStatement(stmt);
            ps.setInt(1, value);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BillDetail token = new BillDetail();
                token.setId(rs.getInt("id"));
                Bill bill = new BillDAO().getBillById(rs.getInt("bill_id"));
                Product product = new ProductDAO().getProductById(rs.getInt("product_id"));
                token.setBill(bill);
                token.setProduct(product);
                token.setQuantity(rs.getInt("quantity"));
                token.setAmount(rs.getFloat("amount"));
                token.setSize(rs.getInt("size"));
                bills.add(token);
            }
            return bills;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<BillDetail> getBillDetailByProduct(String name) {
        ArrayList<Product> products = new ProductDAO().getProductByName(name);
        ArrayList<BillDetail> bills = new ArrayList<>();
        for (Product product : products) {
            try (Connection con = getConnection()) {
                String stmt = "SELECT * FROM bill_detail where ? = ?";
                PreparedStatement ps = con.prepareStatement(stmt);
                ps.setString(1, "product_id");
                ps.setInt(2, product.getId());
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    BillDetail token = new BillDetail();
                    token.setId(rs.getInt("id"));
                    Bill bill = new BillDAO().getBillById(rs.getInt("bill_id"));
                    token.setBill(bill);
                    token.setProduct(product);
                    token.setQuantity(rs.getInt("quantity"));
                    token.setAmount(rs.getFloat("amount"));
                    token.setSize(rs.getInt("size"));
                    bills.add(token);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return bills;
    }

    public ArrayList<BillDetail> getBillDetailByCustomer(String name) {
        ArrayList<Account> accounts = new AccountDAO().getAccountByElement("full_name", name);
        ArrayList<BillDetail> bills = new ArrayList<>();
        for (Account account : accounts) {
            Bill bill = new BillDAO().getBillByUserid(account.getId());
            try (Connection con = getConnection()) {
                String stmt = "SELECT * FROM bill_detail where ? = ?";
                PreparedStatement ps = con.prepareStatement(stmt);
                ps.setString(1, "bill_id");
                ps.setInt(2, bill.getId());
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    BillDetail token = new BillDetail();
                    token.setId(rs.getInt("id"));
                    Product product = new ProductDAO().getProductById(rs.getInt("product_id"));
                    token.setBill(bill);
                    token.setProduct(product);
                    token.setQuantity(rs.getInt("quantity"));
                    token.setAmount(rs.getFloat("amount"));
                    token.setSize(rs.getInt("size"));
                    bills.add(token);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return bills;
    }

    public ArrayList<BillDetail> getBillDetailByStatus(String st) {
        ArrayList<Bill> bills = new BillDAO().getBillByStatus(st);
        ArrayList<BillDetail> billDetails = new ArrayList<>();

        for (Bill bill : bills) {
            try (Connection con = getConnection()) {
                String stmt = "SELECT * FROM bill_detail where ? = ?";
                PreparedStatement ps = con.prepareStatement(stmt);
                ps.setString(1, "bill_id");
                ps.setInt(2, bill.getId());
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    BillDetail token = new BillDetail();
                    token.setId(rs.getInt("id"));
                    Product product = new ProductDAO().getProductById(rs.getInt("product_id"));
                    token.setBill(bill);
                    token.setProduct(product);
                    token.setQuantity(rs.getInt("quantity"));
                    token.setAmount(rs.getFloat("amount"));
                    token.setSize(rs.getInt("size"));
                    billDetails.add(token);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return billDetails;
    }

    public ArrayList<BillDetail> getBillDetailByProductId(int id) {

        try (Connection conn = getConnection()) {
            String stmt = "SELECT * from bill_detail where ? = ?";
            ArrayList<BillDetail> bills = new ArrayList<>();
            PreparedStatement ps = conn.prepareStatement(stmt);
            ps.setString(1, "product_id");
            ps.setInt(2, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BillDetail token = new BillDetail();
                token.setId(rs.getInt("id"));
                Bill bill = new BillDAO().getBillById(rs.getInt("bill_id"));
                Product product = new ProductDAO().getProductById(rs.getInt("product_id"));
                token.setBill(bill);
                token.setProduct(product);
                token.setQuantity(rs.getInt("quantity"));
                token.setAmount(rs.getFloat("amount"));
                token.setSize(rs.getInt("size"));
                bills.add(token);
            }
            return bills;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean deleteBillDetail(int id) {
        try (Connection conn = getConnection()) {
            String stmt = "DELETE FROM bill_detail WHERE id = ?";
            PreparedStatement ppStmt = conn.prepareStatement(stmt);
            ppStmt.setInt(1, id);
            ppStmt.executeUpdate();
            return true;
        } catch (SQLException err) {
            throw new RuntimeException();
        }
    }

    public boolean createBillDetail(BillDetail billDetail, int id) {
        try (Connection conn = getConnection()) {
            System.out.println(id+" "+billDetail.getAmount()+" "+billDetail.getProduct().getId()+" "+
                    billDetail.getQuantity()+" "+billDetail.getSize());
            String stmt = "insert into bill_detail (bill_id, amount , product_id ,quantity, size ) values(?,?,?,?,?) ";
            System.out.println(1);
            PreparedStatement ppStmt = conn.prepareStatement(stmt);
            System.out.println(2);
            ppStmt.setInt(1, id);
            System.out.println(3);
            ppStmt.setFloat(2, billDetail.getAmount());
            System.out.println(4);
            ppStmt.setInt(3, billDetail.getProduct().getId());
            System.out.println(5);
            ppStmt.setInt(4, billDetail.getQuantity());
            System.out.println(6);
            ppStmt.setInt(5, billDetail.getSize());
            System.out.println(7);
            ppStmt.executeUpdate();
            System.out.println(8);

            return true;

        } catch (SQLException err) {
            throw new RuntimeException();
        }
    }

    public boolean updateBillDetail(BillDetail billDetail) {
        try (Connection conn = getConnection()) {
            String stmt = "UPDATE bill_detail  SET product_id = ?, quantity = ?, size = ?  WHERE id = ?";
            PreparedStatement ppStmt = conn.prepareStatement(stmt);
            ppStmt.setInt(1, billDetail.getProduct().getId());
            ppStmt.setInt(2, billDetail.getQuantity());
            ppStmt.setInt(3, billDetail.getSize());
            ppStmt.setInt(4, billDetail.getId());
            ppStmt.executeUpdate();
            return true;
        } catch (SQLException err) {
            throw new RuntimeException();
        }
    }
}
