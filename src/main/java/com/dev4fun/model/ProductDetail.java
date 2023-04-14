package com.dev4fun.model;

public class ProductDetail {
    private int id;
    private String product_id;
    private String size;
    private int quantity;

    public ProductDetail() {
    }

    public int getId() {
        return id;
    }

    public String getProduct_id() {
        return product_id;
    }

    public String getSize() {
        return size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
