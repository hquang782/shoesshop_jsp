package com.dev4fun.model;

public class BillDetail {
    private int id;
    private int quantity;
    private Product product;
    private Bill bill;
    private float amount;

    public BillDetail() {

    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
    }

    public int getId() {
        return id;
    }

    public int getQuantity() {
        return quantity;
    }

    public float getAmount() {
        return amount;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }
}
