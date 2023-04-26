package com.dev4fun.dao;

import com.dev4fun.model.Bill;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BillDAO extends DAO {
    public Bill getBillById(int id) {
        try (Connection conn = getConnection()) {
            String statement = "select * from bill where id = ?";
            Bill bill = null;
            PreparedStatement ppStmt = conn.prepareStatement(statement);
            ResultSet rs = ppStmt.executeQuery();
            while (rs.next()) {
                bill = new Bill();
                bill.setId(rs.getInt("id"));
                bill.setStatus(rs.getString("status"));
                bill.setUserId(rs.getInt("user_id"));
                bill.setFullName(rs.getString("full_name"));
                bill.setEmail(rs.getString("email"));
                bill.setPhoneNumber(rs.getString("phone_number"));
                bill.setTotalAmount(rs.getFloat("total_amount"));
                bill.setPayMethod(rs.getString("pay_method"));
                bill.setNote(rs.getString("note"));
            }
            return bill;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Bill> getAllBill() {
        try (Connection conn = getConnection()) {
            String statement = "select * from bill";
            List<Bill> bills = new ArrayList<>();
            ResultSet rs = conn.createStatement().executeQuery(statement);
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setId(rs.getInt("id"));
                bill.setStatus(rs.getString("status"));
                bill.setUserId(rs.getInt("user_id"));
                bill.setFullName(rs.getString("full_name"));
                bill.setEmail(rs.getString("email"));
                bill.setPhoneNumber(rs.getString("phone_number"));
                bill.setTotalAmount(rs.getFloat("total_amount"));
                bill.setPayMethod(rs.getString("pay_method"));
                bill.setNote(rs.getString("note"));
                bills.add(bill);
            }
            return bills;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int getTotalBills() {
        try (Connection conn = getConnection()) {
            String statement = "select count(*) from bill";
            int n = -1;
            ResultSet rs = conn.createStatement().executeQuery(statement);
            while (rs.next()) {
                n = rs.getInt(1);
            }
            return n;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean createBill(Bill bill) {
        try (Connection conn = getConnection()) {
            String stmt = "insert into bill (status, user_id, full_name, email, phone_number, total_amount, pay_method, note) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ppStmt = conn.prepareStatement(stmt);
            ppStmt.setString(1, bill.getStatus());
            ppStmt.setInt(2, bill.getUserId());
            ppStmt.setString(3, bill.getFullName());
            ppStmt.setString(4, bill.getEmail());
            ppStmt.setString(5, bill.getPhoneNumber());
            ppStmt.setFloat(6, bill.getTotalAmount());
            ppStmt.setString(7, bill.getPayMethod());
            ppStmt.setString(7, bill.getNote());
            ppStmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }

    public boolean updateBill(Bill bill) {
        try (Connection conn = getConnection()) {
            String stmt = "update bill set status = ?, user_id = ?, full_name = ?, email = ?, phone_number = ?, total_amount = ?, pay_method = ?, note = ?)";
            PreparedStatement ppStmt = conn.prepareStatement(stmt);
            ppStmt.setString(1, bill.getStatus());
            ppStmt.setInt(2, bill.getUserId());
            ppStmt.setString(3, bill.getFullName());
            ppStmt.setString(4, bill.getEmail());
            ppStmt.setString(5, bill.getPhoneNumber());
            ppStmt.setFloat(6, bill.getTotalAmount());
            ppStmt.setString(7, bill.getPayMethod());
            ppStmt.setString(7, bill.getNote());
            ppStmt.executeUpdate();
            return true;
        } catch (SQLException err) {
            throw new RuntimeException();
        }
    }

    public boolean deleteBill(int id) {
        try (Connection conn = getConnection()) {
            String stmt = "DELETE FROM bill WHERE id = ?";
            PreparedStatement ppStmt = conn.prepareStatement(stmt);
            ppStmt.setInt(1, id);
            ppStmt.executeUpdate();
            return true;
        } catch (SQLException err) {
            throw new RuntimeException();
        }
    }
}
