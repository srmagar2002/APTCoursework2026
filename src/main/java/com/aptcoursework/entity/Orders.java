package com.aptcoursework.entity;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

public class Orders {

    private int orderId;
    private int userId;
    private double totalAmount;
    private String status;
    private Date estimatedDelivery;
    private Timestamp createdAt;
    private ArrayList<OrderItems> orderItems;


    public Orders(int userId, double totalAmount, String status, Date estimatedDelivery) {
        this.userId = userId;
        this.totalAmount = totalAmount;
        this.status = status;
        this.estimatedDelivery = estimatedDelivery;
    }

    public int getOrderId() {
        return orderId;
    }

    public ArrayList<OrderItems> getItems(){
        return orderItems;
    }

    public void setOrderItems(ArrayList<OrderItems> orderItems){
        this.orderItems = orderItems;
    }

    public int getUserId() {
        return userId;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public Date getEstimatedDelivery() {
        return estimatedDelivery;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }
}
