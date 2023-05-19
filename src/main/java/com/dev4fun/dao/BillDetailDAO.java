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
                billDetails.add(token);
            }
            return billDetails;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<BillDetail> getBillDetailbyId(String temp, String value) {

        try (Connection conn = getConnection()) {
            String stmt = "SELECT * from bill_detail where ? = ?";
            ArrayList<BillDetail> bills = new ArrayList<>();
            PreparedStatement ps = conn.prepareStatement(stmt);
            ps.setString(1, temp);
            ps.setString(2, value);
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
                bills.add(token);
            }
            return bills;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<BillDetail> getBillDetailbyProduct(String name) {
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
                    bills.add(token);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return bills;
    }

    public ArrayList<BillDetail> getBillDetailbyCustomer(String name) {
        ArrayList<Account> accounts = new AccountDAO().getAccountByElement("full_name",name);
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
                    bills.add(token);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return bills;
    }

    public ArrayList<BillDetail> getBillDetailbyStatus(String st) {
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
                    billDetails.add(token);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return billDetails;
    }
    public ArrayList<BillDetail> getBillDetailbyProductId(int id) {

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
                bills.add(token);
            }
            return bills;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
