package com.aptcoursework.entity;


import java.math.BigDecimal;

/**
 * Represents an individual line item in a customer order.
 * Contains details about a specific laptop product, its quantity, and price in an order.
 *
 * @author Kushal Puri
 */
public class OrderItems {

    private int orderItemId;
    private int orderId;
    private int laptopId;
    private int quantity;
    private BigDecimal price;
    private Laptop laptop;

    /**
     * Constructs an OrderItems instance with order, laptop, quantity, and price details.
     * Used for creating new order items.
     *
     * @param orderId identifier of the order this item belongs to
     * @param laptopId identifier of the laptop product in this order item
     * @param quantity number of units of the laptop
     * @param price price per unit of the laptop at the time of order
     */
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
