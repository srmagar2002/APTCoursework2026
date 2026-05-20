package com.aptcoursework.dao;

import com.aptcoursework.entity.Laptop;
import com.aptcoursework.entity.OrderItems;
import com.aptcoursework.utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Implementation class for the {@link OrderItemsDao} interface.
 *
 * <p>This class provides concrete database operations for retrieving order items.
 * It fetches individual line items associated with customer orders, including
 * related laptop product details.</p>
 *
 * <p>The class handles:</p>
 * <ul>
 *   <li>Retrieving order items by order ID</li>
 *   <li>Joining with the laptop table to fetch product information</li>
 *   <li>Populating OrderItems with laptop details for display</li>
 * </ul>
 *
 * <p>All database interactions are performed using JDBC with connections managed
 * through the {@code DatabaseConnection} utility class.</p>
 *
 * @author Kushal Puri
 */
public class orderItemsDaoImpl implements OrderItemsDao{

    @Override
    public ArrayList<OrderItems> getItemsByOrderId(int orderId) {
        ArrayList<OrderItems> items = new ArrayList<>();

        // JOIN with laptops table to get name, image, price for display
        String sql = "SELECT oi.orderItemId, oi.orderId, oi.laptopId, oi.quantity, oi.price, " +
                "l.title, l.thumbnailUrl, l.brand " +
                "FROM order_items oi " +
                "JOIN laptop l ON oi.laptopId = l.laptopID " +
                "WHERE oi.orderId = ?";

        Connection conn = null;
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                OrderItems item = new OrderItems(
                        rs.getInt("orderId"),
                        rs.getInt("laptopId"),
                        rs.getInt("quantity"),
                        rs.getBigDecimal("price")
                );
                Laptop laptop = new Laptop();
                laptop.setTitle(rs.getString("title"));
                laptop.setThumbnailUrl(rs.getString("thumbnailUrl"));
                laptop.setBrand(rs.getString("brand"));

                item.setLaptop(laptop);
                items.add(item);
            }
            return items;

        } catch (SQLException e) {
            System.out.println("Error fetching order items: " + e.getMessage());
            return null;
        } finally {
            DatabaseConnection.closeConnection(conn);
        }
    }

}

