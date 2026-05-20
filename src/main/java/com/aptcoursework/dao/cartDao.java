package com.aptcoursework.dao;

import com.aptcoursework.entity.Cart;

import java.util.ArrayList;

/**
 * Data Access Object (DAO) interface for managing Cart-related database operations.
 *
 * <p>This interface defines the contract for performing CRUD and retrieval
 * operations on the {@code Cart} entity. It is responsible for interacting
 * with the database layer to manage shopping cart items for users.</p>
 *
 * <p>Implementations of this interface handle operations such as adding items
 * to cart, retrieving cart items, reducing quantities, and deleting items from cart.</p>
 *
 * <p>This abstraction allows separation of business logic from data access logic,
 * making the system more modular and maintainable.</p>
 *
 * @author Kushal Puri
 */
public interface cartDao {

    boolean addToCart(int userId, int laptopId);
    ArrayList<Cart> fetchCartItemsByUserId(int userId);
    boolean reduceItem(int userId, int laptopId);
    boolean deleteItem(int userId, int laptopId);



}
