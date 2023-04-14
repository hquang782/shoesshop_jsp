package com.dev4fun.dao;

import com.dev4fun.model.Account;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AccountDAO extends DAO {
    public Account getAccountByUsernameAndRole(String username, String role) {
        try (Connection conn = getConnection()) {
            String statement = "select * from account where username = ? and role = ?";
            Account account = null;
            PreparedStatement ppStmt = conn.prepareStatement(statement);
            ppStmt.setString(1, username);
            ppStmt.setString(2, role);
            ResultSet rs = conn.createStatement().executeQuery(statement);
            while (rs.next()) {
                account = new Account();
                account.setId(rs.getInt("id"));
                account.setUsername(rs.getString("username"));
                account.setEmail(rs.getString("email"));
                account.setPassword(rs.getString("password"));
                account.setRole(rs.getString("role"));
                account.setFullName(rs.getString("fullName"));
                account.setDob(rs.getDate("dob"));
                account.setPhoneNumber(rs.getString("phoneNumber"));
            }
            return account;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Account> getAllAccount() {
        try (Connection conn = getConnection()) {
            String statement = "select * from account";
            List<Account> accounts = new ArrayList<>();
            ResultSet rs = conn.createStatement().executeQuery(statement);
            while (rs.next()) {
                Account account = new Account();
                account.setId(rs.getInt("id"));
                account.setUsername(rs.getString("username"));
                account.setEmail(rs.getString("email"));
                account.setPassword(rs.getString("password"));
                account.setRole(rs.getString("role"));
                account.setFullName(rs.getString("fullName"));
                account.setDob(rs.getDate("dob"));
                account.setPhoneNumber(rs.getString("phoneNumber"));
                accounts.add(account);
            }
            return accounts;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean createAccount(Account account) {
        try (Connection conn = getConnection()) {
            if (getAccountByUsernameAndRole(account.getUsername(), account.getRole()) == null) {
                return false;
            }
            String stmt = "insert into account (username, password, email, role, fullName, dob, phoneNumber) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ppStmt = conn.prepareStatement(stmt);
            ppStmt.setString(1, account.getUsername());
            ppStmt.setString(2, account.getPassword());
            ppStmt.setString(3, account.getEmail());
            ppStmt.setString(4, account.getRole());
            ppStmt.setString(5, account.getFullName());
            ppStmt.setDate(6, (Date) account.getDob());
            ppStmt.setString(7, account.getPhoneNumber());
            ppStmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }

    public boolean updateAccount(Account account) {
        try (Connection conn = getConnection()) {
            if (getAccountByUsernameAndRole(account.getUsername(), account.getRole()) == null) {
                return false;
            }
            String stmt = "update account set username = ?, password = ?, email = ?, role = ?, fullName = ?, dob = ?, phoneNumber = ?)";
            PreparedStatement ppStmt = conn.prepareStatement(stmt);
            ppStmt.setString(1, account.getUsername());
            ppStmt.setString(3, account.getPassword());
            ppStmt.setString(2, account.getEmail());
            ppStmt.setString(4, account.getRole());
            ppStmt.setString(5, account.getFullName());
            ppStmt.setDate(6, (Date) account.getDob());
            ppStmt.setString(7, account.getPhoneNumber());
            ppStmt.executeUpdate();
            return true;
        } catch (SQLException err) {
            throw new RuntimeException();
        }
    }

    public boolean deleteAccount(String id) {
        try (Connection conn = getConnection()) {
            String stmt = "DELETE FROM account WHERE id = " + id;
            PreparedStatement ppStmt = conn.prepareStatement(stmt);
            ppStmt.executeUpdate();
            return true;
        } catch (SQLException err) {
            throw new RuntimeException();
        }
    }
}
