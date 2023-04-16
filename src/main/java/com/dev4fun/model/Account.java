package com.dev4fun.model;

import java.util.Date;

public class Account {
    private int id;
    private String username;
    private String email;
    private String password;
    private String role;
    private String fullName;
    private String imageLink;
    private Date dob;
    private String phoneNumber;


    public Account() {

    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getRole() {
        return role;
    }

    public String getFullName() {
        return fullName;
    }

    public String getImageLink() {
        return imageLink;
    }

    public Date getDob() {
        return dob;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }


    public void setDob(Date dob) {
        this.dob = dob;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", role='" + role + '\'' +
                ", fullName='" + fullName + '\'' +
                ", imageLink='" + imageLink + '\'' +
                ", dob=" + dob +
                ", phoneNumber='" + phoneNumber + '\'' +
                '}';
    }
}
