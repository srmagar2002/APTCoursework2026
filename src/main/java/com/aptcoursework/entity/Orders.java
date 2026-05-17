package com.aptcoursework.entity;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class Orders {

    private int orderId;
    private int userId;
    private double totalAmount;
    private String status;
    private Timestamp estimatedDelivery;
    private Timestamp createdAt;
    private ArrayList<OrderItems> orderItems;


    public Orders(int userId, double totalAmount, String status, Timestamp estimatedDelivery) {
        this.userId = userId;
        this.totalAmount = totalAmount;
        this.status = status;
        this.estimatedDelivery = estimatedDelivery;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
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

    public Timestamp getEstimatedDelivery() {
        return estimatedDelivery;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }
}
