package com.aptcoursework.dao;

import com.aptcoursework.entity.Cart;

import java.util.ArrayList;

public interface cartDao {

    boolean addToCart(int userId, int laptopId);
    ArrayList<Cart> fetchCartItemsByUserId(int userId);
    boolean reduceItem(int userId, int laptopId);
    boolean deleteItem(int userId, int laptopId);



}
