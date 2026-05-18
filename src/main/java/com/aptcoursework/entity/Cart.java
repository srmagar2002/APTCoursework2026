package com.aptcoursework.entity;


import java.sql.Timestamp;

public class Cart {
    private int cartId;
    private int userId;
    private int laptopId;
    private int quantity;
    private Laptop laptop;


    public Cart(int userId, int laptopId, int quantity){
        this.userId = userId;
        this.laptopId = laptopId;
        this.quantity = quantity;
    }

    public Cart(int cartId, int userId, int laptopId, int quantity){
        this.cartId = cartId;
        this.userId = userId;
        this.laptopId = laptopId;
        this.quantity = quantity;
    }

    public Laptop getLaptop() {
        return laptop;
    }

    public void setLaptop(Laptop laptop){
        this.laptop = laptop;
    }

    public int getCartId() {
        return cartId;
    }

    public int getUserId() {
        return userId;
    }

    public int getLaptopId() {
        return laptopId;
    }

    public int getQuantity() {
        return quantity;
    }

    @Override
    public String toString(){
        return "cartID "+cartId + "productID "+ laptopId + "User ID "+ userId + "quantity "+ quantity;
    }
}




