package com.aptcoursework.dao;

import com.aptcoursework.entity.Cart;
import com.aptcoursework.entity.Orders;
import com.aptcoursework.utils.DatabaseConnection;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.time.LocalDate;
import java.util.ArrayList;

public class OrdersDaoImpl implements OrdersDao{

    cartDao cartdao = new cartDaoImpl();
    LaptopDao laptopdao = new LaptopDaoImpl();

//    sql queries
    String ordersSql = "INSERT INTO ORDERS (userId, totalAmount, status, estimatedDelivery) VALUES (?, ?, ?, ?)";
    String orderItemsSql = "INSERT INTO order_items (orderId, laptopId, quantity) VALUES (?, ?, ?)";

    @Override
    public boolean placeOrder(int userId) {

//        getting cart Items
        ArrayList<Cart> cartItems = cartdao.fetchCartItemsByUserId(userId);

//        getting total amount
        BigDecimal totalAmount = new BigDecimal(0);
        for(Cart cartItem: cartItems){
            BigDecimal price = laptopdao.getLaptopById(cartItem.getLaptopId()).getPrice();
            BigDecimal quantity = new BigDecimal(cartItem.getQuantity());
            totalAmount.add(price.multiply(quantity));

        }


        Connection conn = null;

        try{

//            Inserting into orders
            conn = DatabaseConnection.getConnection();
            PreparedStatement statement = conn.prepareStatement(ordersSql);
            statement.setInt(1, userId);
            statement.setBigDecimal(2, totalAmount);
            statement.setString(3, "PREPARING");

            LocalDate deliveryDate = LocalDate.now().plusDays(3);
            statement.setDate(4, java.sql.Date.valueOf(deliveryDate));
            statement.executeUpdate();

//            get generated OrderId
//            It is used to extract the currently generated id from sql.
            ResultSet rs = statement.getGeneratedKeys();
            int orderId = 0;
            if(rs.next()){
                orderId = rs.getInt(1);
            }

//            Inserting into order_items
            PreparedStatement itemStmt = conn.prepareStatement(orderItemsSql);
            for(Cart cartItem: cartItems){
                itemStmt.setInt(1, orderId);
                itemStmt.setInt(2, cartItem.getLaptopId());
                itemStmt.setInt(3, cartItem.getQuantity());
//                The add batch holds all the records in the list;
                itemStmt.addBatch();
            }
//            The executeBatch will execute all the stored list of statements and will return array of integer.
            itemStmt.executeBatch();
            return true;

        }catch(SQLException e){
            System.out.println("Error while placing order: "+e.getMessage());
            return false;

        }finally{
            DatabaseConnection.closeConnection(conn);
        }
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
