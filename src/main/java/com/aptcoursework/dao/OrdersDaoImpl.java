package com.aptcoursework.dao;

import com.aptcoursework.entity.Orders;

import java.util.ArrayList;

public class OrdersDaoImpl implements OrdersDao{
    @Override
    public boolean placeOrder(int userId) {
        return false;
    }

    @Override
    public ArrayList<Orders> fetchOrdersByUser(int userId) {
        return null;
    }

    @Override
    public boolean updateOrderStatus(int orderId, String status) {
        return false;
    }
}
