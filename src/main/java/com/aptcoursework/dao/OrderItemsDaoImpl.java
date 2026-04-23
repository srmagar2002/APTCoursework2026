package com.aptcoursework.dao;

import com.aptcoursework.entity.OrderItems;
import com.aptcoursework.utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrderItemsDaoImpl implements OrderItemsDao {


    @Override
    public ArrayList<OrderItems>  getItemsByOrderId(int orderId) {

        String getItems = "SELECT * FROM order_items WHERE orderId = ?";
        Connection conn = null;

        try{
            conn = DatabaseConnection.getConnection();
            PreparedStatement statement = conn.prepareStatement(getItems);
            statement.setInt(1, orderId);
            ResultSet rs = statement.executeQuery();




        } catch (SQLException e) {


        }


        return null;
    }
}
