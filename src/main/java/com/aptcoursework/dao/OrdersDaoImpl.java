package com.aptcoursework.dao;

import com.aptcoursework.entity.Cart;
import com.aptcoursework.entity.Orders;
import com.aptcoursework.utils.DatabaseConnection;

import java.math.BigDecimal;
import java.sql.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class OrdersDaoImpl implements OrdersDao{

    cartDao cartdao = new cartDaoImpl();
    LaptopDao laptopdao = new LaptopDaoImpl();

//    sql queries
    String ordersSql = "INSERT INTO ORDERS (userId, totalAmount, status, estimatedDelivery) VALUES (?, ?, ?, ?)";
    String orderItemsSql = "INSERT INTO order_items (orderId, laptopId, quantity, price) VALUES (?, ?, ?, ?)";

    @Override
    public boolean placeOrder(int userId, ArrayList<Integer> laptopIds) {

//        getting cart Items
        ArrayList<Cart> cartItems = cartdao.fetchCartItemsByUserId(userId);
        ArrayList<Cart> checkedItems = new ArrayList<>();

//        Adding only checked items of cart in checkedItems
        for(Cart item : cartItems){
            if(laptopIds.contains(item.getLaptopId())){
                checkedItems.add(item);
            }
        }

//        Checking if the checked item is empty
        if (checkedItems.isEmpty()){
            System.out.println("No items Selected for order");
            return false;
        }

//        Calculation of Total Amount for checked items only
        BigDecimal totalAmount = BigDecimal.ZERO;
        BigDecimal shipping = new BigDecimal("100.00");

        for(Cart item : checkedItems){
            BigDecimal price = laptopdao.getLaptopById(item.getLaptopId()).getPrice();
            BigDecimal quantity = new BigDecimal(item.getQuantity());
//            reassigned to the created variable
            totalAmount = totalAmount.add(price.multiply(quantity));
        }

//        Adding shipping and tax
        BigDecimal tax = totalAmount.multiply(new BigDecimal("0.10"));
        BigDecimal total = totalAmount.add(shipping).add(tax);


        Connection conn = null;
        try{

//            Inserting into orders
            conn = DatabaseConnection.getConnection();
            PreparedStatement statement = conn.prepareStatement(ordersSql,
                    Statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, userId);
            statement.setBigDecimal(2, total);
            statement.setString(3, "PREPARING");

//           Adding shipping logic using multi-converting
            LocalDateTime estimatedDelivery = LocalDateTime.now().plusDays(3);
            Timestamp deliveryDate = Timestamp.valueOf(estimatedDelivery);
            statement.setTimestamp(4, deliveryDate);
            statement.executeUpdate();

//            get generated OrderId
//            It is used to extract the currently generated id from sql.
            ResultSet rs = statement.getGeneratedKeys();
            int orderId = 0;
            if(rs.next()){
                orderId = rs.getInt(1);
            }

//            Checking for generated Id
            if(orderId == 0){
                System.out.println("Failed to get Generated orderId");
                return false;
            }


//            Inserting the order items into orderItems table
            PreparedStatement itemStmt = conn.prepareStatement(orderItemsSql);
            for(Cart item: checkedItems){

                BigDecimal itemPrice    = laptopdao.getLaptopById(item.getLaptopId()).getPrice();
                BigDecimal itemQuantity = new BigDecimal(item.getQuantity());

                // Base price for this item only (price × quantity)
                BigDecimal itemSubtotal = itemPrice.multiply(itemQuantity);

                itemStmt.setInt(1, orderId);
                itemStmt.setInt(2, item.getLaptopId());
                itemStmt.setInt(3, item.getQuantity());
                itemStmt.setBigDecimal(4, itemSubtotal); // just base price to show no shipping/tax

//                The add batch holds all the records in the list;
                itemStmt.addBatch();
            }
//            The executeBatch will execute all the stored list of statements and will return array of integer.
            itemStmt.executeBatch();

            // Delete only the ordered (checked) items from cart
            for (Cart item : checkedItems) {
                cartdao.deleteItem(userId, item.getLaptopId());
            }

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

        ArrayList<Orders> orders = new ArrayList<>();

        // JOIN with order_items to also fetch items for each order
        String sql = "SELECT * FROM ORDERS WHERE userId = ? ORDER BY createdAt DESC";
        Connection conn = null;

        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Orders order = new Orders(
                        rs.getInt("userId"),
                        rs.getDouble("totalAmount"),
                        rs.getString("status"),
                        rs.getTimestamp("estimatedDelivery")
                );
                order.setOrderId(rs.getInt("orderId"));
                order.setCreatedAt(rs.getTimestamp("createdAt"));
                orders.add(order);
            }
            return orders;

        } catch (SQLException e) {
            System.out.println("Error fetching orders: " + e.getMessage());
            return null;
        } finally {
            DatabaseConnection.closeConnection(conn);
        }

    }




//    Its implementation is halt for now if any updates comes up from member, will be implemented accordingly
    @Override
    public boolean updateOrderStatus(int orderId, String status) {
        String sql = "UPDATE ORDERS SET status = ? WHERE orderId = ?";
        Connection conn = null;

        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, status);
            stmt.setInt(2, orderId);
            int rows = stmt.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            System.out.println("Error updating order status: " + e.getMessage());
            return false;
        } finally {
            DatabaseConnection.closeConnection(conn);
        }
    }
}
