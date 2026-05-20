package com.aptcoursework.dao;

import com.aptcoursework.entity.Cart;
import com.aptcoursework.entity.Orders;
import com.aptcoursework.utils.DatabaseConnection;

import java.math.BigDecimal;
import java.sql.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

/**
 * Implementation class for the {@link OrdersDao} interface.
 *
 * <p>This class provides concrete database operations for managing customer orders.
 * It handles order placement, retrieval, status updates, and sales analytics calculations.
 * It interacts with both the orders and order_items tables using JDBC.</p>
 *
 * <p>The class includes operations such as:</p>
 * <ul>
 *   <li>Placing new orders and creating associated order items</li>
 *   <li>Retrieving orders by user or by order ID</li>
 *   <li>Updating order status during fulfillment</li>
 *   <li>Fetching all orders for administrative purposes</li>
 *   <li>Calculating sales metrics and revenue analytics</li>
 * </ul>
 *
 * <p>All database interactions are performed using JDBC with the
 * {@code DatabaseConnection} utility class managing connections.</p>
 *
 * @author Kushal Puri
 * @author Sugam Rana Magar
 */
public class OrdersDaoImpl implements OrdersDao{

    cartDao cartdao = new cartDaoImpl();
    LaptopDao laptopdao = new LaptopDaoImpl();

//    sql queries
    String ordersSql = "INSERT INTO ORDERS (userId, totalAmount, status, estimatedDelivery) VALUES (?, ?, ?, ?)";
    String orderItemsSql = "INSERT INTO order_items (orderId, laptopId, quantity, price) VALUES (?, ?, ?, ?)";

    /**
     * Places a new order for a user with selected cart items.
     * Calculates total amount including tax and shipping, creates order record,
     * and inserts associated order items. Removes ordered items from cart.
     *
     * @param userId the user placing the order
     * @param laptopIds list of laptop IDs selected for purchase
     * @return {@code true} if order placed successfully, {@code false} otherwise
     */
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
            LocalDateTime estimatedDelivery = LocalDateTime.now().plusDays(5);
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

    /**
     * Retrieves all orders for a specific user, ordered by creation date (newest first).
     *
     * @param userId the user ID
     * @return list of orders for the user, or {@code null} if error occurs
     */
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

    /**
     * Retrieves a specific order by ID with security verification.
     * Ensures the order belongs to the requesting user to prevent unauthorized access.
     *
     * @param orderId the order ID
     * @param userId the user ID (security check)
     * @return the Order object, or {@code null} if not found or access denied
     */
    @Override
    public Orders fetchOrderById(int orderId, int userId) {
        // userId is checked in WHERE clause for security
        // so User A cannot view User B's order by guessing the orderId
        String sql = "SELECT * FROM orders WHERE orderId = ? AND userId = ?";
        Connection conn = null;

        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, orderId);
            stmt.setInt(2, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Orders order = new Orders(
                        rs.getInt("userId"),
                        rs.getDouble("totalAmount"),
                        rs.getString("status"),
                        rs.getTimestamp("estimatedDelivery")
                );
                order.setOrderId(rs.getInt("orderId"));
                order.setCreatedAt(rs.getTimestamp("createdAt"));
                return order;
            }
            return null; // not found or doesn't belong to this user

        } catch (SQLException e) {
            System.out.println("Error fetching order by id: " + e.getMessage());
            return null;
        } finally {
            DatabaseConnection.closeConnection(conn);
        }
    }

    /**
     * Updates the status of an order.
     *
     * @param orderId the order ID to update
     * @param status the new status value
     * @return {@code true} if update successful, {@code false} otherwise
     */
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

    /**
     * Retrieves all orders in the system with associated usernames (admin function).
     * Orders are sorted by creation date (newest first).
     *
     * @return list of all orders, or {@code null} if error occurs
     */
    @Override
    public ArrayList<Orders> fetchAllOrders(){
        ArrayList<Orders> orders = new ArrayList<>();
        String sql = "SELECT o.orderId, o.userId, o.totalAmount, o.status, o.estimatedDelivery, o.createdAt, u.username FROM orders o LEFT JOIN users u ON o.userID = u.user_id ORDER BY createdAt DESC";
        Connection conn = null;

        try{
            conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Orders order = new Orders(
                        rs.getInt("orderId"),
                        rs.getInt("userId"),
                        rs.getDouble("totalAmount"),
                        rs.getString("status"),
                        rs.getTimestamp("estimatedDelivery"),
                        rs.getTimestamp("createdAt"),
                        rs.getString("username")
                );
                orders.add(order);
            }
            System.out.println("Total Orders: "+orders.size());
            return orders;
        }
        catch(SQLException e){
            System.out.println("Error while fetching orders " +  e.getMessage());
            return null;
        }
        finally {
            DatabaseConnection.closeConnection(conn);
        }
    }

    /**
     * Counts the total number of orders in the system.
     *
     * @return total order count, or 0 if error occurs
     */
    @Override
    public int countAllOrders() {
        Connection conn = null;
        String sql = "SELECT COUNT(*) FROM orders";
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error in getting orders" + e.getMessage());
            return 0;
        } finally {
            DatabaseConnection.closeConnection(conn);
        }
        return 0;
    }

    /**
     * Calculates the sum of total amount across all orders.
     *
     * @return total revenue from all orders, or 0 if error occurs or no orders exist
     */
    @Override
    public double sumTotalAmount(){
        Connection conn = null;
        String sql = "select SUM(totalAmount) from orders;";
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getDouble(1);
            }
        }
        catch (SQLException e){
            System.out.println("Error in getting Total Amount" + e.getMessage());
            return 0;
        }
        finally {
            DatabaseConnection.closeConnection(conn);
        }
        return 0;
    }

    /**
     * Calculates the sum of total amount for orders placed in the current month.
     *
     * @return total revenue for current month, or 0 if error occurs or no orders exist
     */
    @Override
    public double sumTotalAmountCurrentMonth(){
        Connection conn = null;
        String sql = "SELECT SUM(totalAmount) FROM orders WHERE YEAR(createdAt) = YEAR(NOW()) AND MONTH(createdAt) = MONTH(NOW())";
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                double result = rs.getDouble(1);
                // Handle NULL result from SUM
                return rs.wasNull() ? 0 : result;
            }
        }
        catch (SQLException e){
            System.out.println("Error in getting Total Amount" + e.getMessage());
            return 0;
        }
        finally {
            DatabaseConnection.closeConnection(conn);
        }
        return 0;
    }

    /**
     * Calculates the sum of total amount for orders placed in the previous month.
     *
     * @return total revenue for last month, or 0 if error occurs or no orders exist
     */
    @Override
    public double sumTotalAmountLastMonth(){
        Connection conn = null;
        String sql = "SELECT SUM(totalAmount) FROM orders WHERE YEAR(createdAt) = YEAR(DATE_SUB(NOW(), INTERVAL 1 MONTH)) AND MONTH(createdAt) = MONTH(DATE_SUB(NOW(), INTERVAL 1 MONTH))";
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                double result = rs.getDouble(1);
                // Handle NULL result from SUM
                return rs.wasNull() ? 0 : result;
            }
        }
        catch (SQLException e){
            System.out.println("Error in getting Total Amount" + e.getMessage());
            return 0;
        }
        finally {
            DatabaseConnection.closeConnection(conn);
        }
        return 0;

    }
}
