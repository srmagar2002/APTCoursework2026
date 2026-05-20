package com.aptcoursework.entity;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

/**
 * Represents a customer order containing one or more laptop products.
 * Tracks order status, total amount, estimated delivery, and associated order items.
 *
 * @author Kushal Puri
 */
public class Orders {

    private int orderId;
    private int userId;
    private double totalAmount;
    private String status;
    private Timestamp estimatedDelivery;
    private Timestamp createdAt;
    private String username;
    private ArrayList<OrderItems> orderItems;

    /**
     * Default constructor that creates an empty Orders instance.
     */
    public Orders() {}

    /**
     * Constructs a complete Orders instance with all fields including database-assigned order ID.
     * Used for retrieving existing orders from the database.
     *
     * @param orderId database primary key for the order
     * @param userId identifier of the user who placed the order
     * @param totalAmount total purchase amount of the order
     * @param status current status of the order (e.g., PREPARING, SHIPPED, DELIVERED)
     * @param estimatedDelivery estimated delivery timestamp
     * @param createdAt order creation timestamp
     * @param username username of the customer who placed the order
     * 
     * @author Sugam Rana Magar
     */
    public Orders(int orderId, int userId, double totalAmount, String status, Timestamp estimatedDelivery, Timestamp createdAt,String username) {
        this.orderId = orderId;
        this.userId = userId;
        this.totalAmount = totalAmount;
        this.status = status;
        this.estimatedDelivery = estimatedDelivery;
        this.createdAt = createdAt;
        this.username = username;
    }

    /**
     * Constructs an Orders instance without a database-assigned order ID.
     * Used for creating new orders without retrieving from the database.
     *
     * @param userId identifier of the user placing the order
     * @param totalAmount total purchase amount of the order
     * @param status current status of the order
     * @param estimatedDelivery estimated delivery timestamp
     */
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
