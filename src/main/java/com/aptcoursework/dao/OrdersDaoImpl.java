package com.aptcoursework.dao;

import com.aptcoursework.entity.Cart;
import com.aptcoursework.entity.Orders;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrdersDaoImpl implements OrdersDao{

    cartDao cartdao = new cartDaoImpl();
    LaptopDao laptopdao = new LaptopDaoImpl();
    @Override
    public boolean placeOrder(int userId) {

//        getting cart Items
        ArrayList<Cart> cartItems = cartdao.fetchCartItems();

//        getting total amount
        BigDecimal totalAmount = new BigDecimal(0);
        for(Cart cartItem: cartItems){
            BigDecimal price = laptopdao.getLaptopById(cartItem.getLaptopId()).getPrice();
            BigDecimal quantity = new BigDecimal(cartItem.getQuantity());
            totalAmount.add(price.multiply(quantity));
        }


        Connection conn = null;

        try{


        }catch(Exception e){

        }


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
