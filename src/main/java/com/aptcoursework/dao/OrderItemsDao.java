package com.aptcoursework.dao;

import com.aptcoursework.entity.OrderItems;

import java.util.ArrayList;

public interface OrderItemsDao {
    ArrayList<OrderItems> getItemsByOrderId(int orderId);
}
