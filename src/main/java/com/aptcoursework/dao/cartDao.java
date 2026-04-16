package com.aptcoursework.dao;

import com.aptcoursework.entity.Cart;
import com.aptcoursework.entity.Laptop;
import com.aptcoursework.entity.User;

import java.util.ArrayList;

public interface cartDao {

    boolean addToCart(User user, Laptop laptop);
    ArrayList<Cart> fetchCartItems();
    boolean addItem(Laptop laptop);
    boolean deleteItem(Laptop laptop);


}
