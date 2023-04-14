package com.dev4fun.model;

public class BillDetail {
    private int id;
    private int quantity;
    private int productId;
    private int billId;
    private float amount;

    public BillDetail() {

    }

    public int getId() {
        return id;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getProductId() {
        return productId;
    }

    public int getBillId() {
        return billId;
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

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setBillId(int billId) {
        this.billId = billId;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }
}
