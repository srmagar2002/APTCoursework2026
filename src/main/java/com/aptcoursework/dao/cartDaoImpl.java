package com.aptcoursework.dao;


import com.aptcoursework.entity.Laptop;
import com.aptcoursework.utils.DatabaseConnection;
import com.aptcoursework.entity.Cart;


import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.ArrayList;

public class cartDaoImpl implements cartDao {

//    Queries to perform add and delete operation.
    String checkLaptop = "SELECT QUANTITY FROM CART WHERE userId = ? AND laptopId = ?";
    String insertLaptop = "INSERT INTO CART(userId, laptopId, quantity) VALUES (?,?,?)";
    String addQuantity = "UPDATE cart SET quantity = quantity + 1 WHERE userId=? AND laptopId = ?";
    String deleteQuantity = "UPDATE cart SET quantity = quantity - 1 WHERE userId=? AND laptopId=?";
    String deleteItem = "DELETE FROM cart WHERE userId=? AND laptopId=?";


    /**
     * Adds a laptop to the user's cart.
     * If the laptop already exists in the cart, increments its quantity by 1.
     * If it does not exist, inserts a new row with quantity = 1.
     */
    public boolean addToCart(int userId, int laptopId){

         Connection conn = null;
         try{
             conn = DatabaseConnection.getConnection();
             PreparedStatement checkStatement = conn.prepareStatement(checkLaptop);
             checkStatement.setInt(1, userId);
             checkStatement.setInt(2, laptopId);
             ResultSet rs = checkStatement.executeQuery();

            if(rs.next()){
//                Item already exist and should be updated
                PreparedStatement updStatement = conn.prepareStatement(addQuantity);
                updStatement.setInt(1, userId);
                updStatement.setInt(2, laptopId);
                int numb = updStatement.executeUpdate();
                System.out.println(numb+ " rows have been updated");
                return true;

            }
            else{
//                Insert new one
                PreparedStatement insertStm = conn.prepareStatement(insertLaptop);
                insertStm.setInt(1, userId);
                insertStm.setInt(2, laptopId);
                insertStm.setInt(3, 1);

                int numb = insertStm.executeUpdate();
                System.out.println(numb+ " rows have been updatd");
                return true;
            }

         }catch(SQLException e){
             System.out.println("Error while adding cart "+ e.getMessage());
             return false;

         }finally{
             DatabaseConnection.closeConnection(conn);
         }

    }


    /**
     * Fetches all cart items for a specific user.
     * Uses a JOIN between cart and laptop tables so the JSP gets
     * full laptop details (title, price, image, specs) alongside cart data.
     * Returns ArrayList of Cart objects, each containing an embedded Laptop object.
     */


    public ArrayList<Cart> fetchCartItemsByUserId(int userId){
        ArrayList<Cart> cartItems = new ArrayList<>();

        Connection conn = null;
        try{
            conn = DatabaseConnection.getConnection();
            String sql = "SELECT c.cartId, c.userId, c.laptopId, c.quantity, l.title, l.price, l.thumbnailUrl," +
                         " l.processor, l.ram, l.storage, l.color " +
                         "FROM cart c JOIN laptop l " +
                         "ON c.laptopId = l.laptopId " +
                         "WHERE userId = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, userId);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                Cart cartItem = new Cart(
                        rs.getInt("cartId"),
                        rs.getInt("userId"),
                        rs.getInt("laptopId"),
                        rs.getInt("quantity")
                );

                Laptop laptop = new Laptop();
                laptop.setTitle(rs.getString("title"));
                laptop.setPrice(rs.getBigDecimal("price"));
                laptop.setThumbnailUrl(rs.getString("thumbnailUrl"));
                laptop.setProcessor(rs.getString("processor"));
                laptop.setRam(rs.getString("ram"));
                laptop.setStorage(rs.getString("storage"));
                laptop.setColor(rs.getString("color"));

                cartItem.setLaptop(laptop);
                cartItems.add(cartItem);
            }
            return cartItems;

        }catch(SQLException e){
            System.out.println("Error while fetching "+ e.getMessage());
            return null;
        }finally {
            DatabaseConnection.closeConnection(conn);
        }
    }


    /**
     * Reduces the quantity of a specific laptop in the cart by 1.
     * If quantity is already 1, does nothing and returns false.
     * Deletion when quantity reaches 0 is handled separately by deleteItem().
     */
    public boolean reduceItem(int userId, int laptopId){

        Connection conn = null;
        try{
            conn = DatabaseConnection.getConnection();
            PreparedStatement checkStmt = conn.prepareStatement(checkLaptop);
            checkStmt.setInt(1, userId);
            checkStmt.setInt(2, laptopId);
            ResultSet rs = checkStmt.executeQuery();

            if(rs.next()){
//                if laptop found
                int quantity = rs.getInt("quantity");

                if(quantity > 1){
                    PreparedStatement reduceStmt = conn.prepareStatement(deleteQuantity);
                    reduceStmt.setInt(1, userId);
                    reduceStmt.setInt(2, laptopId);
                    int numb = reduceStmt.executeUpdate();
                    System.out.println(numb+" rows have been update !");
                    return true;
                }else{
                    return false;
                }

            }

        }catch(SQLException e){
            System.out.println("Error while deleting quantity "+e.getMessage());
            return false;
        }finally{
            DatabaseConnection.closeConnection(conn);
        }
        return false;

    }




    /**
     * Permanently removes a specific laptop from the user's cart.
     * Both userId and laptopId are used in WHERE clause for security —
     * prevents a user from deleting another user's cart item.
     */
    public boolean deleteItem(int userId, int laptopId){

        Connection conn = null;
        try{
            conn = DatabaseConnection.getConnection();
            PreparedStatement deleteStmt = conn.prepareStatement(deleteItem);
            deleteStmt.setInt(1, userId);
            deleteStmt.setInt(2, laptopId);
            int numb = deleteStmt.executeUpdate();
            System.out.println(numb+" rows have been affected");
            return true;

        }catch(SQLException e){
            System.out.println("Error while deleting "+e.getMessage());
            return false;

        }finally{
            DatabaseConnection.closeConnection(conn);
        }
    }
}
