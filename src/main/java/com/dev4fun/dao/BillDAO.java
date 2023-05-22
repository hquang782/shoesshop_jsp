package com.dev4fun.dao;

import com.dev4fun.model.Bill;
import com.dev4fun.model.BillDetail;

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

    public ArrayList<Bill> getBillsByAccountId(int id) {
        try (Connection conn = getConnection()) {
            String stmtBill = "select * from bill where user_id = ?";
            String stmtBillDetail = "select * from bill_detail where bill_id = ?";
            PreparedStatement ppStBill = conn.prepareStatement(stmtBill);
            PreparedStatement ppStBillDetail = conn.prepareStatement(stmtBillDetail);
            ppStBill.setInt(1, id);
            ResultSet rsBill = ppStBill.executeQuery();
            ArrayList<Bill> bills = new ArrayList<>();
            while (rsBill.next()) {
                Bill bill = new Bill();
                bill.setId(rsBill.getInt("id"));
                bill.setStatus(rsBill.getString("status"));
                bill.setUserId(rsBill.getInt("user_id"));
                bill.setFullName(rsBill.getString("full_name"));
                bill.setEmail(rsBill.getString("email"));
                bill.setPhoneNumber(rsBill.getString("phone_number"));
                bill.setTotalAmount(rsBill.getFloat("total_amount"));
                bill.setPayMethod(rsBill.getString("pay_method"));
                bill.setNote(rsBill.getString("note"));

                ArrayList<BillDetail> listBillDetails = new ArrayList<>();
                ppStBillDetail.setInt(1, bill.getId());
                ResultSet rsBillDetail = ppStBillDetail.executeQuery();
                while (rsBillDetail.next()) {
                    BillDetail billDetail = new BillDetail();
                    billDetail.setId(rsBillDetail.getInt("id"));
//                    billDetail.setBillId(rsBillDetail.getInt("bill_id"));
                    billDetail.setQuantity(rsBillDetail.getInt("quantity"));
//                    billDetail.setProductId(rsBillDetail.getInt("product_id"));
                    billDetail.setAmount(rsBillDetail.getInt("amount"));
                    listBillDetails.add(billDetail);
                }

                bill.setBillDetails(listBillDetails);
                bills.add(bill);
            }
            return bills;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Bill> getAllBill() {
        try (Connection conn = getConnection()) {
            String statement = "select * from bill";
            ArrayList<Bill> bills = new ArrayList<>();
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

    public float getTotalIncome (){
        float totalIncome = 0;
        try(Connection con = getConnection()){
            String stmt = "SELECT sum(bill.total_amount) as total_amount FROM shoes.bill";
            PreparedStatement ps = con.prepareStatement(stmt);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
                totalIncome = rs.getFloat(1);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return totalIncome;
    }

    public int getTotalBillCancelled(){
        int totalBillCancelled=0;
        Connection con = getConnection();
        String stmt = "SELECT count(*) FROM shoes.bill where status = 'cancelled'";
        try {
            PreparedStatement ps = con.prepareStatement(stmt);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                totalBillCancelled = rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return totalBillCancelled;
    }
    public Bill getBillByUserid(int id) {
        try (Connection conn = getConnection()) {
            String stmt = "select * from bill where user_id = ?";
            Bill bill = null;
            PreparedStatement ps = conn.prepareStatement(stmt);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
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
    public ArrayList<Bill> getBillByStatus(String st) {
        ArrayList<Bill> bills = new ArrayList<>();
        try (Connection conn = getConnection()) {
            String stmt = "select * from bill where status = ?";
            PreparedStatement ps = conn.prepareStatement(stmt);
            ps.setString(1,st);
            ResultSet rs = ps.executeQuery();
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
}
