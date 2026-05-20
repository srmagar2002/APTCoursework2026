package com.aptcoursework.dao;

import com.aptcoursework.entity.Orders;

import java.util.ArrayList;

/**
 * Data Access Object (DAO) interface for managing Order-related database operations.
 *
 * <p>This interface defines the contract for performing CRUD (Create, Read, Update)
 * and analytical operations on the {@code Orders} entity. It provides methods for
 * managing customer orders, including placement, retrieval, status updates, and
 * sales analytics.</p>
 *
 * <p>Implementations of this interface handle all database interactions related to
 * orders, including calculating total revenues and sales metrics by time period.</p>
 *
 * <p>This abstraction ensures separation of business logic from data access logic,
 * enabling flexible implementations and easier testing.</p>
 *
 * @author Kushal Puri
 * @author Sugam Rana Magar
 */
public interface OrdersDao {
    boolean placeOrder(int userId, ArrayList<Integer> laptopIds); // ← updated
    ArrayList<Orders> fetchOrdersByUser(int userId);
    Orders fetchOrderById(int orderId, int userId);
    boolean updateOrderStatus(int orderId, String status);
    ArrayList<Orders> fetchAllOrders();
    int countAllOrders();

    double sumTotalAmount();
    double sumTotalAmountCurrentMonth();
    double sumTotalAmountLastMonth();
}
