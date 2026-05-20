package com.aptcoursework.entity;


import java.sql.Timestamp;

/**
 * Represents a shopping cart item linking a user to a laptop product.
 * Tracks the quantity of a specific laptop in a user's cart.
 *
 * @author Kushal Puri
 */
public class Cart {
    private int cartId;
    private int userId;
    private int laptopId;
    private int quantity;
    private Laptop laptop;

    /**
     * Constructs a Cart instance with user, laptop, and quantity details.
     * Used for creating new cart items without database-assigned cart ID.
     *
     * @param userId the user who owns this cart item
     * @param laptopId the laptop product in the cart
     * @param quantity the number of units of this laptop
     */
    public Cart(int userId, int laptopId, int quantity){
        this.userId = userId;
        this.laptopId = laptopId;
        this.quantity = quantity;
    }

    /**
     * Constructs a Cart instance with all fields including database-assigned cart ID.
     * Used for retrieving existing cart items from the database.
     *
     * @param cartId database primary key for this cart item
     * @param userId the user who owns this cart item
     * @param laptopId the laptop product in the cart
     * @param quantity the number of units of this laptop
     */
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




