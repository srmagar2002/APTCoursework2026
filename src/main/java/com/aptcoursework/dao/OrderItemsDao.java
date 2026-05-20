package com.aptcoursework.dao;

import com.aptcoursework.entity.OrderItems;

import java.util.ArrayList;

/**
 * Data Access Object (DAO) interface for managing OrderItems-related database operations.
 *
 * <p>This interface defines the contract for retrieving and managing individual
 * line items within customer orders. It provides methods to fetch order items
 * associated with a specific order.</p>
 *
 * <p>Implementations of this interface handle database interactions for the
 * {@code OrderItems} entity, allowing the retrieval of detailed product information
 * within orders.</p>
 *
 * @author Kushal Puri
 */
public interface OrderItemsDao {
    ArrayList<OrderItems> getItemsByOrderId(int orderId);
}
