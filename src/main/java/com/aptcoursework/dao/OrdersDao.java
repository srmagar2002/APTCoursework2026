package com.aptcoursework.dao;

import com.aptcoursework.entity.Orders;

import java.util.ArrayList;

public interface OrdersDao {
    boolean placeOrder(int userId, ArrayList<Integer> laptopIds); // ← updated
    ArrayList<Orders> fetchOrdersByUser(int userId);
    boolean updateOrderStatus(int orderId, String status);
}
