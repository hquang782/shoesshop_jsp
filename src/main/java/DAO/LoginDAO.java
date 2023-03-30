/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entity.Account;
import Utils.DBconnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author son
 */
public class LoginDAO {
    Connection con;
    PreparedStatement ps;
    ResultSet res;
    public Account checkLogin(String username,String password)
    {
        try {
            String query="SELECT * FROM shoes.accounts where username=? and password=?";
            con=new DBconnect().connectDB();
            ps=con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            res=ps.executeQuery();
            while(res.next())
            {
                Account a=new Account(res.getInt("id"),res.getString("username"),res.getString("password"),res.getString("fname"),res.getString("email"),res.getString("dob"),res.getString("phone_number"));
                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }
}
