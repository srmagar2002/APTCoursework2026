package com.aptcoursework.entity;


public class OrderItems {

    private int orderItemId;
    private int orderId;
    private int laptopId;
    private int quantity;

    // parameterized constructor
    public OrderItems(int orderId, int laptopId, int quantity) {
        this.orderId = orderId;
        this.laptopId = laptopId;
        this.quantity = quantity;
    }

    public int getOrderItemId() {
        return orderItemId;
    }

    public int getOrderId() {
        return orderId;
    }

    public int getLaptopId() {
        return laptopId;
    }

    public int getQuantity() {
        return quantity;
    }
}
