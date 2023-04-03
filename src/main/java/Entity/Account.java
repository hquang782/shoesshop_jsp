/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 * @author son
 */
public class Account {
    private int id;
    private String username, password, fullname, email, dob, phone_num;
    private int role;

    public Account() {
    }

    public Account(int id, String username, String password, String fullname, String email, String dob, String phone_num) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.email = email;
        this.dob = dob;
        this.phone_num = phone_num;
    }

    public int getId() {
        return id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone_num() {
        return phone_num;
    }

    public void setPhone_num(String phone_num) {
        this.phone_num = phone_num;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }


    public String getUsername() {
        return username;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", username=" + username + ", password=" + password + ", fullname=" + fullname + ", email=" + email + ", dob=" + dob + ", phone_num=" + phone_num + ", role=" + role + '}';
    }

}
