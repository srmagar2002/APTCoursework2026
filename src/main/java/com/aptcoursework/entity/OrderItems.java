package com.aptcoursework.entity;


import java.math.BigDecimal;

public class OrderItems {

    private int orderItemId;
    private int orderId;
    private int laptopId;
    private int quantity;
    private BigDecimal price;
    private Laptop laptop;

    // parameterized constructor
    public OrderItems(int orderId, int laptopId, int quantity, BigDecimal price) {
        this.orderId = orderId;
        this.laptopId = laptopId;
        this.quantity = quantity;
        this.price = price;
    }

    public Laptop getLaptop() {
        return laptop;
    }

    public void setLaptop(Laptop laptop){
        this.laptop = laptop;
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

    public BigDecimal getPrice() { return price;}

    public int getQuantity() {
        return quantity;
    }
}
