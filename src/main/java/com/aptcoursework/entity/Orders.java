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
    private String username;
    private ArrayList<OrderItems> orderItems;

    public Orders() {}

    public Orders(int orderId, int userId, double totalAmount, String status, Timestamp estimatedDelivery, Timestamp createdAt,String username) {
        this.orderId = orderId;
        this.userId = userId;
        this.totalAmount = totalAmount;
        this.status = status;
        this.estimatedDelivery = estimatedDelivery;
        this.createdAt = createdAt;
        this.username = username;
    }

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

    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }


//    Helper method for dynamic status
    public String getDynamicStatus() {
        if (createdAt == null) return "PREPARING";

        LocalDateTime now      = LocalDateTime.now();
        LocalDateTime ordered  = createdAt.toLocalDateTime();
        LocalDateTime delivery = estimatedDelivery.toLocalDateTime();

        if (now.isAfter(delivery)) {
            return "DELIVERED";
        } else if (now.isAfter(ordered.plusDays(2))) {
            return "OUT_FOR_DELIVERY";
        } else if (now.isAfter(ordered.plusDays(1).plusHours(12))) {
            return "SHIPPED";
        } else if (now.isAfter(ordered.plusHours(12))) {
            return "IN_TRANSIT";
        } else {
            return "PREPARING";
        }
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }
}
