package com.dev4fun.model;

import java.util.ArrayList;
import java.util.Date;

public class Product {
    private int id;
    private int categoryId;
    private String name;
    private String description;
    private String imageLink;
    private String imageList;
    private float price;
    private Date createdAt;

    private ArrayList<ProductDetail> productDetails;

    public Product() {
        this.productDetails = new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public String getImageLink() {
        return imageLink;
    }

    public String getImageList() {
        return imageList;
    }

    public float getPrice() {
        return price;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }

    public void setImageList(String imageList) {
        this.imageList = imageList;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public void setProductDetails(ArrayList<ProductDetail> productDetails) {
        this.productDetails = productDetails;
    }
}
